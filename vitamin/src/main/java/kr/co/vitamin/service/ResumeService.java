package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;

public interface ResumeService {
	
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public List<ResumeBaseInfo> resumeList() throws Exception;
	public ResumeBaseInfo resumeInfo(int resumeNo) throws Exception;
	public ArmyService armyInfo(int resumeNo) throws Exception;
	public String resumeJobState(String jobState) throws Exception;
	public String resumeMarryState(String marryState) throws Exception;
	public String resumeBohoonState(String bohoonState) throws Exception;
	public String resumeSupportState(String supportState) throws Exception;
	
}
