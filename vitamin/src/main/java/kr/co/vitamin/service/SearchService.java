package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.CityAndArea;
import kr.co.vitamin.repository.vo.Page;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.SearchRecruit;

public interface SearchService {
	public List<City> selectCity() throws Exception;
	public List<Area> selectArea() throws Exception;

	public List<CityAndArea> selectCityAndArea() throws Exception;
	
	public List<Recruit> selectRecruit(Page page) throws Exception;
	
	
	public int selectRecruitCount() throws Exception;
	public int selectSearchConditionCount(SearchRecruit searchRecruit) throws Exception; 

	public List<Recruit> selectSearchCondition(SearchRecruit searchRecruit) throws Exception;
	
}
