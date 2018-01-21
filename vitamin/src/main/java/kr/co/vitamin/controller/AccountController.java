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
import org.springframework.http.HttpRequest;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.Terms;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.ResumeService;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	private SchoolLevelService schoolService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private EmailSender email;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
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
			
			List<BusinessType> busType = resumeService.businessTypeSelect();
			
			/* 임시 코드 */
			List<BusinessType> busType2 = new ArrayList<>();
			for(BusinessType bus : busType) {
				if(bus.getBusinessOrder() == 0) {
					busType2.add(bus);
				}
			}
			model.addAttribute("busType", busType2);
			/* 임시 코드 */
		}
		model.addAttribute("newLine", newLine);
		model.addAttribute("termsList", termsList);
		model.addAttribute("slList", list);
		model.addAttribute("todayDate", new Date());
	}

	@RequestMapping(value = "/signup.do", method=RequestMethod.POST)
	public String signup(AccountInfo accountSignupVO, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
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
			
			redirectAttributes.addFlashAttribute("user", (Account)accountSignupVO);
			resultUrl = "redirect:/account/signupSuccess.do";
		} else {
			redirectAttributes.addFlashAttribute("errorMsg", "");
			resultUrl = "redirect:/account/signupForm.do";
		}
		return resultUrl;
	}
	
	@RequestMapping("/signupSuccess.do")
	public void signupSuccess(/*HttpServletRequest request*/) {
		//System.out.println(request.getAttribute("user"));
		//System.out.println(((Account)request.getAttribute("user")).toString());
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
				session.setAttribute("user2", memberVO);
				
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
	
	@RequestMapping(value = "/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String referer = request.getHeader("Referer");
		Account accountVO = (Account)session.getAttribute("user");
		
		if(accountVO != null) {
			Cookie cookie = WebUtils.getCookie(request, "AUTO_SIGNIN");
			if(cookie != null) {
				AutoSignin autoSignin = new AutoSignin();
				autoSignin.setAuthToken(cookie.getValue());
				
				cookie.setMaxAge(0);
				cookie.setPath("/");
				
				accountService.logout(autoSignin);
				response.addCookie(cookie);
			}
		}
		session.invalidate();
		return "redirect:" + referer;
	}
	
	@ResponseBody
	@RequestMapping("/googleLogin.do")
	public String googleLogin() {
		OAuth2Operations oAuth2Operations = googleConnectionFactory.getOAuthOperations();
		String url = oAuth2Operations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		return url;
	}
	
	@RequestMapping("/googleLoginCallBack.do")
	public String googleLoginCallBack(String code) {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		
		if(expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		
		Member member = new Member();
		member.setApiLoggin("GOOGLE");
		member.setId(profile.getId());
		member.setEmail(profile.getId());
		member.setPwd("-1");
		
		return null;
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