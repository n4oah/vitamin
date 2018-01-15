package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.InfiniteScrollAccount;

public interface CompanyApplyMapper {
	public void insertCompanyApply(CompanyApply companyApply) throws Exception;
	public CompanyApply selectCompanyApply(Integer comapplyNo) throws Exception;
	public CompanyApply selectOverlapApply(CompanyApply companyApply) throws Exception;
	public CompanyApply selectRecruitList(InfiniteScrollAccount infiniteScrollAccount) throws Exception;
	public CompanyApply selectRecruitResumeList(InfiniteScrollAccount infiniteScrollAccount) throws Exception;
}