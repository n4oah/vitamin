package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.service.RecruitService;

@Controller
public class MainController {
	@Autowired
	RecruitService recruitService;
	
	@RequestMapping("main.do")
	public String main(Model model) throws Exception {
		List<Recruit> recruitList = recruitService.getNewRecruitList();
		model.addAttribute("recruitList", recruitList);
		return "/main/main";
	}
}