package kr.co.vitamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping("/calendartest.do")
	public void calendarTest() throws Exception{
		System.out.println("캘린더 테스트");
	}
}
