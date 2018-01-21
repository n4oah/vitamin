package kr.co.vitamin.common.auto;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.context.annotation.Configuration;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;

@Configuration
public class AutoVOCreater extends HttpServlet {
	private String typeAliasesPackage;
	private String mapperLocations;
	private String mapperName;

	// ---------------------------- web.xml servlet read -----------------------------//
	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			setTypeAliasesPackage(config.getInitParameter("typeAliasesPackage"));
			setMapperLocations(config.getInitParameter("mapperLocations"));
			setMapperName(config.getInitParameter("mapperName"));

			make();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	// ----------------------------- all class files read ---------------------------//
	public void make() throws Exception {
		String classExt = ".class";

		URL packageDir = Thread.currentThread().getContextClassLoader()
				.getResource(typeAliasesPackage.replace(".", "/"));
		List<Class<?>> list = new ArrayList<>();
		File packageList = new File(packageDir.getFile());

		if(packageList.exists()) {
			List<File> fileList = new ArrayList<File>(Arrays.asList(packageList.listFiles()));
			for(int i = 0; i < fileList.size(); i++) {
				File file = fileList.get(i);

				String fileName = file.getName();

				/* if it a package, add it to the files inside */
				if(!fileName.endsWith(classExt)) {
					if(file.isDirectory() == true) {
						List<File> fileList2 = new ArrayList<File>(Arrays.asList(file.listFiles()));
						fileList.addAll(fileList2);
					}
					continue;
				}

				/* if this extension not '.class' continue */
				if(!fileName.endsWith(classExt)) {
					continue;
				}

				String packpage = file.getParent().replace("\\", ".");

				packpage = packpage.substring(packpage.lastIndexOf(typeAliasesPackage));
				fileName = fileName.substring(0, fileName.length() - classExt.length());

				Class<?> c = Class.forName(packpage + "." + fileName);
				list.add(c);
			}
		}

		makeVOXML(list);
	}

	// -------------------------- class file annotation check -----------------------------//
	private void makeVOXML(List<Class<?>> list) throws Exception {
		Set<String> clzType = new HashSet<>();
		clzType.add("String");
		clzType.add("Integer");
		clzType.add("Double");
		clzType.add("Long");
		clzType.add("Float");
		clzType.add("Character");
		clzType.add("Short");
		clzType.add("Date");
		
		Map<String, DiscriminatorMap> discriminatorMaps = new HashMap<>();
		List<ResultMap> resultMaps = new ArrayList<ResultMap>();
		for(Class<?> clz : list) {
			if(clz.isAnnotationPresent(AutoVO.class) == true) {
				ResultMap resultMap = new ResultMap();
				List<Result> results = new ArrayList<Result>();

				String simpleName = clz.getSimpleName().substring(0, 1).toLowerCase()
						+ clz.getSimpleName().substring(1);
				resultMap.setType(simpleName);
				resultMap.setId(simpleName + "Map");
				
				Field[] fields = clz.getDeclaredFields();

				String parentName = null;
				if(!(parentName = clz.getSuperclass().getSimpleName() + "Map").equals("ObjectMap")) {
					resultMap.setParentName(parentName.substring(0, 1).toLowerCase() + parentName.substring(1));
				}
				
				if(clz.isAnnotationPresent(Discriminator.class) == true) {
					Discriminator discriminator = clz.getAnnotation(Discriminator.class);
					
					String key = resultMap.getParentName();
					if(discriminatorMaps.containsKey(key)) {
						List<DiscriminatorCase> temp = discriminatorMaps.get(key).getDiscriminatorCase();
						DiscriminatorCase caseTemp = new DiscriminatorCase();
						
						caseTemp.setValue(discriminator.value());
						caseTemp.setResultMap(resultMap.getId());
						
						temp.add(caseTemp);
					} else {
						DiscriminatorMap temp = new DiscriminatorMap();
						DiscriminatorCase caseTemp = new DiscriminatorCase();
						
						caseTemp.setValue(discriminator.value());
						caseTemp.setResultMap(resultMap.getId());
						
						temp.getDiscriminatorCase().add(caseTemp);
						
						discriminatorMaps.put(key, temp);
					}
				}

				for(Field field : fields) {
					/* field have AutoVO_annotation */
					if(field.isAnnotationPresent(AutoVO.class) == true) {
						if(clzType.contains(field.getType().getSimpleName()) == false
								|| field.getType().isArray() == true)
							continue;

						Result result = new Result();

						AutoVO annotation = field.getAnnotation(AutoVO.class);
						result.setId(annotation.id());

						String column = "", prop = field.getName();

						char[] fieldName = prop.toCharArray();
						for(Character cha : fieldName) {
							String co = cha + "";

							if(Character.isUpperCase(cha) == true) {
								co = "_" + co;
							}
							column += co;
						}

						result.setColumnName(column.toLowerCase());
						result.setPropName(prop);
						
						if(field.isAnnotationPresent(Discriminator.class) == true) {
							DiscriminatorMap temp = null;
							if(discriminatorMaps.containsKey(resultMap.getId())) {
								temp = discriminatorMaps.get(resultMap.getId());
								temp.setColumn(result.getColumnName());
								temp.setType(field.getType().getName());
							} else {
								temp = new DiscriminatorMap();
								temp.setColumn(result.getColumnName());
								temp.setType(field.getType().getName());
								discriminatorMaps.put(resultMap.getId(), temp);
							}
							result.setDiscriminator(temp);
						}
						
						results.add(result);
					}
				}
				if(results.size() > 0) {
					resultMap.setResults(results);
					resultMaps.add(resultMap);
				}
			}
		}
		makeVOXML2(resultMaps);
	}

