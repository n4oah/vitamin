package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.ActivityListMapper;
import kr.co.vitamin.repository.vo.ActivityList;

@Service
public class ActivityListServiceImpl implements ActivityListService {
	@Autowired
	private ActivityListMapper activityListMapper;

	@Override
	public List<ActivityList> selectListByActivityNo(int activityNo) throws Exception {
		return activityListMapper.selectActivityListByActivityNo(activityNo);
	}
	
	@Override
	public ActivityList selectListByListNo(int listNo) throws Exception {
		return activityListMapper.selectActivityListByListNo(listNo);
	}

	@Override
	public void insertList(ActivityList activityList) throws Exception {
		activityListMapper.insertActivityList(activityList);
	}

	
	
	@Override
	public void updateListName(ActivityList activityList) throws Exception {
		activityListMapper.updateActivityListName(activityList);
	}
	@Override
	public void updateListLocation(ActivityList activityList) throws Exception {
		activityListMapper.updateActivityListLocation(activityList);
	}
	@Override
	public void updateListPerm(ActivityList activityList) throws Exception {
		activityListMapper.updateActivityListPerm(activityList);
	}
	@Override
	public void updateListFix(ActivityList activityList) throws Exception {
		activityListMapper.updateActivityListFix(activityList);
	}

	@Override
	public void deleteList(int listNo) throws Exception {
		activityListMapper.deleteActivityList(listNo);
	}
	
	
}