package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.Recruit;

public interface PeoplesSearchMapper {
	public City abcd(Integer no) throws Exception;
	public List<City> cityList() throws Exception;
}
