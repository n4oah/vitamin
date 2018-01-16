package kr.co.vitamin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.InfiniteScrollAccount;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.RecruitApplyService;

@Controller
@RequestMapping("/recruitApply")
public class RecruitApplyController {
	@Autowired
	RecruitApplyService recruitApplyService;
	
	@ResponseBody
	@RequestMapping("/apply.do")
	public boolean apply(HttpSession session, CompanyApply companyApply) throws Exception {
		Member memberVO = (Member)session.getAttribute("user");

		companyApply.setMemberNo(memberVO.getMemberNo());
		companyApply.setState(1);
		
		return recruitApplyService.recruitApply(companyApply);
	}
	
	@ResponseBody
	@RequestMapping("/getData.do")
	public String getData(HttpSession session) throws Exception {
		Member memberVO = (Member)session.getAttribute("user");
		return new Gson().toJson(recruitApplyService.getRecruitSorceData(memberVO));
	}
	
	@RequestMapping("/recruitResumeList.do")
	public void recruitResumeList(HttpSession session, Model model) throws Exception {
		Company companyVO = (Company)session.getAttribute("user");
		
		InfiniteScrollAccount infiniteScrollAccount = new InfiniteScrollAccount();
		infiniteScrollAccount.setAccountNo(companyVO.getCompanyNo());
		
		List<CompanyApply> recruitResumeList = recruitApplyService.getRecruitApplyListOfCompany(infiniteScrollAccount);
		
		model.addAttribute("recruitResumeList", recruitResumeList);
	}
	
	@ResponseBody
	@RequestMapping("companyApplyState.do")
	public boolean companyApplyState(HttpSession session, CompanyApply companyApply) throws Exception {
		Company company = (Company)session.getAttribute("user");
		companyApply.setMemberNo(company.getCompanyNo());
		
		recruitApplyService.updateCompanyApplyState(companyApply);
		return false;
	}
}