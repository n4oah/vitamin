package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.CityAndArea;
import kr.co.vitamin.repository.vo.Recruit;

public interface SearchService {
	public List<City> selectCity() throws Exception;
	public List<Area> selectArea() throws Exception;

	public List<CityAndArea> selectCityAndArea() throws Exception;
	public List<Recruit> selectRecruit() throws Exception;
}
