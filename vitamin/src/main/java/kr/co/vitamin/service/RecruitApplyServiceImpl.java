package kr.co.vitamin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.CompanyApplyMapper;
import kr.co.vitamin.repository.mapper.IntroductionMapper;
import kr.co.vitamin.repository.mapper.RecruitMapper;
import kr.co.vitamin.repository.mapper.ResumeMapper;
import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.InfiniteScrollAccount;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.RecruitApply;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.account.Member;

@Service
public class RecruitApplyServiceImpl implements RecruitApplyService {
	@Autowired
	IntroductionMapper introductionMapper;
	@Autowired
	ResumeMapper resumeMapper;
	@Autowired
	CompanyApplyMapper companyApplyMapper;
	@Autowired
	RecruitMapper recruitMapper;
	
	@Override
	public Map<String, Object> getRecruitSorceData(Member member) throws Exception {
		List<Introduction> introductionList = introductionMapper.selectIntroductionAll(member);
		List<ResumeBaseInfo> resumeBaseInfoList = resumeMapper.selectResumeOpenOne(member);
		
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("introductionList", introductionList);
		map.put("resumeBaseInfoList", resumeBaseInfoList);
		return map;
	}

	@Override
	public boolean recruitApply(CompanyApply companyApply) throws Exception {
		if(companyApplyMapper.selectOverlapApply(companyApply) != null)
			return false;

		companyApplyMapper.insertCompanyApply(companyApply);
		return true;
	}

	@Override
	public List<CompanyApply> getRecruitApplyListOfCompany(InfiniteScrollAccount infiniteScrollAccount) throws Exception {
		return companyApplyMapper.selectRecruitResumeList(infiniteScrollAccount);
	}

	@Override
	public void updateCompanyApplyState(CompanyApply companyApply) throws Exception {
		companyApplyMapper.updateCompanyApplyState(companyApply);
	}

	@Override
	public List<CompanyApply> getMemberRecuritList(InfiniteScrollAccount infiniteScrollAccount) throws Exception {
		return companyApplyMapper.selectRecruitList(infiniteScrollAccount);
	}
}