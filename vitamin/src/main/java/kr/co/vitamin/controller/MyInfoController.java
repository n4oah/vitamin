package kr.co.vitamin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.common.FileUpload;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailChangeAuth;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.AddressService;
import kr.co.vitamin.service.EmailAuthService;

@Controller
@RequestMapping("/mypage")
public class MyInfoController {
	@Autowired
	EmailAuthService emailAuthService;
	@Autowired
	AddressService addressService;
	@Autowired
	AccountService accountService;
	@Autowired
	EmailSender emailSend;
	@Autowired
	FileUpload fileUpload;
	
	@RequestMapping("/myInfo.do")
	public void myInfo(HttpSession session, Model model) throws Exception {
		Address address = new Address();
		address.setAddressNo(((Account)session.getAttribute("user")).getAddressNo());
		model.addAttribute("address", addressService.selectAddress(address));
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
		changeAuth = emailAuthService.getEmailChangeAuth(changeAuth);

		String result = "undefined";
		if(changeAuth != null) {
			result = changeAuth.getChangeEmail();
		}
		return result;
	}
	
	@RequestMapping("/myInfoModify.do")
	@ResponseBody
	public void myInfoModify(HttpSession session, AccountInfo accountInfo, @RequestParam("profileImg")MultipartFile profileImg) throws Exception {
		Account user = ((Account)session.getAttribute("user"));
		
		accountInfo.setAccountNo(user.getAccountNo());
		
		Account accountVO = null;
		if(user.getMemberType() == 1) {
			accountVO = accountInfo.getMember();
		} else if(user.getMemberType() == 2) {
			accountVO = accountInfo.getCompany();
		}
		accountVO.setMemberType(user.getMemberType());
		accountVO.setEmail(accountInfo.getEmail());
		accountVO.setAddressNo(user.getAddressNo());
		if(accountInfo.getPwd().length() > 4) {
			accountVO.setShaPwd(accountInfo.getPwd());			
		}
		
		Address address = accountInfo.getAddress();
		if(address.getSigunguCode().equals("-1")) {
			address = null;
		} else {
			address.setAddressNo(user.getAddressNo());
			address.parseData();
		}
		
		File file = fileUpload.makeFile(profileImg, FileUpload.getProfileImage());
		Account acc = accountService.modifyAccount(accountVO, address, file);

		session.setAttribute("user", acc);
	}
	
	@ResponseBody
	@RequestMapping("/myProfile.do")
	public Integer myProfile(HttpSession session) throws Exception {
		Integer profileNo = -1;
		
		Account member = (Account)session.getAttribute("user");
		if(member.getMemberType() == 1) {
			profileNo = accountService.getProfileNo(member);
			if(profileNo == null) {
				profileNo = -1;
			}
		}
		return profileNo;
	}
	
	
}