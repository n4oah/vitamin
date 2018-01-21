package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.FormService;

public interface FormServiceMapper {
	public List<FormService> selectFormService() throws Exception;

	public List<Integer> bookmarkList(Integer memberNo) throws Exception;
}
