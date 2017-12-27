package kr.co.vitamin.controller;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private SchoolLevelService schoolService;
	
	@RequestMapping("/signupForm.do")
	public void signupForm(Model model) throws Exception {
		List<SchoolLevel> list = schoolService.getSchoolLevels();
		
		model.addAttribute("slList", list);
		model.addAttribute("todayDate", new Date());
	}
	
	@RequestMapping("/signup.do")
	public String signup(Member memberVO) throws Exception {
		
		return "";
	}
}