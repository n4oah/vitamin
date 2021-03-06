package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.EmailToken;

public interface EmailTokenMapper {
	public void insertEmailToken(EmailToken emailTok) throws Exception;
	public EmailToken selectEmailToken(EmailToken emailTok) throws Exception;
	public EmailToken selectEmailToken2(EmailToken emailTok) throws Exception;
	public int selectNextAutoIncrement() throws Exception;
	public void deleteEmailToken(EmailToken emailTok) throws Exception;
	
}