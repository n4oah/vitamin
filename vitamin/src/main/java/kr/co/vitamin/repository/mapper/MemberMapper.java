package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.member.Member;

public interface MemberMapper {
	public Member selectOverlapIdCheck(Member vo) throws Exception;
	public void insertMember(Member vo) throws Exception;
	public void updateEmailToken(Member vo) throws Exception;
	public Member selectLoginMember(Member vo) throws Exception;
}