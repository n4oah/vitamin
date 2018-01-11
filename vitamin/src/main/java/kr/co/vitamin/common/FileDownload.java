package kr.co.vitamin.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.vitamin.service.FileService;

@Controller
@RequestMapping("/common")
public class FileDownload {
	@Autowired
	ServletContext servletContext;
	@Autowired
	FileService fileService;
	
	@RequestMapping("/fileDown.do")
	public void fileDown(HttpServletResponse response, kr.co.vitamin.repository.vo.File file) throws Exception {
		file = fileService.selectFile(file.getFileNo());
		System.out.println("afpsajdfgpoisajdoij");
		
		if(file != null) {
			File f = new File(servletContext.getRealPath("/upload" + file.getFilePath() + "/" + file.getSystemName()));
			file.setOriginalName(new String(file.getOriginalName().getBytes("UTF-8"), "8859_1"));
			
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getOriginalName());
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Length", String.valueOf(f.length()));
			
			FileInputStream fis = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			OutputStream out = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			FileCopyUtils.copy(fis, out);
			
			bos.close();
			out.close();
			bis.close();
			fis.close();
		}
	}
	
	/*@RequestMapping("/fileDown")
	@ResponseBody
	public void fileDown(HttpServletResponse response, kr.co.vitamin.repository.vo.File file) throws IOException {
		System.out.println(file);
		System.out.println(file.getFilePath() + file.getSystemName());
		
		File f = new File(servletContext.getRealPath(file.getFilePath() + file.getSystemName()));
		
		response.setHeader("Content-Type", "application/octet-stream");
		file.setOriginalName(new String(file.getOriginalName().getBytes("UTF-8"), "8859_1"));
		response.setHeader("Content-Disposition", "attachment;filename=" + file.getOriginalName());
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Length", String.valueOf(f.length()));
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if(ch == -1) break;
			
			bos.write(ch);
		}
		
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}*/
}
