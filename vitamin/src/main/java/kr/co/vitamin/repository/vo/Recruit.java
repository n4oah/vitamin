package kr.co.vitamin.repository.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author kang
 *
 */
public class Recruit {
	
	private MultipartFile attachFile;
	
	private String formServiceName; 
	
	private String subName;
	private String name;
	
	
	
	@Override
	public String toString() {
		return "Recruit [attachFile=" + attachFile + ", formServiceName=" + formServiceName + ", subName=" + subName
				+ ", name=" + name + ", recruitDateStart=" + recruitDateStart + ", recruitDateEnd=" + recruitDateEnd
				+ ", recruitCount=" + recruitCount + ", gender=" + gender + ", recruitNo=" + recruitNo + ", companyNo="
				+ companyNo + ", title=" + title + ", careerState=" + careerState + ", careerStart=" + careerStart
				+ ", careerEnd=" + careerEnd + ", schoolLevel=" + schoolLevel + ", yearPayStart=" + yearPayStart
				+ ", yearPayEnd=" + yearPayEnd + ", ageCountStart=" + ageCountStart + ", ageCountEnd=" + ageCountEnd
				+ ", assignedTask=" + assignedTask + ", formService=" + formService + ", major=" + major + ", 우대조건="
				+ 우대조건 + ", recruitForm=" + recruitForm + ", recruitFormFileNo=" + recruitFormFileNo + ", addressNo="
				+ addressNo + ", dayOfWeek=" + dayOfWeek + ", master=" + master + ", phoneNumber=" + phoneNumber
				+ ", recruitingState=" + recruitingState + "]";
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFormServiceName() {
		return formServiceName;
	}

	public void setFormServiceName(String formServiceName) {
		this.formServiceName = formServiceName;
	}

	//  접수기간 시작
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date recruitDateStart;

    //  접구기간 끝
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date recruitDateEnd;

    
    
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

	public Integer getRecruitCount() {
		return recruitCount;
	}

	public void setRecruitCount(Integer recruitCount) {
		this.recruitCount = recruitCount;
	}

	public MultipartFile getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(MultipartFile attachFile) {
		this.attachFile = attachFile;
	}

	private Integer recruitCount;
	private Integer gender;
	private Integer recruitNo;

	    //  기업회원번호
	    private Integer companyNo;

	    public Integer getGender() {
			return gender;
		}

		public void setGender(Integer gender) {
			this.gender = gender;
		}

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


	    //  담당업무
	    private String assignedTask;

	    //  근무형태 (비정규직, 정규직)
	    private String formService;


	    //  전공
	    private String major;

	    //  우대조건
	    private String 우대조건;


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

	    public Integer getCompanyNo() {
	        return companyNo;
	    }

	    public void setCompanyNo(Integer companyNo) {
	        this.companyNo = companyNo;
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
	        this.companyNo = param.getCompanyNo();
	        this.title = param.getTitle();
	        this.careerState = param.getCareerState();
	        this.careerStart = param.getCareerStart();
	        this.careerEnd = param.getCareerEnd();
	        this.schoolLevel = param.getSchoolLevel();
	        this.yearPayStart = param.getYearPayStart();
	        this.yearPayEnd = param.getYearPayEnd();
	        this.ageCountStart = param.getAgeCountStart();
	        this.ageCountEnd = param.getAgeCountEnd();
	        this.assignedTask = param.getAssignedTask();
	        this.formService = param.getFormService();
	        this.recruitForm = param.getRecruitForm();
	        this.recruitFormFileNo = param.getRecruitFormFileNo();
	        this.addressNo = param.getAddressNo();
	        this.dayOfWeek = param.getDayOfWeek();
	        this.master = param.getMaster();
	        this.phoneNumber = param.getPhoneNumber();
	        this.recruitingState = param.getRecruitingState();
	    }

}