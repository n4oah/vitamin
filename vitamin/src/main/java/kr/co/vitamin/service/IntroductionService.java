package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;

public interface IntroductionService {

	public Integer insertIntroduction(Introduction introduction) throws Exception;

	public List<Introduction> selectIntroductionList(Introduction introduction) throws Exception;

	public void insertIntroductionCate(IntroductionCate introductionCate) throws Exception;

	public Introduction selectIntroduction(Integer introductionNo)throws Exception;

	public List<IntroductionCate> selectIntroductionCate(Integer introductionNo)throws Exception;

	public void deleteIntroduction(Integer introductionNo)throws Exception;

	public int selectIntroductionCount(Integer memberNo) throws Exception;

	public void updateIntroduction(Introduction introduction)throws Exception;

	public void updateIntroductionCate(IntroductionCate introductionCate)throws Exception;

	public Integer[] selectIntroductionCateNo(Integer introductionNo)throws Exception;

	public Integer selectNextAutoIncrementIntroduction() throws Exception;

	public boolean viewMemberCheck(Introduction introduction);

}
