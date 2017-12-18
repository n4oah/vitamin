package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.City;

public interface SearchService {
	public List<City> selectCity() throws Exception;
	
	
}
