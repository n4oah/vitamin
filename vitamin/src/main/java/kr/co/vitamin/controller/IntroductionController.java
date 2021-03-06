package kr.co.vitamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.vitamin.common.PageResult;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;
import kr.co.vitamin.repository.vo.Page;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.IntroductionService;

@Controller
@RequestMapping("/mypage")
public class IntroductionController {
	
	
	
	@Autowired
	private IntroductionService introductionService;
	
	
	@RequestMapping("/introductionList.do")
	public ModelAndView introductionList(HttpSession session,@RequestParam(name="pageNo", defaultValue="1") int pageNo) throws Exception{
		
		System.out.println("introductionList 들어옴");
		Member user = (Member)session.getAttribute("user");
		Integer memberNo =user.getMemberNo();
		Introduction introduction = new  Introduction();
		introduction.setPageNo(pageNo);
		introduction.setMemberNo(user.getMemberNo());
		List<Introduction> ilist = introductionService.selectIntroductionList(introduction);

		int introductionCount = introductionService.selectIntroductionCount(memberNo);
		
		ModelAndView mav = new ModelAndView();
		Page page = new Page(pageNo); 
		
		PageResult pageResult = new PageResult(pageNo, introductionCount);
		
		
		
		mav.addObject("pageResult", pageResult);
		mav.addObject("ilist", ilist);
		
		return mav;
		
	}
	
	@RequestMapping("/introductionDetail.do")
	public String introductionDetail(HttpServletRequest request, HttpSession session, Model model,
								Integer introductionNo, RedirectAttributes redirectAttributes) throws Exception{
		System.out.println("introductionDetail 들어옴");
		
		Account account = (Account)session.getAttribute("user");
		
		boolean viewChk = false;
		
		if(account.getMemberType() == 1) {
			Introduction introduction = new Introduction();
			introduction.setMemberNo(((Member)account).getMemberNo());
			introduction.setIntroductionNo(introductionNo);
			
			viewChk = introductionService.viewMemberCheck(introduction);
		} else if(account.getMemberType() == 2) {
			Map<String, Integer> map = new HashMap<>();
			map.put("introductionNo", introductionNo);
			map.put("companyNo", ((Company)account).getCompanyNo());
			System.out.println(map);
			
			viewChk = introductionService.viewCompanyCheck(map);
		}
		
		if(viewChk == false) {
			String referer = request.getHeader("Referer");
			
			redirectAttributes.addFlashAttribute("errorMsgFlashAttr", "볼 수 있는 권한이 없습니다.");
			return referer;
		}
		
		Introduction introduction = introductionService.selectIntroduction(introductionNo);
		List<IntroductionCate> iclist= introductionService.selectIntroductionCate(introductionNo);
		model.addAttribute("introduction", introduction);
		model.addAttribute("iclist", iclist);
		
		return "/mypage/introductionDetail";
	}
	
	@RequestMapping("/introductionForm.do")
	public ModelAndView introductionForm(HttpSession session) throws Exception{
		System.out.println("introductionForm 들어옴");
		Member user = (Member)session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("/introductionSave.do")
	public String introductionSave(HttpSession session, Introduction introduction, IntroductionCate introductionCate
			,String[] introductionCateTemp, String[] introductionContentTemp)throws Exception{
		System.out.println("introductionSave 들어옴");
		Member user = (Member)session.getAttribute("user");
		introduction.setMemberNo(user.getMemberNo());
		
		for(int i = 0 ;i<introductionCateTemp.length;i++) {
			introductionCate.setIntroductionCate(introductionCateTemp[i]);
			introductionCate.setIntroductionContent(introductionContentTemp[i]);
			introductionService.insertIntroductionCate(introductionCate);
		}
		
		introductionService.insertIntroduction(introduction);
		
		return "redirect:/mypage/introductionList.do";
		
	}
	
	@RequestMapping("/deleteIntroduction.do")
	@ResponseBody
	public void deleteIntroduction(Integer introductionNo) throws Exception{
		System.out.println("intductionDelete 들어옴");
		introductionService.deleteIntroduction(introductionNo);
		
	}
	
	
	@RequestMapping("/introductionUpdateForm.do")
	public void introductionUpdateForm(Model model, Integer introductionNo) throws Exception{
		System.out.println("introductionUpdateForm들어옴");
		
		Introduction introduction = introductionService.selectIntroduction(introductionNo);
		List<IntroductionCate> iclist= introductionService.selectIntroductionCate(introductionNo);
		
		model.addAttribute("introduction", introduction);
		model.addAttribute("iclist", iclist);
		
	}
	
	@RequestMapping("/introductionUpdate.do")
	public String introductionUpdate(String[] introductionCateTemp, String[] introductionContentTemp, Introduction introduction, IntroductionCate introductionCate) throws Exception{
		System.out.println("introductionUpdate들어옴");
		Integer[] introductionCateNo= introductionService.selectIntroductionCateNo(introductionCate.getIntroductionNo());
		for(int i = 0 ;i<introductionCateTemp.length;i++) {
			introductionCate.setIntroductionCate(introductionCateTemp[i]);
			introductionCate.setIntroductionContent(introductionContentTemp[i]);
			introductionCate.setIntroductionCateNo(introductionCateNo[i]);
			
			
			introductionService.updateIntroductionCate(introductionCate);
		}
		
		introductionService.updateIntroduction(introduction);
		
		return "redirect:/mypage/introductionList.do";
	}
}
