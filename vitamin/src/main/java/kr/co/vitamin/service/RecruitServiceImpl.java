package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.RecruitMapper;
import kr.co.vitamin.repository.vo.Recruit;

@Service
public class RecruitServiceImpl implements RecruitService {
	
	@Autowired
	private RecruitMapper recruitMapper;
	
	@Override
	public void insertRecruit(Recruit recruit) throws Exception {
		 recruitMapper.insertRecruit(recruit);
	}
	@Override
	public Recruit detailRecruit(int no) throws Exception {
		return recruitMapper.detailRecruit(no);
	}
}
