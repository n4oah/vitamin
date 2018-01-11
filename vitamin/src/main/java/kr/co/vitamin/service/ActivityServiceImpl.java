package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.ActivityMapper;
import kr.co.vitamin.repository.vo.Activity;

@Service
public class ActivityServiceImpl implements ActivityService {
	@Autowired
	private ActivityMapper activityMapper;
	
	@Override
	public Activity selectActivityByMemberNo(int memberNo) throws Exception {
		return activityMapper.selectActivityByMemberNo(memberNo);
	}
}