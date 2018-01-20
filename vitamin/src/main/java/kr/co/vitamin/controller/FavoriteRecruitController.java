package kr.co.vitamin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/favoriteRecruit")
public class FavoriteRecruitController {
	
	
	@ResponseBody
	@RequestMapping("/favoriteRecruit.do")
	public void favoriteRecruit(HttpSession session) {
		
	}
}
