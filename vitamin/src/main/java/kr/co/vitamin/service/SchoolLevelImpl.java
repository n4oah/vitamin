package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.SchoolLevelMapper;
import kr.co.vitamin.repository.vo.SchoolLevel;

@Service
public class SchoolLevelImpl implements SchoolLevelService {
	@Autowired
	private SchoolLevelMapper schoolLevelMapper;
	
	@Override
	public List<SchoolLevel> getSchoolLevels() throws Exception {
		return schoolLevelMapper.selectSchoolLevelAll();
	}
}