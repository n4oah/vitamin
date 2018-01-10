package kr.co.vitamin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/detail.do")
	public void companyDetail(Integer no, Model model, HttpServletRequest request) throws Exception {
		if (no == null) return;
		Company com = companyService.companyDetail(no);
		model.addAttribute("com", com);
		for (Recruit r: com.getRecruitList()) {
			System.out.println(r.getTitle());
		}
		// if (com.getLogoNo() != null) model.addAttribute("logo", companyService.fileDetail(com.getLogoNo()));
		Review review = new Review();
		review.setCompanyNo(no);
		/*HttpSession session = request.getSession();
		Account user = (Account)session.getAttribute("user");
		review.setMemberNo(user.getAccountNo());*/
		model.addAttribute("commentList", companyService.commentDetail(review));
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
}
