package kr.co.vitamin.service;

import java.util.List;
import java.util.Map;

import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.InfiniteScrollAccount;
import kr.co.vitamin.repository.vo.account.Member;

public interface RecruitApplyService {
	public Map<String, Object> getRecruitSorceData(Member member) throws Exception;
	public boolean recruitApply(CompanyApply companyApply) throws Exception;
	public List<CompanyApply> getRecruitApplyListOfCompany(InfiniteScrollAccount infiniteScrollAccount) throws Exception;
	public void updateCompanyApplyState(CompanyApply companyApply) throws Exception;
	public List<CompanyApply> getMemberRecuritList(InfiniteScrollAccount infiniteScrollAccount) throws Exception;
}