package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.service.ResumeService;

@Controller
@RequestMapping("/mypage")
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping("/resumeList.do")
	public ModelAndView resumeList() throws Exception{
		System.out.println("resumeList 들어옴");
		ModelAndView mav = new ModelAndView();
		List<ResumeBaseInfo> rlist = resumeService.resumeList();
		System.out.println(rlist);
		for (ResumeBaseInfo resumeBaseInfo : rlist) {
			resumeBaseInfo.getResumeTitle();
		}
		mav.addObject("rlist",rlist);
		return mav;
		
	}
	
	@RequestMapping("/resumeInfo.do")
	public void resumeInfo(int resumeNo) throws Exception{
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
	public void fullcalendarTest() throws Exception{
		System.out.println("fullcalendartest 들어옴");
	}
	
	
	@RequestMapping("/saveResumeInfo.do")
	public void saveResumeInfo() throws Exception{
		System.out.println("saveResumeInfo 들어옴");
	}
	
	
	@RequestMapping("/resumeForm.do")
	public void resumeForm() throws Exception{
		System.out.println("resumeForm 들어옴");
	}
	
	
	@RequestMapping("/intermediateSave.do")
	public String intermediateSave(ResumeBaseInfo resumeBaseInfo) throws Exception{
		System.out.println("중간저장 들어옴");
		resumeService.resumeInsert(resumeBaseInfo);
		
		return "redirect:/mypage/resumeList.do";
	}
	

}
