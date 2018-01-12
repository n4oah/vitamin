package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.IntroductionMapper;
import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;

@Service
public class IntroductionServiceImpl implements IntroductionService{
	
	@Autowired
	private IntroductionMapper mapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void insertIntroduction(Introduction introduction, IntroductionCate introductionCate) throws Exception {
		Integer introductionNo = mapper.selectNextAutoIncrementIntroduction();
		
		mapper.insertIntroductionCate(introductionNo);
		mapper.insertIntroduction(introduction.getMemberNo());
	}

	@Override
	public List<Introduction> selectIntroductionList(Integer memberNo) throws Exception {

		return mapper.selectIntroductionList(memberNo);
	}

}
