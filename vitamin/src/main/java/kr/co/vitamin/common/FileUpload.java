package kr.co.vitamin.common;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {
	@Autowired
	ServletContext servletContext;
	
	private static String DEFAULT_ROOT;
	private static final String PROFILE_IMAGE[] = {"/profile", "profile"};
	
	private MultipartFile multiFile;
	private kr.co.vitamin.repository.vo.File fileVO;
	private String root;
	private boolean mkdirs;
	
	public FileUpload() {
		
	}
	
	public kr.co.vitamin.repository.vo.File makeFile(MultipartFile multiFile, String root) throws Exception {
		return makeFile(multiFile, root, true);
	}
	
	public kr.co.vitamin.repository.vo.File makeFile(MultipartFile multiFile, String root, boolean mkdirs) throws Exception {
		this.multiFile = multiFile;
		this.root = root;
		this.mkdirs = mkdirs;
		
		return makeFile();
	}
	
	private kr.co.vitamin.repository.vo.File makeFile() throws Exception {
		DEFAULT_ROOT = servletContext.getRealPath("/upload");
		System.out.println(DEFAULT_ROOT);
		
		if(multiFile.isEmpty())
			return null;
		
		File f = new File(DEFAULT_ROOT + root);
		if(mkdirs == true) {
			if(!f.exists()) {
				f.mkdirs();
			}
		} else if(mkdirs == false) {
			if(!f.exists()) {
				f.mkdir();
			}
		}
		
		String oriName = multiFile.getOriginalFilename();
		String ext = oriName.substring(oriName.lastIndexOf("."));
		Long fileSize = multiFile.getSize();
		String saveFileName = PROFILE_IMAGE[1] + "-" + UUID.randomUUID().toString() + ext;
		multiFile.transferTo(new File(DEFAULT_ROOT + root + "/" + saveFileName));
		
		fileVO = new kr.co.vitamin.repository.vo.File();
		fileVO.setFilePath(root);
		fileVO.setFileSize(fileSize + "");
		fileVO.setOriginalName(oriName);
		fileVO.setSystemName(saveFileName);
		
		return fileVO;
	}

	public static String getProfileImage() {
		return PROFILE_IMAGE[0];
	}
}
