package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;

public interface IntroductionMapper {

	public void insertInroduction(Integer memberNo) throws Exception;

	public List<Introduction> selectIntroductionList(Integer memberNo) throws Exception;

	public int selectNextAutoIncrementIntroduction() throws Exception;

	public void insertIntroductionCate(IntroductionCate introductionCate) throws Exception;

	public void insertIntroduction(Introduction introduction) throws Exception;

	public Introduction selectIntroduction(Integer introductionNo)throws Exception;

	public List<IntroductionCate> selectIntroductionCate(Integer introductionNo)throws Exception;

	public void deleteIntroduction(Integer introductionNo)throws Exception;

	public void deleteIntroductionCate(Integer introductionNo)throws Exception;
}
