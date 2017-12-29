package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ResumeBaseInfo;

public interface ResumeMapper {

	public void insertResume(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public void insertArmyService(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public List<ResumeBaseInfo> selectResume() throws Exception;
	
	
}
