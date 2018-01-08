package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Recruit;

public interface RecruitService {
	public void insertRecruit(Recruit recruit) throws Exception;
	public Recruit detailRecruit(int no) throws Exception;
}
