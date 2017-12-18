package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.SearchMapper;
import kr.co.vitamin.repository.vo.City;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchMapper searchMapper;

	@Override
	public List<City> selectCity() throws Exception {
		return searchMapper.selectCity();
	}
}
