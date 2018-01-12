package kr.co.vitamin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.service.IntroductionService;

@Controller
@RequestMapping("/mypage")
public class IntroductionController {
	
	
	
	/*@Autowired
	private IntroductionService IntroductionService;*/
	
	
	@RequestMapping("/introductionList.do")
	public void introductionList() throws Exception{
		System.out.println("introductionList 들어옴");
	}
	
	@RequestMapping("/introductionDetail.do")
	public void introductionDetail() throws Exception{
		System.out.println("introductionDetail 들어옴");
	}
	
	@RequestMapping("/introductionForm.do")
	public void introductionForm() throws Exception{
		System.out.println("introductionForm 들어옴");
	}

}
