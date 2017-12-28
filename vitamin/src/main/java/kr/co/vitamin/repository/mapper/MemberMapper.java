package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.Member;

public interface MemberMapper {
	public Member selectOverlapIdCheck(Member vo) throws Exception;
}