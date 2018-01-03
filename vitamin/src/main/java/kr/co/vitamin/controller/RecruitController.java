package kr.co.vitamin.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.vitamin.repository.vo.FormService;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.Welfare;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.service.AddressService;
import kr.co.vitamin.service.FileService;
import kr.co.vitamin.service.FormServiceService;
import kr.co.vitamin.service.RecruitService;
import kr.co.vitamin.service.SchoolLevelService;
import kr.co.vitamin.service.WelfareService;

@Controller
public class RecruitController {
	
	@Autowired
	private SchoolLevelService schoolLevelService;
	
	@Autowired
	private FormServiceService formServiceService;
	
	@Autowired
	private FileService fileService;  
	
	@Autowired
	private AddressService addressService;  
	
	@Autowired
	private WelfareService welfareService;  
	
	@Autowired
	private RecruitService recruitService;
	
	@RequestMapping("/recruit/recruitWriteForm.do")
	public void recruitWriteForm(Model model) throws Exception{
		List<SchoolLevel> schoolLevelList = schoolLevelService.getSchoolLevels();
		List<FormService> formServiceList = formServiceService.selectFormService();
		System.out.println(formServiceList);
		
		
		model.addAttribute("schoolLevelList", schoolLevelList);
		model.addAttribute("formServiceList", formServiceList);
	}
	
	@RequestMapping("/recruit/recruitWrite.do")
	public String recruitWrtie(Recruit recruit, Welfare welfare, Address address) throws Exception {
		String filePath = "C:\\kang\\project\\vitamin\\src\\main\\webapp\\WEB-INF\\resumeFile";
		int fileNo = -1;

		System.out.println(recruit);
		System.out.println(welfare);
		System.out.println(address);
		
		address.parseData();
		
		java.io.File fileDir = new java.io.File(filePath);
		if(!fileDir.exists()) fileDir.mkdirs();
		
		MultipartFile mf = recruit.getAttachFile();
		
		if(mf != null && !mf.isEmpty()) {
			File file = new File();
			
			String fileOriginName = mf.getOriginalFilename();
			int t = fileOriginName.lastIndexOf(".");
			String ext = fileOriginName.substring(t+1);
			String fileSystemName = UUID.randomUUID().toString()+"."+ext;
			
			file.setFilePath("/resumeFile");
			file.setOriginalName(fileOriginName);
			file.setSystemName(fileSystemName);
			file.setFileSize(Long.toString(mf.getSize()));
			
			String fileRealPath = filePath+"/"+fileSystemName;
			mf.transferTo(new java.io.File(fileRealPath));
			
			fileService.insertFile(file);
			fileNo = fileService.selectLastNo();
			System.out.println("FileNo : " + fileNo);
		}
		
		
		// 파일 번호 추출
		if (fileNo > -1)
			recruit.setRecruitFormFileNo(fileNo);
		
		int addressNo = -1;
		
		addressService.insertAddress2(address);
		addressNo = addressService.selectNextAutoIncrement();
		
		if (addressNo > -1)
			recruit.setAddressNo(addressNo);

		int recruitNo = 1;
		
		for (int i = 0; i < welfare.getWelfareTitleList().length; i++) {
			welfareService.insertWelfare(new Welfare(recruitNo, welfare.getWelfareTitleList()[i], welfare.getWelfareContentList()[i]));
		}
		
		recruit.setCompanyNo(1);
		
		recruitService.insertRecruit(recruit);

		System.out.println(recruit);
		System.out.println(welfare);
		System.out.println(address);
		
		return "redirect:../search/companySearch.do";
	}
	
	
	
	@RequestMapping("/recruit/recruitDetail.do")
	public void recruitDetail() {
		
	}
}
