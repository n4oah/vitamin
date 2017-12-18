package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;

public interface SearchMapper {
	
	public List<City> selectCity() throws Exception;
	public List<Area> selectArea() throws Exception;
}
