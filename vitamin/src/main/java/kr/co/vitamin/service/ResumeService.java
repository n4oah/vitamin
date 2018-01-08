package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.Hope;
import kr.co.vitamin.repository.vo.HopeBusiness;
import kr.co.vitamin.repository.vo.LicensingDepartment;
import kr.co.vitamin.repository.vo.MajorCate;
import kr.co.vitamin.repository.vo.PrevCompany;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;
import kr.co.vitamin.repository.vo.ResumeCertification;
import kr.co.vitamin.repository.vo.School;
import kr.co.vitamin.repository.vo.account.Account;

public interface ResumeService {
	
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo, ArmyService armyService, School school, PrevCompany prevCompany,
			ResumeCertification resumeCertification, Hope hope,HopeBusiness hopeBusiness) throws Exception;
	public List<ResumeBaseInfo> resumeList(Integer memberNo) throws Exception;
	public ResumeBaseInfo resumeInfo(int resumeNo) throws Exception;
	public ArmyService armyInfo(int resumeNo) throws Exception;
	public String resumeJobState(String jobState) throws Exception;
	public String resumeMarryState(String marryState) throws Exception;
	public String resumeBohoonState(String bohoonState) throws Exception;
	public String resumeSupportState(String supportState) throws Exception;
	public String resumeArmyState(int armyServiceState) throws Exception;
	public List<City> citySelect() throws Exception;
	public List<Area> areaSelect(Integer cityCode) throws Exception;
	public List<Certificate> certificationSelect(String name) throws Exception;
	public LicensingDepartment licensingDepartmentSelect(Integer licensingDepartmentNo) throws Exception;
	public List<BusinessType> businessTypeSelect() throws Exception;
	public BusinessType choiceBusiness(Integer businessNo) throws Exception;
	public List<MajorCate> majorSelect(String name)throws Exception;
	public Account baseInfoSelect(Integer resumeNo) throws Exception;
	
	
	
	
}
