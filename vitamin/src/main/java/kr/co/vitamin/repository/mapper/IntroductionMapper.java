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
}
