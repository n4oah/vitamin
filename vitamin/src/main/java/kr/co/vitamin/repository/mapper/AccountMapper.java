package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;

public interface AccountMapper {
	public Account selectOverlapIdCheck(Account vo) throws Exception;
	public void insertMember(Member vo) throws Exception;
	public void insertCompany(Company vo) throws Exception;
	public void insertAccount(Account vo) throws Exception;
	public void updateEmailToken(Account vo) throws Exception;
	public Account selectLoginAccount(Account vo) throws Exception;
	public Integer selectMemberType(Account vo) throws Exception;
	public int selectNextAutoIncrement() throws Exception;
	public Account selectAccountOfId(Account id) throws Exception;
	public void updateAccount(Account accountVO) throws Exception;
	public Account selectAccountOfNo(Account account) throws Exception;
	public Integer selectProfileNo(Account account) throws Exception;
	public Account selectAccount(Integer accountNo) throws Exception;
	public Account selectAccountOfMemberOrCompanyNo(Account accountVO) throws Exception;
}