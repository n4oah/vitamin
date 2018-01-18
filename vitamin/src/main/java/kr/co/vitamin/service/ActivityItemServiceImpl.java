package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.ActivityFilesMapper;
import kr.co.vitamin.repository.mapper.ActivityItemMapper;
import kr.co.vitamin.repository.vo.ActivityFiles;
import kr.co.vitamin.repository.vo.ActivityItem;

@Service
public class ActivityItemServiceImpl implements ActivityItemService {
	@Autowired
	private ActivityItemMapper activityItemMapper;
	@Autowired
	private ActivityFilesMapper activityFilesMapper;

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

	@Override
	public List<ActivityFiles> selectFileByActivityNo(int activityNo) throws Exception {
		return activityFilesMapper.selectActivityFilesByActivityNo(activityNo);
	}

	@Override
	public void insertFile(ActivityFiles activityFiles) throws Exception {
		activityFilesMapper.insertActivityFiles(activityFiles);
	}
}