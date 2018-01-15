package kr.co.vitamin.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.IntroductionMapper;
import kr.co.vitamin.repository.mapper.ResumeMapper;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.account.Member;

@Service
public class RecruitApplyServiceImpl implements RecruitApplyService {
	@Autowired
	IntroductionMapper introductionMapper;
	@Autowired
	ResumeMapper resumeMapper;
	
	@Override
	public Map<String, Object> getRecruitSorceData(Member member) throws Exception {
		List<Introduction> introductionList = introductionMapper.selectIntroductionAll(member);
		List<ResumeBaseInfo> resumeBaseInfoList = resumeMapper.selectResumeOpenOne(member);
		
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("introductionList", introductionList);
		map.put("resumeBaseInfoList", resumeBaseInfoList);
		return map;
	}
}