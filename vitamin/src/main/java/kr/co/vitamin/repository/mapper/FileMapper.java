package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.File;

public interface FileMapper {
	public void insertFile(File file) throws Exception;
	public int selectLastNo() throws Exception;
	
}
