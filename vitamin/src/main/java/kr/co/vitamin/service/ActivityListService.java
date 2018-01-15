package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityList;

public interface ActivityListService {
	public List<ActivityList> selectListByActivityNo(int activityNo) throws Exception;
	
	public void insertList(ActivityList activityList) throws Exception;
	
	public void updateListLocation(ActivityList activityList) throws Exception;
}
