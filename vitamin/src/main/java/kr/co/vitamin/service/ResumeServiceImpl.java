package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.ResumeMapper;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired
	private ResumeMapper mapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo) throws Exception {
		mapper.insertResume(resumeBaseInfo);
		mapper.insertArmyService(resumeBaseInfo);
	}

	@Override
	public List<ResumeBaseInfo> resumeList() throws Exception {
		return mapper.selectResume();
	}
	
	

	

}
