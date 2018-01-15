package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityList;

public interface ActivityListMapper {
	public List<ActivityList> selectActivityListByActivityNo(int activityNo) throws Exception;
	
	public void insertActivityList(ActivityList activityList) throws Exception;
	
	public void updateActivityListLocation(ActivityList activityList) throws Exception;
}
