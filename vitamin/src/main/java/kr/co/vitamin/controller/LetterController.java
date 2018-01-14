package kr.co.vitamin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.LetterRes;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.LetterService;

@Controller
@RequestMapping("/letter")
public class LetterController {
	@Autowired
	LetterService letterService;
	@Autowired
	AccountService accountService;
	
	@ResponseBody
	@RequestMapping("/send.do")
	public boolean send(HttpSession session, Letter letterVO, Account account) throws Exception {
		System.out.println(letterVO.toString());
		letterVO.setSendAccountNo(((Account)session.getAttribute("user")).getAccountNo());
		
		return letterService.sendLetter(letterVO, account);
	}
	
	@ResponseBody
	@RequestMapping("/recvLetterList.do")
	public List<LetterRes> recvLetterList(HttpSession session, Integer lastLetterNo) throws Exception {
		Account account = (Account)session.getAttribute("user");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("accountNo", account.getAccountNo());
			
		if(lastLetterNo == -1 || lastLetterNo == null) {
			letterService.getPageRecvLetterList(map);
			map.put("lastLetterNo", letterService.getPageRecvFirstLetter(account.getAccountNo()));
		} else {
			map.put("lastLetterNo", lastLetterNo);
		}
		
		List<LetterRes> resultList = new ArrayList<>();
		List<Letter> letterList = letterService.getPageRecvLetterList(map);
		
		for(Letter let : letterList) {
			LetterRes letterRes = new LetterRes();
			
			letterRes.setLetter(let);
			
			Account sendAcc = accountService.getAccount(let.getSendAccountNo());
			if(sendAcc != null) {
				if(sendAcc.getMemberType() == 1) {
					letterRes.setProfileNo(accountService.getProfileNo(sendAcc));
					letterRes.setName(((Member)sendAcc).getName());
				} else if(sendAcc.getMemberType() == 2) {
					letterRes.setProfileNo(((Company)sendAcc).getLogoNo());
					letterRes.setName(((Company)sendAcc).getCompanyName());
				}
			}
			resultList.add(letterRes);
		}
		return resultList;
	}
	
	@ResponseBody
	@RequestMapping("/sendLetterList.do")
	public Map<String, List<Letter>> sendLetterList(HttpSession session, Integer lastLetterNo) throws Exception {
		Account account = (Account)session.getAttribute("user");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("accountNo", account.getAccountNo());
			
		if(lastLetterNo == -1 || lastLetterNo == null) {
			letterService.getPageRecvLetterList(map);
			map.put("lastLetterNo", letterService.getPageSendFirstLetter(account.getAccountNo()));
		} else {
			map.put("lastLetterNo", lastLetterNo);
		}
		
		List<Letter> letterList = letterService.getPageSendLetterList(map);
		return null;
	}
}
