package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityItem;

public interface ActivityItemMapper {
	public List<ActivityItem> selectActivityItemByActivityNo(int activityNo) throws Exception;
	
	public ActivityItem selectActivityItemByItemNo(int itemNo) throws Exception;
	
	public void insertActivityItem(ActivityItem activityItem) throws Exception;
	
	public void updateActivityItemLocation(ActivityItem activityItem) throws Exception;
	
	public void deleteActivityItem(int itemNo) throws Exception;
}
