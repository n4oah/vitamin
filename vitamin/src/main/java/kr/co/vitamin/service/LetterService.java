package kr.co.vitamin.service;

import java.util.List;
import java.util.Map;

import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.account.Account;

public interface LetterService {
	public boolean sendLetter(Letter letterVO, Account recvId) throws Exception;
	public List<Letter> getPageRecvLetterList(Map<String, Integer> map) throws Exception;
	public Integer getPageRecvFirstLetter(Integer accountNo) throws Exception;
	public List<Letter> getPageSendLetterList(Map<String, Integer> map) throws Exception;
	public Integer getPageSendFirstLetter(Integer accountNo) throws Exception;
}