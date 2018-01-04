package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.SchoolLevel;

public interface PeoplesSearchService {
	public City abcd(Integer no) throws Exception;
	public List<City> cityList() throws Exception;
	public List<SchoolLevel> schList() throws Exception;
}
