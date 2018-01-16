package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.ActivityItemMapper;
import kr.co.vitamin.repository.vo.ActivityItem;

@Service
public class ActivityItemServiceImpl implements ActivityItemService {
	@Autowired
	private ActivityItemMapper activityItemMapper;

	@Override
	public List<ActivityItem> selectItemByActivityNo(int activityNo)throws Exception {
		return activityItemMapper.selectActivityItemByActivityNo(activityNo);
	}

	@Override
	public void updateItemLocation(ActivityItem activityItem) throws Exception {
		activityItemMapper.updateActivityItemLocation(activityItem);
	}

	@Override
	public void insertItem(ActivityItem activityItem) throws Exception {
		activityItemMapper.insertActivityItem(activityItem);
		
	}

	@Override
	public void deleteItem(int itemNo) throws Exception {
		activityItemMapper.deleteActivityItem(itemNo);
	}
	
	
}