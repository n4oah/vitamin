package kr.co.vitamin.repository.mapper;

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

public interface ResumeMapper {

	public void insertResume(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public void insertArmyService(ArmyService armyService) throws Exception;
	public List<ResumeBaseInfo> selectResume(Integer memberNo) throws Exception;
	public ResumeBaseInfo selectResumeInfo(int resumeNo) throws Exception;
	public ArmyService selectArmyServiceInfo(int resumeNo) throws Exception;
	public String selectJobState(String jobState) throws Exception;
	public String selectMarryState(String marryState) throws Exception;
	public String selectBohoonState(String bohoonState) throws Exception;
	public String selectSupportState(String supportState) throws Exception;
	public void updateArmyService(ResumeBaseInfo resumeBaseInfo) throws Exception;
	public String selectArmyState(int armyServiceState) throws Exception;
	public List<City> selectCity() throws Exception;
	public List<Area> selectArea(Integer cityCode) throws Exception;
	public List<Certificate> selectCertification(String name) throws Exception;
	public LicensingDepartment selectLicensingDepartment(Integer licensingDepartmentNo) throws Exception;
	public List<BusinessType> selectBusinessType() throws Exception;
	public BusinessType chooseBusinessType(Integer BusinessNo) throws Exception;
	public int selectNextAutoIncrementArmy() throws Exception;
	public int selectNextAutoIncrementSchool() throws Exception;
	public int selectNextAutoIncrementPrevCompany() throws Exception;
	public int selectNextAutoIncrementCertification() throws Exception;
	public int selectNextAutoIncrementHope() throws Exception;
	public int selectNextAutoIncrementHopeBusiness() throws Exception;
	
	public Account selectBaseInfo(Integer resumeNo) throws Exception;
	
	public void insertSchool(School school) throws Exception;
	public void insertPrevCompany(PrevCompany prevCompany)throws Exception;
	public void insertCertification(ResumeCertification resumeCertification) throws Exception;
	public void insertHope(Hope hope)throws Exception;
	public List<MajorCate> selectMajor(String name)throws Exception;
	public void insertHopeBusiness(HopeBusiness hopeBusiness) throws Exception;
	
	
	
}
