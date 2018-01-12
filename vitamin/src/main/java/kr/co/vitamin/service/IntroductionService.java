package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Introduction;
import kr.co.vitamin.repository.vo.IntroductionCate;

public interface IntroductionService {

	public void insertIntroduction(Introduction introduction, IntroductionCate introductionCate) throws Exception;

	public List<Introduction> selectIntroductionList(Integer memberNo) throws Exception;

}