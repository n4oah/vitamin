package kr.co.vitamin.common.auto;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.web.WebApplicationInitializer;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;

@Configuration
public class AutoVOCreater extends HttpServlet {
	private String typeAliasesPackage;
	private String mapperLocations;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
        try {
        	setTypeAliasesPackage(config.getInitParameter("typeAliasesPackage"));
        	setMapperLocations(config.getInitParameter("mapperLocations"));
        	make();
        } catch (Exception e){
        	e.printStackTrace();
        }
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

	public void make() throws Exception {
		String classExt = ".class";
		
		URL packageDir = Thread.currentThread().getContextClassLoader().getResource(typeAliasesPackage.replace(".", "/"));
		List<Class<?>> list = new ArrayList<>();
		File packageList = new File(packageDir.getFile());
		
		if(packageList.exists()) {
			List<File> fileList = new ArrayList<File>(Arrays.asList(packageList.listFiles()));
			for(int i = 0; i < fileList.size(); i++) {
				File file = fileList.get(i);
				
				String fileName = file.getName();
				
				if(!fileName.endsWith(classExt)) {
					continue;
				}
				
				if(!fileName.endsWith(classExt)) {
					if(file.isDirectory() == true) {
						List<File> fileList2 = new ArrayList<File>(Arrays.asList(file.listFiles()));
						fileList.addAll(fileList2);
					}
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
	
	private void makeVOXML(List<Class<?>> list) throws Exception {
		System.out.println("makeVOXML 호출");
		
		Set<String> clzType = new HashSet<>();
		clzType.add("String");
		clzType.add("Integer");
		clzType.add("Double");
		clzType.add("Long");
		clzType.add("Float");
		clzType.add("Character");
		clzType.add("Short");
		clzType.add("Date");
		
		List<ResultMap> resultMaps = new ArrayList<ResultMap>();
		for(Class<?> clz : list) {
			ResultMap resultMap = new ResultMap();
			List<Result> results = new ArrayList<Result>();
			
			String simpleName = clz.getSimpleName().substring(0, 1).toLowerCase() + clz.getSimpleName().substring(1);
			resultMap.setType(simpleName);
			resultMap.setId(simpleName + "Map");
			
			Field[] fields = clz.getDeclaredFields();
			
			for(Field field : fields) {
				if(clzType.contains(field.getType().getSimpleName()) == false || field.getType().isArray() == true)
					continue;
				
				Result result = new Result();
				
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
				results.add(result);
			}
			resultMap.setResults(results);
			resultMaps.add(resultMap);
		}
		makeVOXML2(resultMaps);
	}
	
	private void makeVOXML2(List<ResultMap> list) throws Exception {
		DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

		Document doc = docBuilder.newDocument();
		
		Element mapper = doc.createElement("mapper");
		mapper.setAttribute("namespace", "CommonMapper");
		doc.appendChild(mapper);
		
		for(ResultMap resultMM : list) {
			Element resultMap = doc.createElement("resultMap");
			resultMap.setAttribute("type", resultMM.getType());
			resultMap.setAttribute("id", resultMM.getId());
			mapper.appendChild(resultMap);
			
			for(Result resulTT : resultMM.getResults()) {
				Element result = doc.createElement("result");
				result.setAttribute("column", resulTT.getColumnName());
				result.setAttribute("property", resulTT.getPropName());
				resultMap.appendChild(result);
			}
		}

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		
		DOMImplementation domImpl = doc.getImplementation();
		DocumentType doctype = domImpl.createDocumentType("doctype",
				"-//mybatis.org//DTD Mapper 3.0//EN",
				"http://mybatis.org/dtd/mybatis-3-mapper.dtd");

		transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty(OutputKeys.STANDALONE, "");
		
		transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, doctype.getPublicId());
		transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, doctype.getSystemId());
		
		DOMSource source = new DOMSource(doc);
		
		URL packageDir = Thread.currentThread().getContextClassLoader().getResource(mapperLocations.replace("-", "/"));
		
		File file = new File(packageDir.getFile());
		StreamResult resultzz = new StreamResult(new FileOutputStream(file));

		transformer.transform(source, resultzz);
		
		System.out.println(file.getAbsolutePath());
		
		System.out.println("File saved!");
	}
}

class Result {
	private String columnName, propName;

	public String getColumnName() {
		return columnName;
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

	@Override
	public String toString() {
		return "Result [columnName=" + columnName + ", propName=" + propName + "]";
	}
}

class ResultMap {
	private String id, type;
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

	@Override
	public String toString() {
		return "ResultMap [id=" + id + ", type=" + type + ", results=" + results + "]";
	}
}