package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.Recruit;

public interface SearchMapper {
	
	public List<City> selectCity() throws Exception;
	public List<Area> selectArea() throws Exception;
	
	public List<Recruit> selectRecruit() throws Exception;
}
