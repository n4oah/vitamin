package kr.co.vitamin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/detail.do")
	public void companyDetail(Integer no, Model model, HttpSession session) throws Exception {
		if (no == null) return;
		Review review = new Review();
		review.setCompanyNo(no);
		
		try {
			Member member = (Member)session.getAttribute("user");
			review.setMemberNo(member.getMemberNo());
		} catch (Exception e) {}
		
		Company com = companyService.companyDetail(review);
		System.out.println(com);
		model.addAttribute("com", com);
		System.out.println(com.getRecruitList());

		review.setCompanyNo(no);
		model.addAttribute("commentList", companyService.commentDetail(review));
		model.addAttribute("recruitList", companyService.recruitDetail(no));
	}
	
	@ResponseBody
	@RequestMapping("/reviewWrite.do")
	public List<Review> reviewWrite(Review review) throws Exception {
		companyService.commentWrite(review);
		review.setReviewNo(companyService.lastAi());
		return companyService.newCommentDetail(review);
	}
	
	@ResponseBody
	@RequestMapping("/reviewUpdate.do")
	public Review reviewUpdate(Review review) throws Exception {
		companyService.commentModify(review);
		return companyService.reviewOneDetail(review.getReviewNo());
	}
	
	@ResponseBody
	@RequestMapping("/reviewPlus.do")
	public List<Review> reviewPlus(Review review) throws Exception {
		return companyService.commentDetailPlus(review);
	}
	
	@ResponseBody
	@RequestMapping("/reviewInsertChk.do")
	public Integer reviewInsertChk(Review review) throws Exception {
		System.out.println(review);
		return companyService.reviewInsertChk(review);
	}
	
	@ResponseBody
	@RequestMapping("/reviewDelete.do")
	public void reviewDelete(Review review) throws Exception {
		companyService.commentDelete(review);
	}
	
	@ResponseBody
	@RequestMapping("/bookmark.do")
	public Integer bookmark(Integer companyNo, HttpSession session) throws Exception {
		Review review = new Review();
		review.setCompanyNo(companyNo);
		Member member = (Member)session.getAttribute("user");
		review.setMemberNo(member.getMemberNo());
		System.out.println(companyNo);
		System.out.println(companyService.bookmarkChk(review));
		if (companyService.bookmarkChk(review) > 0) {
			companyService.bookmarkRemove(review);
			return 0;
		} else {
			companyService.bookmarkInsert(review);
			return 1;
		}
	}
}
