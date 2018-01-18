package kr.co.vitamin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.ResumeMapper;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.Hope;
import kr.co.vitamin.repository.vo.HopeBusiness;
import kr.co.vitamin.repository.vo.LicensingDepartment;
import kr.co.vitamin.repository.vo.MajorCate;
import kr.co.vitamin.repository.vo.PrevCompany;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.ResumeCertification;
import kr.co.vitamin.repository.vo.School;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.account.Member;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	private ResumeMapper mapper;


	@Override
	public ResumeBaseInfo resumeInfo(int resumeNo) throws Exception {
		return mapper.selectResumeInfo(resumeNo);

	}

	@Override
	public ArmyService armyInfo(int resumeNo) throws Exception {
		return mapper.selectArmyServiceInfo(resumeNo);
	}

	@Override
	public String resumeJobState(String jobState) throws Exception {
		return mapper.selectJobState(jobState);
	}

	@Override
	public String resumeMarryState(String marryState) throws Exception {
		return mapper.selectMarryState(marryState);
	}

	@Override
	public String resumeBohoonState(String bohoonState) throws Exception {
		return mapper.selectBohoonState(bohoonState);
	}

	@Override
	public String resumeSupportState(String supportState) throws Exception {
		return mapper.selectSupportState(supportState);
	}

	@Override
	public String resumeArmyState(Integer armyServiceState) throws Exception {
		return mapper.selectArmyState(armyServiceState);
	}

	@Override
	public List<City> citySelect() throws Exception {
		return mapper.selectCity();
	}

	@Override
	public List<Area> areaSelect(Integer cityCode) throws Exception {
		return mapper.selectArea(cityCode);
	}

	@Override
	public List<Certificate> certificationSelect(String name) throws Exception {
		return mapper.selectCertification(name);
	}

	@Override
	public LicensingDepartment licensingDepartmentSelect(Integer licensingDepartmentNo) throws Exception {
		return mapper.selectLicensingDepartment(licensingDepartmentNo);
	}

	@Override
	public List<BusinessType> businessTypeSelect() throws Exception {
		return mapper.selectBusinessType();
	}

	@Override
	public BusinessType choiceBusiness(Integer businessNo) throws Exception {
		return mapper.chooseBusinessType(businessNo);
	}

	@Override
	public List<ResumeBaseInfo> resumeList(Integer memberNo) throws Exception {
		
		return mapper.selectResume(memberNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo, ArmyService armyService, School school, PrevCompany prevCompany,
			ResumeCertification resumeCertification, Hope hope, HopeBusiness hopeBusiness) throws Exception {
		int armyNo = mapper.selectNextAutoIncrementArmy();
		int schoolNo = mapper.selectNextAutoIncrementSchool();
		int prevCompanyNo = mapper.selectNextAutoIncrementPrevCompany();
		int certificationNo = mapper.selectNextAutoIncrementCertification();
		int hopeNo = mapper.selectNextAutoIncrementHope();
		int hopeBusinessNo = mapper.selectNextAutoIncrementHopeBusiness();
		
		
		hopeBusiness.setHopeBusiness(hopeBusinessNo);
		hopeBusiness.setHopeNo(hopeNo);
		hope.setHopeNo(hopeNo);
		resumeCertification.setCertificationNo(certificationNo);
		armyService.setArmyServiceNo(armyNo);
		school.setSchoolNo(schoolNo);
		prevCompany.setPrevCompanyNo(prevCompanyNo);
		resumeBaseInfo.setSchoolLevelNo(school.getSchoolLevelNo());
		resumeBaseInfo.setHopeNo(hopeNo);
		resumeBaseInfo.setCertificationNo(certificationNo);
		resumeBaseInfo.setArmyServiceNo(armyNo);
		resumeBaseInfo.setSchoolNo(schoolNo);
		resumeBaseInfo.setPrevCompanyNo(prevCompanyNo);
		
		mapper.insertHopeBusiness(hopeBusiness);
		mapper.insertHope(hope);
		mapper.insertCertification(resumeCertification);
		mapper.insertPrevCompany(prevCompany);
		mapper.insertArmyService(armyService);
		mapper.insertSchool(school);
		mapper.insertResume(resumeBaseInfo);
	}

	@Override
	public List<MajorCate> majorSelect(String majorCategory) throws Exception {
		
		return mapper.selectMajor(majorCategory);
	}

	@Override
	public Member baseInfoSelect(Integer resumeNo) throws Exception {
		
		return mapper.selectBaseInfo(resumeNo);
	}

	@Override
	public Address addressSelect(Integer resumeNo) throws Exception {
		
		return mapper.selectAddress(resumeNo);
	}

	@Override
	public SchoolLevel resumeSchool(Integer resumeNo) throws Exception {
		return mapper.selectSchool(resumeNo);
	}

	@Override
	public PrevCompany resumePrevCompany(Integer resumeNo) throws Exception {
		return mapper.selectPrevCompany(resumeNo);
	}

	@Override
	public ResumeCertification resumeCertification(Integer resumeNo) throws Exception {
		return mapper.selectResumeCertification(resumeNo);
	}

	@Override
	public Hope resumeHope(Integer resumeNo) throws Exception {
		return mapper.selectHope(resumeNo);
	}

	@Override
	public String resumeHopeBusiness(Integer hopeNo) throws Exception {
		HopeBusiness hopeBusiness = mapper.selectBusinessNo(hopeNo);
		String[] businessNo = hopeBusiness.getBusinessNo().split("\\|");
		String businessType="";
		
		for (String str : businessNo) {
			Integer no = Integer.parseInt(str);
			BusinessType bt = mapper.selectHopeBusiness(no);
			businessType += bt.getBtype()+" > "+bt.getBusinessContent()+",";
		}
		
		return businessType.substring(0,businessType.lastIndexOf(","));
	}

	@Override
	public void deleteResume(Integer resumeNo) throws Exception {
			mapper.deleteResume(resumeNo);
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateOpenState(ResumeBaseInfo resumeBaseInfo) throws Exception {
		mapper.updateOpenState(resumeBaseInfo);
		mapper.updateAllOpenState(resumeBaseInfo);
		
		
		
	}

	@Override
	public boolean viewMemberCheck(CompanyApply companyApply) throws Exception {
		return mapper.viewMemberCheck(companyApply) != null ? true : false;
	}

	@Override
	public boolean viewCompanyCheck(Map<String, Integer> map) throws Exception {
		System.out.println(mapper.viewCompanyCheck(map));
		return mapper.viewCompanyCheck(map) != null ? true : false;
	}

	
}
