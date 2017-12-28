package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Member;

public interface MemberService {
	public boolean getOverlapIdCheck(Member vo) throws Exception;
}