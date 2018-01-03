package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.AddressMapper;
import kr.co.vitamin.repository.mapper.EmailTokenMapper;
import kr.co.vitamin.repository.mapper.AccountMapper;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountSignup;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper memberMapper;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private EmailTokenMapper emailTokMapper;
	
	@Override
	public boolean getOverlapIdCheck(Account actionVO) throws Exception {
		return memberMapper.selectOverlapIdCheck(actionVO) == null ? false : true;
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void signupMember(AccountSignup actionVO, Address address, EmailToken emailTok) throws Exception {
		int addressNo = addressMapper.selectNextAutoIncrement();
		address.setAddressNo(addressNo);
		actionVO.setAddressNo(addressNo);
		
		int emailTokenNo = emailTokMapper.selectNextAutoIncrement();
		actionVO.setEmailTokenNo(emailTokenNo);
		
		addressMapper.insertAddress(address);
		emailTokMapper.insertEmailToken(emailTok);
		
		int accountNo = memberMapper.selectNextAutoIncrement();
		actionVO.setAccountNo(accountNo);
		
		memberMapper.insertAccount((Account)actionVO);
		
		if(actionVO.getMemberType() == 1) {
			memberMapper.insertMember(actionVO.getMember());
		} else if(actionVO.getMemberType() == 2) {
			memberMapper.insertCompany(actionVO.getCompany());			
		}
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void emailCertify(EmailToken emailTok) throws Exception {
		EmailToken emailToken = emailTokMapper.selectEmailToken2(emailTok);
		if(emailToken != null) {
			Account accountVO = new Member();
			accountVO.setEmailTokenNo(emailToken.getEmailTokenNo());
			accountVO.setEmailTokenStatus(2);
			
			memberMapper.updateEmailToken(accountVO);
			emailTokMapper.deleteEmailToken(emailToken);
			return;
		}
		throw new Exception();
	}

	@Override
	public Account login(Account accountVO) throws Exception {
		accountVO.setMemberType(memberMapper.selectMemberType(accountVO));
		return memberMapper.selectLoginAccount(accountVO);
	}
}