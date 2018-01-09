package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Welfare;

public interface WelfareService {
	public void insertWelfare(Welfare welfare) throws Exception;
	public List<Welfare> selectWelfare(int no) throws Exception;
}
