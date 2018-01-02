package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.WelfareMapper;
import kr.co.vitamin.repository.vo.Welfare;

@Service
public class WelfareServiceImpl implements WelfareService {
	
	@Autowired
	private WelfareMapper welfareMapper;
	
	@Override
	public void insertWelfare(Welfare welfare) throws Exception {
		welfareMapper.insertWelfare(welfare);
	}
	
	@Override
	public List<Welfare> selectWelfare() throws Exception {
		return welfareMapper.selectWelfare();
	}
	
}
