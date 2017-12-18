package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.City;

public interface SearchMapper {
	
	public List<City> selectCity() throws Exception;
}
