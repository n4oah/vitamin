package kr.co.vitamin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.vitamin.common.PageResult;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.FormService;
import kr.co.vitamin.repository.vo.Page;
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
	public void searchRecruit(Model model,
			@RequestParam(name="pageNo", defaultValue="1") int pageNo) throws Exception {
		List<City> cityList = searchService.selectCity();
		List<Area> areaList = searchService.selectArea();
		
		
		int recruitCount = searchService.selectRecruitCount();
		
		Page page = new Page(pageNo); 
		
		PageResult pageResult = new PageResult(pageNo, recruitCount);
			

		List<Recruit> recruitList = searchService.selectRecruit(page);
		System.out.println(recruitList);
		
		List<SchoolLevel> schoolLevelList = schoolLevelService.getSchoolLevels();
		List<FormService> formServiceList = formServiceService.selectFormService();
		
	
		
		
	
		model.addAttribute("pageResult", pageResult);
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
		System.out.println(searchRecruit.getPageNo());

		Page page = new Page(searchRecruit.getPageNo());
		int count = searchService.selectSearchConditionCount(searchRecruit);
		
		
		PageResult pageResult = new PageResult(searchRecruit.getPageNo(), count);
		
		System.out.println(searchRecruit.getBegin());
		System.out.println(searchRecruit.getEnd());
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pageResult", pageResult);
		map.put("recruitList", searchService.selectSearchCondition(searchRecruit));
		
		return new Gson().toJson(map);
	}
}
