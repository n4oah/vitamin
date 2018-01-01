package kr.co.vitamin.controller;

import java.beans.PropertyEditorSupport;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.Terms;
import kr.co.vitamin.repository.vo.member.Member;
import kr.co.vitamin.repository.vo.member.MemberSignup;
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
		List<Terms> termsList = new ArrayList<Terms>();
		
		String newLine = "\n";
		
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
		    
		    Terms terms = new Terms();
		
		    String title = bookElement.getElementsByTagName("title").item(0).getTextContent().trim();
			String content = bookElement.getElementsByTagName("content").item(0).getTextContent().trim();
			String tmp[] = content.split("\n");
			
			StringBuffer str = new StringBuffer();
			for(int zz = 0; zz < tmp.length; zz ++) {
				str.append(tmp[zz].trim() + newLine);
			}
			terms.setTitle(title);
			terms.setContent(str.toString());
			termsList.add(terms);
		}
		model.addAttribute("newLine", newLine);
		model.addAttribute("termsList", termsList);
		model.addAttribute("slList", list);
		model.addAttribute("todayDate", new Date());
	}

	@RequestMapping("/signup.do")
	public String signup(MemberSignup memberSignupVO, Model model) throws Exception {
		Member memberVO = memberSignupVO.getMember();
		Address address = memberSignupVO.getAddress();
		EmailToken emailTok = memberSignupVO.getEmailTok();
		if(idOverlapCheck(memberVO) == false) {
			emailTok.setToken(UUID.randomUUID().toString());
			
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, 7);
			Date deleteDate = calendar.getTime();
			emailTok.setDeleteDate(deleteDate);
			
			memberService.signupMember(memberVO, address, emailTok);
			
			model.addAttribute("n", "n");
			return "redirect:/member/signupSuccess.do";
		}
		throw new Exception();
	}
	
	@RequestMapping("signupSuccess.do")
	public void singupSuc() throws Exception {
		
	}
	
	@RequestMapping("/idOverlapChk.do")
	@ResponseBody
	public boolean idOverlapCheck(Member memberVO) throws Exception {
		return memberService.getOverlapIdCheck(memberVO);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
	        public void setAsText(String text) throws IllegalArgumentException {
	            try {
	                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
	            } catch (ParseException e) {
	                setValue(null);
	            }
	        }
	    });
	}
}
/*
Address [addressNo=null, cityCode=null, areaCode=null, address=null, postCode=06267, address1=서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩), address2=gdfgsdfg, sigunguCode=11680]
0d576c81c36a7aed9979cefa98cbf8c2e46c83ffb69a1d3654ebc9056ca978131559052f6bd8b231e7daf1b90e691b14ffed1b3a7b9bb07d0a1da0074e927fd4
MemberSignup [address=Address [addressNo=null, cityCode=11, areaCode=680, address=서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩)gdfgsdfg, postCode=06267, address1=서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩), address2=gdfgsdfg, sigunguCode=11680], email1=sdfhsdf, email2=hsdfhsd.com]
Address [addressNo=null, cityCode=11, areaCode=680, address=서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩)gdfgsdfg, postCode=06267, address1=서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩), address2=gdfgsdfg, sigunguCode=11680]*/