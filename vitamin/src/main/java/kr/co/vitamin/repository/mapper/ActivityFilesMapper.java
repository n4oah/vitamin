package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityFiles;

public interface ActivityFilesMapper {
	public List<ActivityFiles> selectActivityFilesByActivityNo(int activityNo) throws Exception;
	public List<ActivityFiles> selectActivityFilesByItemNo(int itemNo) throws Exception;
	public void insertActivityFiles(ActivityFiles activityFiles) throws Exception;
}
