package kr.co.vitamin.service;

import java.util.HashMap;

import kr.co.vitamin.repository.vo.Activity;

public interface ActivityService {
	public Activity selectActivityByMemberNo(int memberNo) throws Exception;
	
	public void insertActivity(Activity activity) throws Exception;
	
	public void updateActivityName(Activity activity) throws Exception;
	public void updateActivityPerm(Activity activity) throws Exception;
	public void updateActivityBackground(Activity activity) throws Exception;
	public void updateActivityAskagain(Activity activity) throws Exception;
	
	public Integer checkPermission(HashMap<String, Integer> accountNo) throws Exception;
}
