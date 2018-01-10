package kr.co.vitamin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.FormService;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.SearchRecruit;
import kr.co.vitamin.repository.vo.Welfare;
import kr.co.vitamin.service.FormServiceService;
import kr.co.vitamin.service.SchoolLevelService;
import kr.co.vitamin.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchRecruitController {
	
	@Autowired
	private SchoolLevelService schoolLevelService;
	
	@Autowired
	private FormServiceService formServiceService;
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/searchRecruit.do")
	public void searchRecruit(Model model) throws Exception {
		List<City> cityList = searchService.selectCity();
		List<Area> areaList = searchService.selectArea();
		List<Recruit> recruitList = searchService.selectRecruit();
		System.out.println(recruitList);
		
		List<SchoolLevel> schoolLevelList = schoolLevelService.getSchoolLevels();
		List<FormService> formServiceList = formServiceService.selectFormService();
		
		model.addAttribute("schoolLevelList", schoolLevelList);
		model.addAttribute("formServiceList", formServiceList);
		
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("cityList",cityList);
		model.addAttribute("areaList",areaList);
	}
	
	@ResponseBody
	@RequestMapping("/searchWork.do") 
	public String searchWork(SearchRecruit searchRecruit) throws Exception {
		System.out.println(searchRecruit);
		return new Gson().toJson(searchService.selectSearchCondition(searchRecruit)); 
	}
}
