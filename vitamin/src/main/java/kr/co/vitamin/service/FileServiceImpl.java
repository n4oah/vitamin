package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.FileMapper;
import kr.co.vitamin.repository.vo.File;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void insertFile(File file) throws Exception {
		fileMapper.insertFile(file);
		
	}
	
	@Override
	public int selectLastNo() throws Exception {
		return fileMapper.selectLastNo();
	}
}