	// ---------------------------- vo.xml file write ----------------------//
	private void makeVOXML2(List<ResultMap> list) throws Exception {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

		Document doc = docBuilder.newDocument();

		Element mapper = doc.createElement("mapper");
		mapper.setAttribute("namespace", "AutoVO");
		doc.appendChild(mapper);

		for(ResultMap resultMM : list) {
			Element resultMap = doc.createElement("resultMap");
			if(resultMM.getParentName() != null) {
				resultMap.setAttribute("extends", resultMM.getParentName());
			}
			resultMap.setAttribute("type", resultMM.getType());
			resultMap.setAttribute("id", resultMM.getId());

			mapper.appendChild(resultMap);

			Element discriminator = null;
			List<Element> _discrCase = new ArrayList<>();
			int index = 0, length = resultMM.getResults().size();
			for(Result resulTT : resultMM.getResults()) {
				String resultName = null;
				if(resulTT.isId() == true) {
					resultName = "id";
				} else {
					resultName = "result";
				}

				Element result = doc.createElement(resultName);
				result.setAttribute("column", resulTT.getColumnName());
				result.setAttribute("property", resulTT.getPropName());
				resultMap.appendChild(result);
				
				if(resulTT.isDiscriminatorEmploy() == true) {
					DiscriminatorMap discriminatorMap = resulTT.getDiscriminator();
					
					discriminator = doc.createElement("discriminator");
					discriminator.setAttribute("javaType", discriminatorMap.getType());
					discriminator.setAttribute("column", discriminatorMap.getColumn());
					
					for(DiscriminatorCase discrCase : discriminatorMap.getDiscriminatorCase()) {
						Element _discrCase_ = doc.createElement("case");
						_discrCase_.setAttribute("value", discrCase.getValue());
						_discrCase_.setAttribute("resultMap", discrCase.getResultMap());
						_discrCase.add(_discrCase_);
					}
				}
				
				if(index == length - 1) {
					if(discriminator != null) {
						resultMap.appendChild(discriminator);
						
						for(Element discrCase : _discrCase) {
							discriminator.appendChild(discrCase);
						}
					}
				}
				
				index++;
			}
		}

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();

		DOMImplementation domImpl = doc.getImplementation();
		DocumentType doctype = domImpl.createDocumentType("doctype", "-//mybatis.org//DTD Mapper 3.0//EN",
				"http://mybatis.org/dtd/mybatis-3-mapper.dtd");

		transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
		transformer.setOutputProperty(OutputKeys.STANDALONE, "");

		/* indent amount 4(tab size) */
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

		transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, doctype.getPublicId());
		transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, doctype.getSystemId());

		DOMSource source = new DOMSource(doc);

		URL packageDir = Thread.currentThread().getContextClassLoader().getResource(mapperLocations);
		File file = new File(packageDir.getPath());
		StreamResult resultzz = new StreamResult(new FileOutputStream(file + "/" + mapperName));

		transformer.transform(source, resultzz);
	}

	public String getMapperName() {
		return mapperName;
	}

	public void setMapperName(String mapperName) {
		this.mapperName = mapperName;
	}

	public void setMapperLocations(String mapperLocations) throws Exception {
		this.mapperLocations = mapperLocations;
	}

	public String getMapperLocations() {
		return mapperLocations;
	}

	public String getTypeAliasesPackage() {
		return typeAliasesPackage;
	}

	public void setTypeAliasesPackage(String typeAliasesPackage) {
		this.typeAliasesPackage = typeAliasesPackage;
	}
}

class Result {
	private String columnName, propName;
	private boolean id;
	private DiscriminatorMap discriminator;

	public String getColumnName() {
		return columnName;
	}
	
	public DiscriminatorMap getDiscriminator() {
		return discriminator;
	}

	public void setDiscriminator(DiscriminatorMap discriminator) {
		this.discriminator = discriminator;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getPropName() {
		return propName;
	}

	public void setPropName(String propName) {
		this.propName = propName;
	}

	public boolean isId() {
		return id;
	}

	public void setId(boolean id) {
		this.id = id;
	}
	
	public boolean isDiscriminatorEmploy() {
		if(discriminator == null || discriminator.getDiscriminatorCase() == null || discriminator.getDiscriminatorCase().size() <= 0)
			return false;
		return true;
	}
}

class ResultMap {
	private String id, type;
	private String parentName;
	private List<Result> results;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Result> getResults() {
		return results;
	}

	public void setResults(List<Result> results) {
		this.results = results;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
}

class DiscriminatorMap {
	private String type, column;
	private List<DiscriminatorCase> discriminatorCase;
	
	public DiscriminatorMap() {
		this.discriminatorCase = new ArrayList<>();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public List<DiscriminatorCase> getDiscriminatorCase() {
		return discriminatorCase;
	}

	public void setDiscriminatorCase(List<DiscriminatorCase> discriminatorCase) {
		this.discriminatorCase = discriminatorCase;
	}

	@Override
	public String toString() {
		return "DiscriminatorMap [type=" + type + ", column=" + column + ", discriminatorCase=" + discriminatorCase
				+ "]";
	}
}

class DiscriminatorCase {
	private String value;
	private String resultMap;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getResultMap() {
		return resultMap;
	}

	public void setResultMap(String resultMap) {
		this.resultMap = resultMap;
	}

	@Override
	public String toString() {
		return "DiscriminatorCase [value=" + value + ", resultMap=" + resultMap + "]";
	}
}