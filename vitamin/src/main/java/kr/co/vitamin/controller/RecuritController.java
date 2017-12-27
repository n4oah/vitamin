package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/recruit")
public class RecuritController {
	
	@Autowired
	private SchoolLevelService schoolLevelService;
	
	
	@RequestMapping("/recruitWrite.do")
	public void recruitWrite(Model model) throws Exception{
		List<SchoolLevel> schoolLevelList = schoolLevelService.getSchoolLevels();
		System.out.println(schoolLevelList);
		model.addAttribute("schoolLevelList", schoolLevelList);
	}
	
	@RequestMapping("/recruitDetail.do")
	public void recruitDetail() {
		
	}
}
