package kr.co.vitamin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.vitamin.repository.vo.Company;
import kr.co.vitamin.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/detail.do")
	public void companyDetail(@RequestParam(defaultValue="0") int no, Model model) throws Exception {
		Company com = companyService.companyDetail(no);
		model.addAttribute("com", com);
		model.addAttribute("logo", companyService.fileDetail(com.getLogoNo()));
		model.addAttribute("comment", companyService.commentDetail(no));
	}
}
