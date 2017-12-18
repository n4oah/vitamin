package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.service.SearchService;

@Controller
@RequestMapping("/search")
public class CompanySearch {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/companySearch.do")
	public void companySearch(Model model) throws Exception {
		List<City> cityList = searchService.selectCity();
		model.addAttribute("cityList",cityList);
	}
}
