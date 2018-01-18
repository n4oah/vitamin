package kr.co.vitamin.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.common.FileUpload;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.EmailChangeAuth;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.InfiniteScrollAccount;
import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.AddressService;
import kr.co.vitamin.service.EmailAuthService;
import kr.co.vitamin.service.RecruitApplyService;

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
	RecruitApplyService recruitApplyService;
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
	
	@ResponseBody
	@RequestMapping("/emailAuthSend.do")
	public void emailAuthSend(HttpSession session, EmailChangeAuth changeAuth) throws Exception {
		Random random = new Random();
		String randomAuth = (random.nextInt(999999) + 1) + "";
		
		changeAuth.setAccountNo(((Account)session.getAttribute("user")).getAccountNo());
		changeAuth.setAuthToken(randomAuth);
		
		emailSend.sendMail(changeAuth.getChangeEmail(), "[INIT] 이메일 변경 인증번호", "ㅇㅇㅇㅇㅇㅇ<br/>" + changeAuth.getAuthToken());
		
		emailAuthService.insertEmailChangeAuth(changeAuth);
	}
	
	@ResponseBody
	@RequestMapping("/emailAuth.do")
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
	public String myInfoModify(HttpSession session, AccountInfo accountInfo, @RequestParam("profileImg")MultipartFile profileImg) throws Exception {
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
		address.setAddressNo(user.getAddressNo());
		address.parseData();
		
		File file = fileUpload.makeFile(profileImg, FileUpload.getProfileImage());
		Account acc = accountService.modifyAccount(accountVO, address, file);

		session.setAttribute("user", acc);
		
		return "redirect:/mypage/myInfo.do";
	}
	
	@ResponseBody
	@RequestMapping("/myProfile.do")
	public Integer myProfile(Account accountVO) throws Exception {
		Integer profileNo = accountService.getProfileNo(accountVO);
		
		if(profileNo == null)
			profileNo = -1;
		
		return profileNo;
	}
	
	@ResponseBody
	@RequestMapping("/myRecuritList.do")
	public String myRecuritList(HttpSession session, Integer lastCompanyApplyNo) throws Exception {
		Member member = (Member)session.getAttribute("user");
		
		InfiniteScrollAccount infiniteScrollAccount = new InfiniteScrollAccount();
		infiniteScrollAccount.setAccountNo(member.getMemberNo());
		infiniteScrollAccount.setLastSeqNo(lastCompanyApplyNo);

		List<CompanyApply> list = recruitApplyService.getMemberRecuritList(infiniteScrollAccount);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("/favoriteCompanyList.do")
	public String favoriteCompanyList(HttpSession session) throws Exception {
		Member member = (Member)session.getAttribute("user");
		
		return null;
	}
}