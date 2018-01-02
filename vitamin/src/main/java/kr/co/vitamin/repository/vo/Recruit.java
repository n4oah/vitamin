package kr.co.vitamin.repository.vo;

import java.util.Date;

public class Recruit {
	
	   private Integer recruitNo;

	    //  기업회원번호
	    private Integer memberNo;

	    //  제목
	    private String title;

	    //  1이면 신입 다른것들은 -1
	    private Integer careerState;

	    private Integer careerStart;

	    private Integer careerEnd;

	    //  0이면 무관 1이면 고졸 2이면 대졸 3이면 석사 4이면 박사 이상
	    private Integer schoolLevel;

	    //  연봉 단위는 (만)
	    private Integer yearPayStart;

	    //  연봉 단위는 (만)
	    private Integer yearPayEnd;

	    //  나이 시작
	    private Integer ageCountStart;

	    //  나이 끝
	    private Integer ageCountEnd;

	    //  m이면 남성 w면 여성 a면 무관
	    private String gender;

	    //  담당업무
	    private String assignedTask;

	    //  근무형태 (비정규직, 정규직)
	    private String formService;

	    //  모집인원
	    private String recuruitCount;

	    //  전공
	    private String major;

	    //  우대조건
	    private String 우대조건;

	    //  접수기간 시작
	    private Date recruitDateStart;

	    //  접구기간 끝
	    private Date recruitDateEnd;

	    //  1이면 비타민 양식 2이면 회사 이력서 방식
	    private Integer recruitForm;

	    //  file_no에 있는 거 참조
	    private Integer recruitFormFileNo;

	    //  주소
	    private Integer addressNo;

	    //  맨처음 월요일 0 미체크 1이면 체크
	    private String dayOfWeek;

	    //  담당자 이름
	    private String master;

	    //  문의처
	    private String phoneNumber;

	    //  1 이면 채용중, 2이면 채용안함
	    private Integer recruitingState;

	    public Integer getRecruitNo() {
	        return recruitNo;
	    }

	    public void setRecruitNo(Integer recruitNo) {
	        this.recruitNo = recruitNo;
	    }

	    public Integer getMemberNo() {
	        return memberNo;
	    }

	    public void setMemberNo(Integer memberNo) {
	        this.memberNo = memberNo;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public Integer getCareerState() {
	        return careerState;
	    }

	    public void setCareerState(Integer careerState) {
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

	    public Integer getYearPayStart() {
	        return yearPayStart;
	    }

	    public void setYearPayStart(Integer yearPayStart) {
	        this.yearPayStart = yearPayStart;
	    }

	    public Integer getYearPayEnd() {
	        return yearPayEnd;
	    }

	    public void setYearPayEnd(Integer yearPayEnd) {
	        this.yearPayEnd = yearPayEnd;
	    }

	    public Integer getAgeCountStart() {
	        return ageCountStart;
	    }

	    public void setAgeCountStart(Integer ageCountStart) {
	        this.ageCountStart = ageCountStart;
	    }

	    public Integer getAgeCountEnd() {
	        return ageCountEnd;
	    }

	    public void setAgeCountEnd(Integer ageCountEnd) {
	        this.ageCountEnd = ageCountEnd;
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

	    public Integer getRecruitForm() {
	        return recruitForm;
	    }

	    public void setRecruitForm(Integer recruitForm) {
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
	    public void CopyData(Recruit param)
	    {
	        this.recruitNo = param.getRecruitNo();
	        this.memberNo = param.getMemberNo();
	        this.title = param.getTitle();
	        this.careerState = param.getCareerState();
	        this.careerStart = param.getCareerStart();
	        this.careerEnd = param.getCareerEnd();
	        this.schoolLevel = param.getSchoolLevel();
	        this.yearPayStart = param.getYearPayStart();
	        this.yearPayEnd = param.getYearPayEnd();
	        this.ageCountStart = param.getAgeCountStart();
	        this.ageCountEnd = param.getAgeCountEnd();
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
	    }

}