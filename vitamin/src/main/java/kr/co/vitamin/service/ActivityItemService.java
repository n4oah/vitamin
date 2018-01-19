package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityFiles;
import kr.co.vitamin.repository.vo.ActivityItem;

public interface ActivityItemService {
	public List<ActivityItem> selectItemByActivityNo(int activityNo) throws Exception;
	
	public ActivityItem selectItemByItemNo(int itemNo) throws Exception;
	
	public void updateItemLocation(ActivityItem activityItem) throws Exception;
	
	public void insertItem(ActivityItem activityItem) throws Exception;
	
	public void deleteItem(int itemNo) throws Exception;
	
	public List<ActivityFiles> selectFileByActivityNo(int activityNo) throws Exception;
	
	public List<ActivityFiles> selectFileByItemNo(int itemNo) throws Exception;
	
	public void insertFile(ActivityFiles activityFiles) throws Exception;
	
	public void deleteFile(int fileNo) throws Exception;
}
