package kr.co.vitamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.CalendarRecruit;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.Hope;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;
import kr.co.vitamin.repository.vo.PeopleSearch;
import kr.co.vitamin.repository.vo.PrevCompany;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.ResumeCertification;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.IntroductionService;
import kr.co.vitamin.service.PeoplesSearchService;
import kr.co.vitamin.service.ResumeService;

@Controller
@RequestMapping("/search")
public class PeoplesSearchController {
	
	@Autowired
	private PeoplesSearchService peoplesSearchService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private IntroductionService introductionService;
	
	@RequestMapping("/peoplesSearch.do")
	public void companySearch(Model model) throws Exception {
		model.addAttribute("cityList", peoplesSearchService.cityList());
		model.addAttribute("schList", peoplesSearchService.schList());
	}
	
	@ResponseBody
	@RequestMapping("/areaList.do")
	public City efg(int no) throws Exception {
		return peoplesSearchService.abcd(no);
	}
	
	@ResponseBody
	@RequestMapping("/licenseList.do")
	public List<Certificate> licenseList(String name) throws Exception{
		return peoplesSearchService.licenseList(name);
	}
	
	@ResponseBody
	@RequestMapping("/peoplesSearchList.do")
	public Map<String, Object> peoplesSearchList(PeopleSearch peopleSearch) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("list", peoplesSearchService.peoplesSearch(peopleSearch));
		map.put("listSize", peoplesSearchService.peoplesSearchSize(peopleSearch));		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/introductionInsert.do")
	public Integer introductionInsert(HttpSession session, Introduction introduction, IntroductionCate introductionCate
			,String[] introductionCateTemp, String[] introductionContentTemp) throws Exception {
		Member user = (Member)session.getAttribute("user");
		introduction.setMemberNo(user.getMemberNo());
		
		for(int i = 0 ;i<introductionCateTemp.length;i++) {
			introductionCate.setIntroductionCate(introductionCateTemp[i]);
			introductionCate.setIntroductionContent(introductionContentTemp[i]);
			introductionService.insertIntroductionCate(introductionCate);
		}
		
		Integer introductionNo = introductionService.insertIntroduction(introduction);
		return introductionNo;
	}
	
	@ResponseBody
	@RequestMapping("/introductionUpdate.do")
	public void introductionUpdate(HttpSession session, Introduction introduction, IntroductionCate introductionCate
			,String[] introductionCateTemp, String[] introductionContentTemp) throws Exception {		
		Member user = (Member)session.getAttribute("user");
		introduction.setMemberNo(user.getMemberNo());
		
		for(int i = 0 ;i<introductionCateTemp.length;i++) {
			introductionCate.setIntroductionCate(introductionCateTemp[i]);
			introductionCate.setIntroductionContent(introductionContentTemp[i]);
			introductionService.updateIntroductionCate(introductionCate);
		}
		
		introductionService.updateIntroduction(introduction);
	}
	
	@ResponseBody
	@RequestMapping("/test.do")
	public void test(String msg) throws Exception {
		System.out.println(msg);
	}
	
	@RequestMapping("/calendar.do")
	public void calendar() throws Exception {
	}
	
	@ResponseBody
	@RequestMapping("/calendarData.do")
	public List<CalendarRecruit> calendarData(HttpSession session) throws Exception {
		Member member = (Member)session.getAttribute("user");
		return peoplesSearchService.selectRecruitCalendar(member.getMemberNo());
	}
	
	@RequestMapping("/resumeInfo.do")
	public ModelAndView resumeInfo(HttpSession session, Integer resumeNo) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		Member user = (Member)session.getAttribute("user");

		ResumeBaseInfo resumeInfo =	resumeService.resumeInfo(resumeNo);
		Member member = resumeService.baseInfoSelect(resumeNo);
		Address address = resumeService.addressSelect(resumeNo);
		String jobState = resumeService.resumeJobState(resumeInfo.getJobState());
		String marryState = resumeService.resumeMarryState(resumeInfo.getMarryState());
		String bohoonState = resumeService.resumeBohoonState(resumeInfo.getBohoonState());
		String supportState = resumeService.resumeSupportState(resumeInfo.getSupportState());
		ArmyService armyService = resumeService.armyInfo(resumeNo);
		String armyState = resumeService.resumeArmyState(armyService.getArmyServiceState());
		SchoolLevel school = resumeService.resumeSchool(resumeNo);
		PrevCompany pCompany = resumeService.resumePrevCompany(resumeNo);
		ResumeCertification certificate = resumeService.resumeCertification(resumeNo);
		Hope hope = resumeService.resumeHope(resumeNo);
		String hopeBusiness = resumeService.resumeHopeBusiness(hope.getHopeNo());

		
		mav.addObject("hopeBusiness", hopeBusiness);
		mav.addObject("hope", hope);
		mav.addObject("certificate", certificate);
		mav.addObject("pCompany", pCompany);
		mav.addObject("school", school);
		mav.addObject("member", member);
		mav.addObject("address", address);
		mav.addObject("resumeInfo", resumeInfo);
		mav.addObject("jobState", jobState);
		mav.addObject("marryState", marryState);
		mav.addObject("bohoonState", bohoonState);
		mav.addObject("supportState", supportState);
		mav.addObject("armyState", armyState);
		mav.addObject("armyService", armyService);
		mav.addObject("resumeInfo", resumeInfo);
		
		return mav;
	}
}
