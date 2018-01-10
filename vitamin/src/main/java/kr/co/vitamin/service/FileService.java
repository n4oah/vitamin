package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.File;

public interface FileService {
	
	public void insertFile(File file) throws Exception;
	public int selectLastNo() throws Exception;
	public File selectFile(int no) throws Exception;
}
