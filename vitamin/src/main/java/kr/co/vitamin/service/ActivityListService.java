package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityList;

public interface ActivityListService {
	public List<ActivityList> selectListByActivityNo(int activityNo) throws Exception;
	
	public ActivityList selectListByListNo(int listNo) throws Exception;
	
	public void insertList(ActivityList activityList) throws Exception;
	
	public void updateListLocation(ActivityList activityList) throws Exception;
	public void updateListPerm(ActivityList activityList) throws Exception;
	public void updateListFix(ActivityList activityList) throws Exception;
	
	public void deleteList(int listNo) throws Exception;
}
