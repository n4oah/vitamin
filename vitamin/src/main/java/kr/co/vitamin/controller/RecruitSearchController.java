package kr.co.vitamin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.service.SearchService;

@Controller
@RequestMapping("/search")
public class RecruitSearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/companySearch.do")
	public void companySearch(Model model) throws Exception {
		List<City> cityList = searchService.selectCity();
		List<Area> areaList = searchService.selectArea();
		
		List<Recruit> recruitList = searchService.selectRecruit();
		
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("cityList",cityList);
		model.addAttribute("areaList",areaList);
	}
}
