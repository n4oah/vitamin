package kr.co.vitamin.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.repository.vo.EmailChangeAuth;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.service.EmailAuthService;

@Controller
@RequestMapping("/mypage")
public class MyInfoController {
	@Autowired
	EmailAuthService emailAuthService;
	@Autowired
	EmailSender emailSend;
	
	@RequestMapping("/myInfo.do")
	public void myInfo() throws Exception {
		
	}
	
	@RequestMapping("/emailAuthSend.do")
	@ResponseBody
	public void emailAuthSend(HttpSession session, EmailChangeAuth changeAuth) throws Exception {
		Random random = new Random();
		String randomAuth = (random.nextInt(999999) + 1) + "";
		
		changeAuth.setAccountNo(((Account)session.getAttribute("user")).getAccountNo());
		changeAuth.setAuthToken(randomAuth);
		
		emailSend.sendMail(changeAuth.getChangeEmail(), "[INIT] 이메일 변경 인증번호", "ㅇㅇㅇㅇㅇㅇ<br/>" + changeAuth.getAuthToken());
		
		emailAuthService.insertEmailChangeAuth(changeAuth);
	}
	
	@RequestMapping("/emailAuth.do")
	@ResponseBody
	public String emailAuth(HttpSession session, EmailChangeAuth changeAuth) throws Exception {
		changeAuth.setAccountNo(((Account)session.getAttribute("user")).getAccountNo());
		changeAuth = emailAuthService.selectEmailChangeAuth(changeAuth);
		return changeAuth.getChangeEmail();
	}
}