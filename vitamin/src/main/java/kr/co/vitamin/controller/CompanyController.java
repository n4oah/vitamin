package kr.co.vitamin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@RequestMapping("/detail.do")
	public void companySearch(Model model) throws Exception {
	}

}
