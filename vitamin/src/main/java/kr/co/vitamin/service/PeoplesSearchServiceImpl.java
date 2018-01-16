package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.PeoplesSearchMapper;
import kr.co.vitamin.repository.vo.CalendarRecruit;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.PeopleSearch;
import kr.co.vitamin.repository.vo.Peoples;
import kr.co.vitamin.repository.vo.SchoolLevel;

@Service
public class PeoplesSearchServiceImpl implements PeoplesSearchService {
	
	@Autowired
	PeoplesSearchMapper peoplesSearchMapper;

	@Override
	public City abcd(Integer no) throws Exception {
		return peoplesSearchMapper.abcd(no);
	}
	
	@Override
	public List<City> cityList() throws Exception {
		return peoplesSearchMapper.cityList();
	}
	
	@Override
	public List<SchoolLevel> schList() throws Exception {
		return peoplesSearchMapper.schList();
	}
	
	@Override
	public List<Certificate> licenseList(String name) throws Exception {
		return peoplesSearchMapper.licenseList(name);
	}
	
	@Override
	public List<Peoples> peoplesSearch(PeopleSearch peopleSearch) throws Exception {
		return peoplesSearchMapper.peoplesSearch(peopleSearch);
	}
	
	@Override
	public Integer peoplesSearchSize(PeopleSearch peopleSearch) throws Exception {
		return peoplesSearchMapper.peoplesSearchSize(peopleSearch);
	}
	
	@Override
	public List<CalendarRecruit> selectRecruitCalendar(Integer memberNo) throws Exception {
		return peoplesSearchMapper.selectRecruitCalendar(memberNo);
	}
}
