package kr.co.vitamin.service;

import java.util.Map;

import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.Member;

public interface RecruitApplyService {
	public Map<String, Object> getRecruitSorceData(Member member) throws Exception;
}