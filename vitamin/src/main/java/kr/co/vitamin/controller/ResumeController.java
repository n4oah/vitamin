package kr.co.vitamin.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Service;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.ConditionSelection;
import kr.co.vitamin.repository.vo.Hope;
import kr.co.vitamin.repository.vo.HopeBusiness;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.LicensingDepartment;
import kr.co.vitamin.repository.vo.MajorCate;
import kr.co.vitamin.repository.vo.PrevCompany;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.ResumeCertification;
import kr.co.vitamin.repository.vo.School;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Company;
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
	
		
		for (ResumeBaseInfo resumeBaseInfo : rlist) {
			resumeBaseInfo.getResumeTitle();
		}
		mav.addObject("rlist",rlist);
		return mav;
		
	}
	
	@RequestMapping("/resumeInfo.do")
	public ModelAndView resumeInfo(HttpSession session, HttpServletRequest request, Integer resumeNo, RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("resumeInfo 들어옴");
		ModelAndView mav = new ModelAndView();
		
		Account user = (Account)session.getAttribute("user");
		
		boolean viewChk = false;
		
		if(user.getMemberType() == 1) {
			CompanyApply companyApply = new CompanyApply();
			companyApply.setMemberNo(((Member)user).getMemberNo());
			companyApply.setResumeNo(resumeNo);
			
			System.out.println(companyApply);
			
			viewChk = resumeService.viewMemberCheck(companyApply);
		} else if(user.getMemberType() == 2) {
			Map<String, Integer> map = new HashMap<>();
			map.put("companyNo", ((Company)user).getCompanyNo());
			map.put("resumeNo", resumeNo);
			
			viewChk = resumeService.viewCompanyCheck(map);
		}
		
		if(viewChk == false) {
			System.out.println("BB");
			String referer = request.getHeader("Referer");
			
			redirectAttributes.addFlashAttribute("errorMsgFlashAttr", "볼 수 있는 권한이 없습니다.");
			mav.setViewName(referer);
			return mav;
		}
		
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
	
	/*@RequestMapping("/introductionList.do")
	public void introductionList() throws Exception{
		System.out.println("introductionList 들어옴");
		
		
	}
	
	@RequestMapping("/introductionDetail.do")
	public void introductionDetail() throws Exception{
		System.out.println("introductionDetail 들어옴");
	}*/
	
	
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

		System.out.println("자격증"+resumeCertification.toString());
		
		school.setSchoolLevelNo(schoolLevelNoTmp[schoolLevelNoTmp.length-1]);
		Member user = (Member)session.getAttribute("user");
		System.out.println("schoolLevelNo "+ school.getSchoolLevelNo());
		Integer memberNo = user.getMemberNo();
		resumeBaseInfo.setMemberNo(memberNo);
		resumeService.resumeInsert(resumeBaseInfo, armyService, school, prevCompany, resumeCertification, hope, hopeBusiness);
		return "redirect:/mypage/resumeList.do";

	}
	
	@RequestMapping("/resumeUpdateForm.do")
	public ModelAndView updateResume(HttpSession session,Integer resumeNo) throws Exception{
		System.out.println("이력서 수정폼 들어옴");
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
	
	@RequestMapping("/deleteResume.do")
	@ResponseBody
	public void deleteResume(Integer resumeNo) throws Exception{
		resumeService.deleteResume(resumeNo);
	}
	
	
	@RequestMapping("/openState.do")
	@ResponseBody
	public void openState(Integer resumeNo, Integer openState) throws Exception{
		System.out.println("openState들어옴");
		ResumeBaseInfo resumeBaseInfo = new ResumeBaseInfo();
		Integer open = openState%2;
		if(open == 1) {
			open = 0;
		}else if(open == 0) {
			open = 1;
		}
		resumeBaseInfo.setResumeNo(resumeNo);
		resumeBaseInfo.setOpenState(open);
		resumeService.updateOpenState(resumeBaseInfo);
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
