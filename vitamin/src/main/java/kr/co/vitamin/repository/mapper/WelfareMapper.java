package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Welfare;

public interface WelfareMapper {
	public void insertWelfare(Welfare welfare) throws Exception;
	public List<Welfare> selectWelfare(int no) throws Exception;
}
