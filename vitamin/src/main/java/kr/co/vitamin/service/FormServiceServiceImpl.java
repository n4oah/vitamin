package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.FormServiceMapper;
import kr.co.vitamin.repository.vo.FormService;

@Service
public class FormServiceServiceImpl implements FormServiceService{
	
	@Autowired
	private FormServiceMapper formServiceMapper;
	
	@Override
	public List<FormService> selectFormService() throws Exception {
		
		return formServiceMapper.selectFormService();
	}
	
	@Override
	public List<Integer> bookmarkList(Integer memberNo) throws Exception {
		// TODO Auto-generated method stub
		return formServiceMapper.bookmarkList(memberNo);
	}
}
