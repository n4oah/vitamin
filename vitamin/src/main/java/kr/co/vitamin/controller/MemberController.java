package kr.co.vitamin.controller;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.service.MemberService;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private SchoolLevelService schoolService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/signupForm.do")
	public void signupForm(Model model) throws Exception {
		List<SchoolLevel> list = schoolService.getSchoolLevels();
		
		String newLine = "\n";
		
		StringBuffer terms = new StringBuffer();
		
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = f.newDocumentBuilder();
		
		Resource resource = new ClassPathResource("string/terms.xml");
		InputStream xmlFile = resource.getInputStream();
		
		Document xmlDoc = parser.parse(xmlFile);
		
		Element root = xmlDoc.getDocumentElement();
		
		NodeList n1 = root.getElementsByTagName("terms");
		for(int i = 0; i < n1.getLength(); i++) {
		    Node bookNode = n1.item(i);
		    Element bookElement = (Element)bookNode;
		    
		    String id = bookElement.getAttribute("id");
		
			if(id.equals("private-collect")) {
				String str = bookElement.getElementsByTagName("content").item(0).getTextContent().trim();
				String tmp[] = str.split("\n");
				for(int zz = 0; zz < tmp.length; zz ++) {
					terms.append(tmp[zz].trim() + newLine);
				}
		    }
		}
		model.addAttribute("newLine", newLine);
		model.addAttribute("terms", terms.toString());
		model.addAttribute("slList", list);
		model.addAttribute("todayDate", new Date());
	}

	@RequestMapping("/signup.do")
	public String signup(Member memberVO) throws Exception {
		
		return "";
	}
	
	@RequestMapping("/idOverlapChk.do")
	@ResponseBody
	public boolean idOverlapCheck(String id) throws Exception {
		
		return false;
	}
}