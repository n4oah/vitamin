package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.MemberMapper;
import kr.co.vitamin.repository.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public boolean getOverlapIdCheck(Member vo) throws Exception {
		return memberMapper.selectOverlapIdCheck(vo) == null ? false : true;
	}
}