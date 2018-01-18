package kr.co.vitamin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Integer insertIntroduction(Introduction introduction) throws Exception {
		Integer introductionNo = mapper.selectNextAutoIncrementIntroduction();
		introduction.setIntroductionNo(introductionNo);
		mapper.insertIntroduction(introduction);
		return introductionNo;
	}

	@Override
	public List<Introduction> selectIntroductionList(Introduction introduction) throws Exception {

		return mapper.selectIntroductionList(introduction);
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

	@Override
	public int selectIntroductionCount(Integer memberNo) throws Exception {
		return mapper.selectIntroductionCount(memberNo);
	}

	@Override
	public void updateIntroduction(Introduction introduction) throws Exception {
		mapper.updateIntroduction(introduction);
		
	}

	@Override
	public void updateIntroductionCate(IntroductionCate introductionCate) throws Exception {
		mapper.updateIntroductionCate(introductionCate);
		
	}

	@Override
	public Integer[] selectIntroductionCateNo(Integer introductionNo) throws Exception {
		return mapper.selectIntroductionCateNo(introductionNo);
	}
	
	@Override
	public Integer selectNextAutoIncrementIntroduction() throws Exception {
		return mapper.selectNextAutoIncrementIntroduction();
	}

	@Override
	public boolean viewMemberCheck(Introduction introduction) {
		mapper.viewMemberCheck(introduction);
		return false;
	}
}
