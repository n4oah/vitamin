package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void insertActivity(Activity activity) throws Exception {
		activityMapper.insertActivity(activity);
	}
	
	@Override
	public void updateActivityName(Activity activity) throws Exception {
		activityMapper.updateActivityName(activity);
	}
	@Override
	public void updateActivityPerm(Activity activity) throws Exception {
		activityMapper.updateActivityPerm(activity);
	}
	@Override
	public void updateActivityBackground(Activity activity) throws Exception {
		activityMapper.updateActivityBackground(activity);
	}
	@Override
	public void updateActivityAskagain(Activity activity) throws Exception {
		activityMapper.updateActivityAskagain(activity);
	}
}