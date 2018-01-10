package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.EmailChangeAuth;

public interface EmailAuthMapper {
	public void insertEmailChageAuth(EmailChangeAuth changeAuth) throws Exception;
	public EmailChangeAuth selectEmailChageAuth(EmailChangeAuth changeAuth) throws Exception;
	public void deleteEmailChageAuth(EmailChangeAuth changeAuth) throws Exception;
}