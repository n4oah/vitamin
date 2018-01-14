package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;

public interface AccountService {
	public boolean getOverlapIdCheck(Account accountVO) throws Exception;
	public void signupMember(AccountInfo accountSignupVO, Address address, EmailToken emailTok) throws Exception;
	public void emailCertify(EmailToken emailTok) throws Exception;
	public Account login(Account accountVO) throws Exception;
	public void setAutoSignin(AutoSignin autoSignin) throws Exception;
	public void deleteAutoSignin(AutoSignin autoSignin) throws Exception;
	public Account getAutoSigninToToken(AutoSignin autoSignin) throws Exception;
	public void logout(AutoSignin autoSignin) throws Exception;
	public Account modifyAccount(Account accountVO, Address address, File file) throws Exception;
	public Integer getProfileNo(Account accountVO) throws Exception;
	public Account getAccount(Integer accountNo) throws Exception;
}