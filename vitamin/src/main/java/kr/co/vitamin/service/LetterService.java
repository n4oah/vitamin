package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.account.Account;

public interface LetterService {
	public boolean sendLetter(Letter letterVO, Account recvId) throws Exception;
}