package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.EmailAuthMapper;
import kr.co.vitamin.repository.vo.EmailChangeAuth;

@Service
public class EmailAuthServiceImpl implements EmailAuthService {
	@Autowired
	EmailAuthMapper emailAuthMapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void insertEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception {
		emailAuthMapper.insertEmailChageAuth(changeAuth);
	}

	@Override
	public EmailChangeAuth selectEmailChangeAuth(EmailChangeAuth changeAuth) throws Exception {
		return emailAuthMapper.selectEmailChageAuth(changeAuth);
	}
}