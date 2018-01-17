package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.ActivityFiles;

public interface ActivityFilesMapper {
	public List<ActivityFiles> selectActivityFiles() throws Exception;
	
	public void insertActivityFiles(ActivityFiles activityFiles) throws Exception;
}
