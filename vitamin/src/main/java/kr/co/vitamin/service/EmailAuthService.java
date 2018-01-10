package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.EmailChangeAuth;

public interface EmailAuthService {
	public void insertEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception;
	public EmailChangeAuth selectEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception;
}