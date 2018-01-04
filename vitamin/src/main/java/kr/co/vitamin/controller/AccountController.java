package kr.co.vitamin.controller;

import java.beans.PropertyEditorSupport;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.Terms;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountSignup;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	private SchoolLevelService schoolService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private EmailSender email;
	
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

	@RequestMapping(value = "/signup.do", method=RequestMethod.POST)
	public String signup(AccountSignup accountSignupVO, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		String resultUrl = null;
		System.out.println(accountSignupVO);
		
		accountSignupVO.parseData();
		
		Address address = accountSignupVO.getAddress();
		EmailToken emailTok = accountSignupVO.getEmailTok();
		
		if(idOverlapCheck(accountSignupVO) == false) {
			accountSignupVO.setShaPwd(accountSignupVO.getPwd());
			accountSignupVO.setEmailTokenStatus(1);
			
			emailTok.setShaToken(UUID.randomUUID().toString());
			
			InetAddress inet = Inet4Address.getLocalHost();
			String url = "http://" + inet.getHostAddress() + ":" + request.getLocalPort() + request.getContextPath() + "/account/certify.do?token=" + emailTok.getToken();
			
			StringBuffer content = new StringBuffer();
			content.append("<h3>INIT - 이메일 인증 코드</h3>");
			content.append("<a href='" + url +"'>인증하기</a><br/>");
			email.sendMail(accountSignupVO.getEmail(), "[INIT] 회원가입 인증 코드", content.toString());
			
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, 7);
			Date deleteDate = calendar.getTime();
			emailTok.setDeleteDate(deleteDate);
			
			accountService.signupMember(accountSignupVO, address, emailTok);
			
			model.addAttribute("n", "n");
			resultUrl = "redirect:/account/signupSuccess.do";
		} else {
			redirectAttributes.addFlashAttribute("errorMsg", "");
			resultUrl = "redirect:/account/signupForm.do";
		}
		return resultUrl;
	}
	
	@RequestMapping("signupSuccess.do")
	public void singupSuc() throws Exception {
		
	}
	
	@RequestMapping("/idOverlapChk.do")
	@ResponseBody
	public boolean idOverlapCheck(Account memberVO) throws Exception {
		return accountService.getOverlapIdCheck(memberVO);
	}
	
	@RequestMapping(value = "/certify.do", method=RequestMethod.GET)
	public String emailCertify(EmailToken emailTok) throws Exception {
		accountService.emailCertify(emailTok);
		return "redirect:/account/signinForm.do";
	}
	
	@RequestMapping("/signinForm.do")
	public void signinForm() throws Exception {
		
	}
	
	@RequestMapping(value = "/signin.do", method=RequestMethod.POST)
	public String signin(HttpSession session, Account memberVO, @RequestParam(value="autoSignin", defaultValue="0")Integer autoSignin,
						@RequestParam(value="idSave", defaultValue="0")Integer idSave, RedirectAttributes redirectAttributes,
						 @CookieValue(value="AUTO_SIGNIN", required=false)Cookie cookie,
						 HttpServletResponse response) throws Exception {
		String viewUrl = "redirect:/account/signinForm.do";
		
		memberVO.setShaPwd(memberVO.getPwd());
		
		Account memVo = accountService.login(memberVO);
		
		if(memVo == null) {
			redirectAttributes.addFlashAttribute("errorMsg", "아이디가 존재하지 않거나, 비밀번호가 틀렷습니다.");
		}
		else {
			if(memVo.getEmailTokenStatus() == 2) {
				session.setAttribute("user", memVo);
				
				if(autoSignin == 1) {
					HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
					
					Calendar calendar = Calendar.getInstance();
					calendar.add(Calendar.DATE, 90);
					
					AutoSignin autoSigninVO = new AutoSignin();
					autoSigninVO.setAccountNo(memVo.getAccountNo());
					autoSigninVO.setDeleteDate(calendar.getTime());
					autoSigninVO.setIp(req.getRemoteAddr());
					
					if(cookie != null) {
						cookie.setMaxAge(0);
						autoSigninVO.setAuthToken(cookie.getValue());
						accountService.deleteAutoSignin(autoSigninVO);
						response.addCookie(cookie);
					}
					autoSigninVO.makeAuthToken();
					cookie = new Cookie("AUTO_SIGNIN", autoSigninVO.getAuthToken());
					cookie.setMaxAge(7776000);
					cookie.setPath("/");
					accountService.setAutoSignin(autoSigninVO);
					
					response.addCookie(cookie);
				} else if(idSave == 1) {
					
				}
				
				viewUrl = "redirect:/main.do";
			} else {
				redirectAttributes.addFlashAttribute("errorMsg", "이메일 인증이 완료되지 않았습니다, 7일 이내로 이메일을 확인해주세요.");
			}
		}
		return viewUrl;
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