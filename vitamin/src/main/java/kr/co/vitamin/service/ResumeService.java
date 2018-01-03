package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Area;
import kr.co.vitamin.repository.vo.ArmyService;
import kr.co.vitamin.repository.vo.Certificate;
import kr.co.vitamin.repository.vo.City;
import kr.co.vitamin.repository.vo.LicensingDepartment;
import kr.co.vitamin.repository.vo.ResumeBaseInfo;

public interface ResumeService {
	
	public void resumeInsert(ResumeBaseInfo resumeBaseInfo, ArmyService armyService) throws Exception;
	public List<ResumeBaseInfo> resumeList() throws Exception;
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
	
}
