package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.SchoolLevel;

public interface SchoolLevelService {
	public List<SchoolLevel> getSchoolLevels() throws Exception;
}