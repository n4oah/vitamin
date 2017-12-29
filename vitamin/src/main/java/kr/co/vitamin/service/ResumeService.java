package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.ResumeBaseInfo;

public interface ResumeService {
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public List<ResumeBaseInfo> resumeList() throws Exception;
}
