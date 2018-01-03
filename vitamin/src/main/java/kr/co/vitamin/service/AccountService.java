package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.member.Member;

public interface AccountService {
	public boolean getOverlapIdCheck(Member memberVO) throws Exception;
	public void signupMember(Member MemberVO, Address address, EmailToken emailTok) throws Exception;
	public void emailCertify(EmailToken emailTok) throws Exception;
	public Member login(Member memberVO) throws Exception;
}