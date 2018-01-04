package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountSignup;

public interface AccountService {
	public boolean getOverlapIdCheck(Account accountVO) throws Exception;
	public void signupMember(AccountSignup accountSignupVO, Address address, EmailToken emailTok) throws Exception;
	public void emailCertify(EmailToken emailTok) throws Exception;
	public Account login(Account accountVO) throws Exception;
	public void setAutoSignin(AutoSignin autoSignin) throws Exception;
	public void deleteAutoSignin(AutoSignin autoSignin) throws Exception;
	public Account getAutoSigninToToken(AutoSignin autoSignin) throws Exception;
}