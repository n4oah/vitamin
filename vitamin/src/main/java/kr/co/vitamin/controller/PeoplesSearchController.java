package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.PeopleSearch;
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
	
	@ResponseBody
	@RequestMapping("/licenseList.do")
	public List<Certificate> licenseList(String name) throws Exception{
		return peoplesSearchService.licenseList(name);
	}
	
	@ResponseBody
	@RequestMapping("/peoplesSearchList.do")
	public void peoplesSearchList(PeopleSearch peopleSearch) throws Exception {
		System.out.println(peopleSearch);
		System.out.println(peoplesSearchService.peoplesSearch(peopleSearch));
	}
	
	@ResponseBody
	@RequestMapping("/test.do")
	public void test(String msg) throws Exception {
		System.out.println(msg);
	}
}
