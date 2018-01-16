package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.CalendarRecruit;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.PeopleSearch;
import kr.co.vitamin.repository.vo.Peoples;
import kr.co.vitamin.repository.vo.Schedule;
import kr.co.vitamin.repository.vo.SchoolLevel;

public interface PeoplesSearchMapper {
	public City abcd(Integer no) throws Exception;
	public List<City> cityList() throws Exception;
	public List<SchoolLevel> schList() throws Exception;
	public List<Certificate> licenseList(String name) throws Exception;
	public List<Peoples> peoplesSearch(PeopleSearch peopleSearch) throws Exception;
	public Integer peoplesSearchSize(PeopleSearch peopleSearch) throws Exception;
	public List<CalendarRecruit> selectRecruitCalendar(Integer memberNo) throws Exception;
	public void insertSchedule(Schedule schedule) throws Exception;
	public List<CalendarRecruit> selectMyCalendar(Integer memberNo) throws Exception;
}
