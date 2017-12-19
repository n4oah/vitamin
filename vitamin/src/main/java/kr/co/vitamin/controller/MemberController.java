package kr.co.vitamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("/signup.do")
	public String signup() throws Exception {
		return "";
	}
}