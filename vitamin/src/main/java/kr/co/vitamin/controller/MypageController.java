package kr.co.vitamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	/*@Autowired
	private ResumeService resumeService;*/
	
	@RequestMapping("/resumeList.do")
	public void resumeList() throws Exception{
		System.out.println("asokdsfpokasdfpoksadfpok");
		
	}
	
	@RequestMapping("/resumeInfo.do")
	public void resumeInfo() throws Exception{
		System.out.println("resumeInfo 들어옴");
	}
	
	@RequestMapping("/introductionList.do")
	public void introductionList() throws Exception{
		System.out.println("introductionList 들어옴");
	}
	
	@RequestMapping("/introductionDetail.do")
	public void introductionDetail() throws Exception{
		System.out.println("introductionDetail 들어옴");
	}
	
	@RequestMapping("/calendar.do")
	public void calendar() throws Exception{}
	
	@RequestMapping("/myInfo.do")
	public void myInfo() throws Exception{}
	
	@RequestMapping("/fullcalendartest.do")
	public void fullcalendarTest() throws Exception{}
	
	@RequestMapping("/saveResumeInfo.do")
	public void saveResumeInfo() throws Exception{
		
	}
	
	@RequestMapping("/intermediateSave.do")
	@ResponseBody
	public String intermediateSave() throws Exception{
		return "r";
	}
	

}
