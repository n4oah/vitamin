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
	public void insertIntroduction(Introduction introduction) throws Exception {
		Integer introductionNo = mapper.selectNextAutoIncrementIntroduction();
		introduction.setIntroductionNo(introductionNo);
		mapper.insertIntroduction(introduction);
	}

	@Override
	public List<Introduction> selectIntroductionList(Integer memberNo) throws Exception {

		return mapper.selectIntroductionList(memberNo);
	}

	@Override
	public void insertIntroductionCate(IntroductionCate introductionCate) throws Exception {
		Integer introductionNo = mapper.selectNextAutoIncrementIntroduction();
		introductionCate.setIntroductionNo(introductionNo);
		mapper.insertIntroductionCate(introductionCate);
		
	}

	@Override
	public Introduction selectIntroduction(Integer introductionNo) throws Exception {
		return mapper.selectIntroduction(introductionNo);
	}

	@Override
	public List<IntroductionCate> selectIntroductionCate(Integer introductionNo) throws Exception {
		return mapper.selectIntroductionCate(introductionNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteIntroduction(Integer introductionNo) throws Exception {
		mapper.deleteIntroduction(introductionNo);
		mapper.deleteIntroductionCate(introductionNo);
	}

}
