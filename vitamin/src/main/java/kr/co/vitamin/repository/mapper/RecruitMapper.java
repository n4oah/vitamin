package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Recruit;

public interface RecruitMapper {
	public void insertRecruit(Recruit recruit) throws Exception;
	public Recruit detailRecruit(int no) throws Exception;
	public int selectRecruitNo() throws Exception;
	public List<Recruit> selectNewRecruitList() throws Exception;
}
