package kr.co.vitamin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.service.LetterService;

@Controller
@RequestMapping("/letter")
public class LetterController {
	@Autowired
	LetterService letterService;
	
	@ResponseBody
	@RequestMapping("/send.do")
	public boolean send(HttpSession session, Letter letterVO, Account account) throws Exception {
		System.out.println(letterVO.toString());
		letterVO.setSendAccountNo(((Account)session.getAttribute("user")).getAccountNo());
		
		return letterService.sendLetter(letterVO, account);
	}
}
