package kr.co.vitamin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.IntroductionService;

@Controller
@RequestMapping("/mypage")
public class IntroductionController {
	
	
	
	@Autowired
	private IntroductionService IntroductionService;
	
	
	@RequestMapping("/introductionList.do")
	public List<Introduction> introductionList(HttpSession session) throws Exception{
		
		System.out.println("introductionList 들어옴");
		Member user = (Member)session.getAttribute("user");
		
		
		List<Introduction> ilist = IntroductionService.selectIntroductionList(user.getMemberNo()); 
		
		
		return ilist;
		
	}
	
	@RequestMapping("/introductionDetail.do")
	public void introductionDetail() throws Exception{
		System.out.println("introductionDetail 들어옴");
	}
	
	@RequestMapping("/introductionForm.do")
	public void introductionForm() throws Exception{
		System.out.println("introductionForm 들어옴");
	}
	
	@RequestMapping("/introductionSave")
	public void introductionSave(HttpSession session, Introduction introduction, IntroductionCate introductionCate
			,String[] introductionCateTemp, String[] introductionCententTemp)throws Exception{
		System.out.println("introductionSave 들어옴");
		Member user = (Member)session.getAttribute("user");
		introduction.setMemberNo(user.getMemberNo());
		
		
		
		IntroductionService.insertIntroduction(introduction, introductionCate);
	}

}
