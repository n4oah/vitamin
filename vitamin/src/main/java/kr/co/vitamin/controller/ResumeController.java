package kr.co.vitamin.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.ConditionSelection;
import kr.co.vitamin.repository.vo.Hope;
import kr.co.vitamin.repository.vo.HopeBusiness;
import kr.co.vitamin.repository.vo.LicensingDepartment;
import kr.co.vitamin.repository.vo.MajorCate;
import kr.co.vitamin.repository.vo.PrevCompany;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.ResumeCertification;
import kr.co.vitamin.repository.vo.School;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.AddressService;
import kr.co.vitamin.service.ResumeService;

@Controller
@RequestMapping("/mypage")
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private AddressService addressService;
	
	
	@RequestMapping("/resumeList.do")
	public ModelAndView resumeList(HttpSession session) throws Exception{
		Member user = (Member)session.getAttribute("user");
		Integer MemberNo=user.getMemberNo();
		System.out.println("resumeList 들어옴");
		ModelAndView mav = new ModelAndView();
		List<ResumeBaseInfo> rlist = resumeService.resumeList(MemberNo);
		System.out.println(rlist + "sadgsdg");
		for (ResumeBaseInfo resumeBaseInfo : rlist) {
			resumeBaseInfo.getResumeTitle();
		}
		mav.addObject("rlist",rlist);
		return mav;
		
	}
	
	@RequestMapping("/resumeInfo.do")
	public ModelAndView resumeInfo(HttpSession session, Integer resumeNo) throws Exception{
		System.out.println("resumeInfo 들어옴");
		ModelAndView mav = new ModelAndView();
		
		Member user = (Member)session.getAttribute("user");
		
		
		ResumeBaseInfo resumeInfo =	resumeService.resumeInfo(resumeNo);
		Account account = resumeService.baseInfoSelect(resumeNo);
		String jobState = resumeService.resumeJobState(resumeInfo.getJobState());
		String marryState = resumeService.resumeMarryState(resumeInfo.getMarryState());
		String bohoonState = resumeService.resumeBohoonState(resumeInfo.getBohoonState());
		String supportState = resumeService.resumeSupportState(resumeInfo.getSupportState());
		ArmyService armyService = resumeService.armyInfo(resumeNo);
		String armyState = resumeService.resumeArmyState(armyService.getArmyServiceState());
			
		mav.addObject("account", account);
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
	
	
	@RequestMapping("/fullcalendartest.do")
	public void fullcalendarTest() throws Exception{
		System.out.println("fullcalendartest 들어옴");
	}
	
	
	@RequestMapping("/saveResumeInfo.do")
	public void saveResumeInfo() throws Exception{
		System.out.println("saveResumeInfo 들어옴");
	}
	
	
	@RequestMapping("/resumeForm.do")
	public ModelAndView resumeForm(HttpSession session) throws Exception{
		Member user = (Member)session.getAttribute("user");
		System.out.println(user);
		System.out.println("resumeForm 들어옴");
		ModelAndView mav = new ModelAndView();
		
		Address address = new Address();
		address.setAddressNo(user.getAddressNo());
		
		address = addressService.selectAddress(address);
		
		List<City> clist = resumeService.citySelect();
		List<BusinessType> bt = resumeService.businessTypeSelect();
		mav.addObject("address", address);
		mav.addObject("user",user);
		mav.addObject("clist",clist);
		mav.addObject("bt",bt);
		return mav;
	}
	
	
	@RequestMapping("/intermediateSave.do")
	public String intermediateSave(HttpSession session,ResumeBaseInfo resumeBaseInfo, ArmyService armyService, School school
									, Integer[] schoolLevelNoTmp, PrevCompany prevCompany, ResumeCertification resumeCertification,
									Hope hope, HopeBusiness hopeBusiness) throws Exception{

		System.out.println("중간저장 들어옴");
		System.out.println(hopeBusiness.getHopeBusinessNo());
		System.out.println(hopeBusiness.getBusinessNo());
		System.out.println("자격증"+resumeCertification.toString());
		
		school.setSchoolLevelNo(schoolLevelNoTmp[schoolLevelNoTmp.length-1]);
		Member user = (Member)session.getAttribute("user");
		System.out.println("schoolLevelNo "+ school.getSchoolLevelNo());
		Integer memberNo = user.getMemberNo();
		resumeBaseInfo.setMemberNo(memberNo);
		resumeService.resumeInsert(resumeBaseInfo, armyService, school, prevCompany, resumeCertification, hope, hopeBusiness);
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
	
	@RequestMapping("/choiceBusiness.do")
	@ResponseBody
	public BusinessType choiceBusiness(Integer businessNo) throws Exception{
		System.out.println("choiceBusiness 들어옴");
		System.out.println(businessNo);
		BusinessType businessType = resumeService.choiceBusiness(businessNo);
		System.out.println(businessType.getBusinessType());
		System.out.println(businessType.getBusinessContent());
		return businessType;
	}
	
	@RequestMapping("/majorSelect.do")
	@ResponseBody
	public List<MajorCate> majorSelect(String majorCategory) throws Exception{
		List<MajorCate> mc = resumeService.majorSelect(majorCategory);
		return mc;
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
	        public void setAsText(String text) throws IllegalArgumentException {
	            try {
	                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
	            } catch (ParseException e) {
	                setValue(null);
	            }
	        }
	    });
	}
}
