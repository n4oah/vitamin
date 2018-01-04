package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;

public interface AutoSigninMapper {
	public void insertAutoSignin(AutoSignin autoSignin) throws Exception;
	public void deleteAutoSignin(AutoSignin autoSignin) throws Exception;
	public Account selectAutoSignAccount(AutoSignin autoSignin) throws Exception;
}