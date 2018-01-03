package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/detail.do")
	public void companyDetail(@RequestParam(defaultValue="0") int no, Model model) throws Exception {
		Company com = companyService.companyDetail(no);
		model.addAttribute("com", com);
		if (com != null) model.addAttribute("logo", companyService.fileDetail(com.getLogoNo()));
		Review review = new Review();
		review.setCompanyNo(no);
		//System.out.println(review.getPage());
		model.addAttribute("commentList", companyService.commentDetail(review));
	}
	
	@ResponseBody
	@RequestMapping("/reviewWrite.do")
	public List<Review> reviewWrite(Review review) throws Exception {
		review.setMemberNo(0);
		companyService.commentWrite(review);
		review.setReviewNo(companyService.lastAi());
		return companyService.newCommentDetail(review);
	}
	
	@ResponseBody
	@RequestMapping("/reviewPlus.do")
	public List<Review> reviewPlus(Review review) throws Exception {
		return companyService.commentDetailPlus(review);
	}
}
