package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.AddressMapper;
import kr.co.vitamin.repository.mapper.AutoSigninMapper;
import kr.co.vitamin.repository.mapper.EmailTokenMapper;
import kr.co.vitamin.repository.mapper.FileMapper;
import kr.co.vitamin.repository.mapper.AccountMapper;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.ProfileImage;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;
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
	@Autowired
	private AutoSigninMapper autoSigninMapper;
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public boolean getOverlapIdCheck(Account actionVO) throws Exception {
		return memberMapper.selectOverlapIdCheck(actionVO) == null ? false : true;
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void signupMember(AccountInfo actionVO, Address address, EmailToken emailTok) throws Exception {
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
		Integer memberType = memberMapper.selectMemberType(accountVO);
		accountVO.setMemberType(memberType);
		if(memberType == null) {
			return null;
		}
		return memberMapper.selectLoginAccount(accountVO);
	}

	@Override
	public void setAutoSignin(AutoSignin autoSignin) throws Exception {
		autoSigninMapper.insertAutoSignin(autoSignin);
	}
	
	@Override
	public void deleteAutoSignin(AutoSignin autoSignin) throws Exception {
		autoSigninMapper.deleteAutoSignin(autoSignin);
	}

	@Override
	public Account getAutoSigninToToken(AutoSignin autoSignin) throws Exception {
		Account account = autoSigninMapper.selectAutoSignAccount(autoSignin);
		return memberMapper.selectLoginAccount(account);
	}

	@Override
	public void logout(AutoSignin autoSignin) throws Exception {
		autoSigninMapper.deleteAutoSignin(autoSignin);
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public Account modifyAccount(Account accountVO, Address address, File file) throws Exception {
		boolean logoChk = false;
		
		if(accountVO.getMemberType() == 2) {
			if(((Company)accountVO).getLogoNo() == null) {
				Integer fileNo = fileMapper.selectNextAutoIncrement();
				file.setFileNo(fileNo);
				
				((Company)accountVO).setLogoNo(fileNo);
				logoChk = true;
			}
		}
		
		memberMapper.updateAccount(accountVO);
		if(address != null) {
			address.setAddressNo(accountVO.getAddressNo());
			addressMapper.updateAddress(address);
		}
		if(file != null) {
			Integer fileNo = null;
			if(accountVO.getMemberType() == 1) {
				ProfileImage profile = new ProfileImage();
				profile.setAccountNo(accountVO.getAccountNo());
				profile = fileMapper.selectAccountProfile(profile);
				
				if(profile == null) {
					fileNo = fileMapper.selectNextAutoIncrement();
					
					profile = new ProfileImage();
					profile.setFileNo(fileNo);
					profile.setAccountNo(accountVO.getAccountNo());
					profile.setProfileType(0);
					
					file.setFileNo(fileNo);
					
					fileMapper.insertProfile(profile);
					fileMapper.insertFile2(file);
				} else {
					file.setFileNo(profile.getFileNo());
					fileMapper.updateFile(file);
				}
			} else if(accountVO.getMemberType() == 2) {
				Integer logoNo = ((Company)accountVO).getLogoNo();
				if(logoChk == true) {
					System.out.println("인서트");
					fileNo = fileMapper.selectNextAutoIncrement();
					file.setFileNo(fileNo);
					fileMapper.insertFile2(file);
				} else {
					System.out.println("업뎃");
					file.setFileNo(logoNo);
					fileMapper.updateFile(file);
				}
			}
		}
		return memberMapper.selectAccountOfNo(accountVO);
	}

	@Override
	public Integer getProfileNo(Account accountVO) throws Exception {
		return memberMapper.selectProfileNo(accountVO);
	}
}