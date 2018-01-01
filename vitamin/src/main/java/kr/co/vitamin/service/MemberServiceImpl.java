package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.AddressMapper;
import kr.co.vitamin.repository.mapper.EmailTokenMapper;
import kr.co.vitamin.repository.mapper.MemberMapper;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.member.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private AddressMapper addressMapper;
	@Autowired
	private EmailTokenMapper emailTokMapper;
	
	@Override
	public boolean getOverlapIdCheck(Member memberVO) throws Exception {
		return memberMapper.selectOverlapIdCheck(memberVO) == null ? false : true;
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void signupMember(Member memberVO, Address address, EmailToken emailTok) throws Exception {
		int addressNo = addressMapper.selectNextAutoIncrement();
		address.setAddressNo(addressNo);
		memberVO.setAddressNo(addressNo);
		
		int emailTokenNo = emailTokMapper.selectNextAutoIncrement();
		memberVO.setEmailTokenNo(emailTokenNo);
		
		addressMapper.insertAddress(address);
		emailTokMapper.insertEmailToken(emailTok);
		memberMapper.insertMember(memberVO);
	}
}