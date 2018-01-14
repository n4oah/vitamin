package kr.co.vitamin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.AccountMapper;
import kr.co.vitamin.repository.mapper.LetterMapper;
import kr.co.vitamin.repository.vo.Letter;
import kr.co.vitamin.repository.vo.account.Account;

@Service
public class LetterServiceImpl implements LetterService{
	@Autowired
	LetterMapper letterMapper;
	@Autowired
	AccountMapper accountMapper;
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean sendLetter(Letter letterVO, Account accountVO) throws Exception {
		Account account = accountMapper.selectAccountOfId(accountVO);
		if(account != null) {
			letterVO.setRecvAccountNo(account.getAccountNo());
			letterMapper.insertLetter(letterVO);
			return true;
		}
		return false;
	}

	@Override
	public List<Letter> getPageRecvLetterList(Map<String, Integer> map) throws Exception {
		return letterMapper.selectPageRecvLetterList(map);
	}

	@Override
	public Integer getPageRecvFirstLetter(Integer accountNo) throws Exception {
		return letterMapper.selectPageRecvFirstLetter(accountNo);
	}
	
	@Override
	public List<Letter> getPageSendLetterList(Map<String, Integer> map) throws Exception {
		return letterMapper.selectPageSendLetterList(map);
	}

	@Override
	public Integer getPageSendFirstLetter(Integer accountNo) throws Exception {
		return letterMapper.selectPageSendFirstLetter(accountNo);
	}
}
