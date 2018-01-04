package kr.co.vitamin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.service.PeoplesSearchService;

@Controller
@RequestMapping("/search")
public class PeoplesSearchController {
	
	@Autowired
	private PeoplesSearchService peoplesSearchService;
	
	@RequestMapping("/peoplesSearch.do")
	public void companySearch(Model model) throws Exception {
		model.addAttribute("cityList", peoplesSearchService.cityList());
		model.addAttribute("schList", peoplesSearchService.schList());
	}
	
	@ResponseBody
	@RequestMapping("/areaList.do")
	public City efg(int no) throws Exception {
		return peoplesSearchService.abcd(no);
	}
}
