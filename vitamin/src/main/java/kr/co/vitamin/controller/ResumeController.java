package kr.co.vitamin.controller;

import java.util.List;

import javax.xml.ws.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.ConditionSelection;
import kr.co.vitamin.repository.vo.LicensingDepartment;
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
	public ModelAndView resumeInfo(int resumeNo) throws Exception{
		System.out.println("resumeInfo 들어옴");
		ModelAndView mav = new ModelAndView();
		ResumeBaseInfo resumeInfo =	resumeService.resumeInfo(resumeNo);
		
		String jobState = resumeService.resumeJobState(resumeInfo.getJobState());
		String marryState = resumeService.resumeMarryState(resumeInfo.getMarryState());
		String bohoonState = resumeService.resumeBohoonState(resumeInfo.getBohoonState());
		String supportState = resumeService.resumeSupportState(resumeInfo.getSupportState());
		ArmyService armyService = resumeService.armyInfo(resumeNo);
		String armyState = resumeService.resumeArmyState(armyService.getArmyServiceState());
			
		
		mav.addObject("resumeInfo", resumeInfo);
		mav.addObject("jobState", jobState);
		mav.addObject("marryState", marryState);
		mav.addObject("bohoonState", bohoonState);
		mav.addObject("supportState", supportState);
		mav.addObject("armyState", armyState);
		mav.addObject("armyService", armyService);
		
		return mav;
		
		
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
	public ModelAndView resumeForm() throws Exception{
		System.out.println("resumeForm 들어옴");
		ModelAndView mav = new ModelAndView();
		List<City> clist = resumeService.citySelect();
		mav.addObject("clist", clist);
		return mav;
	}
	
	
	@RequestMapping("/intermediateSave.do")
	public String intermediateSave(ResumeBaseInfo resumeBaseInfo, ArmyService armyService) throws Exception{
		System.out.println("중간저장 들어옴");
		resumeService.resumeInsert(resumeBaseInfo, armyService);
		
		return "redirect:/mypage/resumeList.do";
	}
	
	@RequestMapping("/areaSelect.do")
	@ResponseBody
	public List<Area> areaSelect(Integer cityCode) throws Exception{
		System.out.println("areaSelect 들어옴");
		List<Area> alist = resumeService.areaSelect(cityCode);
		for (Area area : alist) {
			System.out.println(area.getName());
		}
		return alist;
	}
	
	@RequestMapping("/certificationSelect.do")
	@ResponseBody
	public List<Certificate> certificationSelect(String name) throws Exception{
		List<Certificate> certifilist = resumeService.certificationSelect(name);
		return certifilist;
	}
	
	@RequestMapping("/licensingDepartment.do")
	@ResponseBody
	public LicensingDepartment licensingDepartmentSelect(Integer licensingDepartmentNo) throws Exception{
		System.out.println("licensingDepartmentNo"+licensingDepartmentNo);
		LicensingDepartment ld = resumeService.licensingDepartmentSelect(licensingDepartmentNo);
		return ld;
	}
	
	
	

}
