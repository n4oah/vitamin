package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.SchoolLevel;

public interface SchoolLevelMapper {
	public List<SchoolLevel> selectSchoolLevelAll() throws Exception;
}