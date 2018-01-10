package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.EmailChangeAuth;

public interface EmailAuthService {
	public void insertEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception;
	public EmailChangeAuth getEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception;
}