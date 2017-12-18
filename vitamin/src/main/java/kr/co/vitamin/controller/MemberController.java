package kr.co.vitamin.controller;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("/signupForm.do")
	public String signup() throws Exception {
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse("http://api.saramin.co.kr/job-search");
		
		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList cols = (NodeList) xpath.compile("//*/job/id").evaluate(document, XPathConstants.NODESET);

		for (int idx = 0; idx < cols.getLength(); idx++) {
			String id = xpath.compile("//*/job/id").evaluate(document);
			String name = xpath.compile("//*/job/name").evaluate(document);
			String salary = xpath.compile("//*/job/salary").evaluate(document);
			String postingTimestamp = xpath.compile("//*/job/posting-timestamp").evaluate(document);
			System.out.println("id: "+id+" name: "+name+" salary: "+salary+" time"+postingTimestamp);
		}

		return null;
	}
}