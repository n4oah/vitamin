package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityList;

public interface ActivityListMapper {
	public List<ActivityList> selectActivityListByActivityNo(int activityNo) throws Exception;
	
	public ActivityList selectActivityListByListNo(int listNo) throws Exception;
	
	public void insertActivityList(ActivityList activityList) throws Exception;
	
	public void updateActivityListName(ActivityList activityList) throws Exception;
	public void updateActivityListLocation(ActivityList activityList) throws Exception;
	public void updateActivityListPerm(ActivityList activityList) throws Exception;
	public void updateActivityListFix(ActivityList activityList) throws Exception;
	
	public void deleteActivityList(int listNo) throws Exception;
}
