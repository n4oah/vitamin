package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.SearchMapper;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.CityAndArea;
import kr.co.vitamin.repository.vo.Page;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.SearchRecruit;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchMapper searchMapper;

	@Override
	public List<City> selectCity() throws Exception {
		return searchMapper.selectCity();
	}
	
	@Override
	public List<Area> selectArea() throws Exception {
		return searchMapper.selectArea();
	}
	
	@Override
	public List<Recruit> selectRecruit(Page page) throws Exception {
		System.out.println(searchMapper.selectRecruit(page));
		return searchMapper.selectRecruit(page);
	}
	
	@Override
	public List<CityAndArea> selectCityAndArea() throws Exception {
		return searchMapper.selectCityAndArea();
	}
	
	@Override
	public List<Recruit> selectSearchCondition(SearchRecruit searchRecruit) throws Exception {
		System.out.println("selectSearchCondition " + searchMapper.selectSearchCondition(searchRecruit).size());
		return searchMapper.selectSearchCondition(searchRecruit);
	}
	
	@Override
	public int selectRecruitCount() throws Exception {
		return searchMapper.selectRecruitCount();
	}
	
	@Override
	public int selectSearchConditionCount(SearchRecruit searchRecruit) throws Exception {
		return searchMapper.selectSearchConditionCount(searchRecruit);
	}
}
