package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.ProfileImage;

public interface FileMapper {
	public void insertFile(File file) throws Exception;
	public int selectLastNo() throws Exception;
	public File selectFile(int no) throws Exception;
	public ProfileImage selectAccountProfile(ProfileImage profile) throws Exception;
	public Integer selectNextAutoIncrement() throws Exception;
	public void insertProfile(ProfileImage profile) throws Exception;
	public void updateFile(File file) throws Exception;
	public void insertFile2(File file) throws Exception;
}
