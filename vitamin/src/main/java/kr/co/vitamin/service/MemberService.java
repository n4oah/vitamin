package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.member.Member;

public interface MemberService {
	public boolean getOverlapIdCheck(Member memberVO) throws Exception;
	public void signupMember(Member MemberVO, Address address, EmailToken emailTok) throws Exception;
}