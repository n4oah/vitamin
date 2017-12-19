package kr.co.vitamin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	/*@Autowired
	private ResumeService resumeService;*/
	
	@RequestMapping("/resumelist.do")
	public void ResumeList() throws Exception{}
	
	@RequestMapping("/resumeinfo.do")
	public void ResumeInfo() throws Exception{}
	
	@RequestMapping("/introductionlist.do")
	public void IntroductionList() throws Exception{}
	
	@RequestMapping("/introductiondetail.do")
	public void IntroductionDetail() throws Exception{}
	
	@RequestMapping("/calendar.do")
	public void Calendar() throws Exception{}

}
