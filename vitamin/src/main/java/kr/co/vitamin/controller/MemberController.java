package kr.co.vitamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("/signupForm.do")
	public void signupForm() {}
	
	@RequestMapping("/signup.do")
	public String signup() {
		
		return null;
	}
}