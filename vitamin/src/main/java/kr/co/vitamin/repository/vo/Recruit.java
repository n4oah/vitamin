package kr.co.vitamin.repository.vo;

import java.util.Date;

public class Recruit {

	private Integer recruitNo;

	// 제목
	private String title;

	// 0이면 신입 1이면 경력 2이면 (경력)
	private String careerState;

	private Integer careerStart;

	private Integer careerEnd;

	// 0이면 무관 1이면 고졸 2이면 대졸 3이면 석사 4이면 박사 이상
	private Integer schoolLevel;

	// 연봉 단위는 (만)
	private Integer yearPay;

	// 나이
	private Integer age;

	// m이면 남성 w면 여성 a면 무관
	private String gender;

	// 담당업무
	private String assignedTask;

	// 근무형태 (비정규직, 정규직)
	private String formService;

	// 모집인원
	private String recuruitCount;

	// 전공
	private String major;

	// 우대조건
	private String 우대조건;

	// 접수기간 시작
	private Date recruitDateStart;

	// 접구기간 끝
	private Date recruitDateEnd;

	// 1이면 비타민 양식 2이면 회사 이력서 방식
	private String recruitForm;

	// file_no에 있는 거 참조
	private Integer recruitFormFileNo;

	// 주소
	private Integer addressNo;

	// 0은 일요일
	private String dayOfWeek;

	// 담당자 이름
	private String master;

	// 문의처
	private String phoneNumber;

	// 1 이면 채용중, 2이면 채용안함
	private Integer recruitingState;
	
	private Integer companyNo;

	public Integer getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(Integer companyNo) {
		this.companyNo = companyNo;
	}

	public Integer getRecruitNo() {
		return recruitNo;
	}

	public void setRecruitNo(Integer recruitNo) {
		this.recruitNo = recruitNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCareerState() {
		return careerState;
	}

	public void setCareerState(String careerState) {
		this.careerState = careerState;
	}

	public Integer getCareerStart() {
		return careerStart;
	}

	public void setCareerStart(Integer careerStart) {
		this.careerStart = careerStart;
	}

	public Integer getCareerEnd() {
		return careerEnd;
	}

	public void setCareerEnd(Integer careerEnd) {
		this.careerEnd = careerEnd;
	}

	public Integer getSchoolLevel() {
		return schoolLevel;
	}

	public void setSchoolLevel(Integer schoolLevel) {
		this.schoolLevel = schoolLevel;
	}

	public Integer getYearPay() {
		return yearPay;
	}

	public void setYearPay(Integer yearPay) {
		this.yearPay = yearPay;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAssignedTask() {
		return assignedTask;
	}

	public void setAssignedTask(String assignedTask) {
		this.assignedTask = assignedTask;
	}

	public String getFormService() {
		return formService;
	}

	public void setFormService(String formService) {
		this.formService = formService;
	}

	public String getRecuruitCount() {
		return recuruitCount;
	}

	public void setRecuruitCount(String recuruitCount) {
		this.recuruitCount = recuruitCount;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String get우대조건() {
		return 우대조건;
	}

	public void set우대조건(String 우대조건) {
		this.우대조건 = 우대조건;
	}

	public Date getRecruitDateStart() {
		return recruitDateStart;
	}

	public void setRecruitDateStart(Date recruitDateStart) {
		this.recruitDateStart = recruitDateStart;
	}

	public Date getRecruitDateEnd() {
		return recruitDateEnd;
	}

	public void setRecruitDateEnd(Date recruitDateEnd) {
		this.recruitDateEnd = recruitDateEnd;
	}

	public String getRecruitForm() {
		return recruitForm;
	}

	public void setRecruitForm(String recruitForm) {
		this.recruitForm = recruitForm;
	}

	public Integer getRecruitFormFileNo() {
		return recruitFormFileNo;
	}

	public void setRecruitFormFileNo(Integer recruitFormFileNo) {
		this.recruitFormFileNo = recruitFormFileNo;
	}

	public Integer getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(Integer addressNo) {
		this.addressNo = addressNo;
	}

	public String getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Integer getRecruitingState() {
		return recruitingState;
	}

	public void setRecruitingState(Integer recruitingState) {
		this.recruitingState = recruitingState;
	}

	// ViRecruitWrite 모델 복사
	public void CopyData(Recruit param) {
		this.recruitNo = param.getRecruitNo();
		this.title = param.getTitle();
		this.careerState = param.getCareerState();
		this.careerStart = param.getCareerStart();
		this.careerEnd = param.getCareerEnd();
		this.schoolLevel = param.getSchoolLevel();
		this.yearPay = param.getYearPay();
		this.age = param.getAge();
		this.gender = param.getGender();
		this.assignedTask = param.getAssignedTask();
		this.formService = param.getFormService();
		this.recuruitCount = param.getRecuruitCount();
		this.major = param.getMajor();
		this.우대조건 = param.get우대조건();
		this.recruitDateStart = param.getRecruitDateStart();
		this.recruitDateEnd = param.getRecruitDateEnd();
		this.recruitForm = param.getRecruitForm();
		this.recruitFormFileNo = param.getRecruitFormFileNo();
		this.addressNo = param.getAddressNo();
		this.dayOfWeek = param.getDayOfWeek();
		this.master = param.getMaster();
		this.phoneNumber = param.getPhoneNumber();
		this.recruitingState = param.getRecruitingState();
		this.companyNo = param.getCompanyNo();
	}
}