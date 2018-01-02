package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.ResumeMapper;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired
	private ResumeMapper mapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo, ArmyService armyService) throws Exception {
		mapper.insertResume(resumeBaseInfo);
		mapper.insertArmyService(armyService);
		mapper.updateArmyService(resumeBaseInfo);
	}

	@Override
	public List<ResumeBaseInfo> resumeList() throws Exception {
		return mapper.selectResume();
	}

	@Override
	public ResumeBaseInfo resumeInfo(int resumeNo) throws Exception {
		return mapper.selectResumeInfo(resumeNo);
		
	}

	@Override
	public ArmyService armyInfo(int resumeNo) throws Exception {
		return mapper.selectArmyServiceInfo(resumeNo);
	}

	@Override
	public String resumeJobState(String jobState) throws Exception {
		return mapper.selectJobState(jobState);
	}

	@Override
	public String resumeMarryState(String marryState) throws Exception {
		return mapper.selectMarryState(marryState);
	}

	@Override
	public String resumeBohoonState(String bohoonState) throws Exception {
		return mapper.selectBohoonState(bohoonState);
	}

	@Override
	public String resumeSupportState(String supportState) throws Exception {
		return mapper.selectSupportState(supportState);
	}

	@Override
	public String resumeArmyState(int armyServiceState) throws Exception {
		return mapper.selectArmyState(armyServiceState);
	}

	
	
	

	

}
