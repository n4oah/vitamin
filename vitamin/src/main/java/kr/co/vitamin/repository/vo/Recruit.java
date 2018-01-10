package kr.co.vitamin.repository.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

import kr.co.vitamin.repository.vo.account.Company;

/**
 * @author kang
 *
 */
public class Recruit {

	private Company company;

	private MultipartFile attachFile;
	
	private String formServiceName; 
	
	
	private String subName;
	private String name;
	private String graduateState;
	private String address;
	private String addressMain;

	public String getAddressMain() {
		return addressMain;
	}

	public void setAddressMain(String addressMain) {
		this.addressMain = addressMain;
	}

	private Integer recruitCount;
	private Integer gender;
	private Integer recruitNo;

    //  기업회원번호
    private Integer companyNo;

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
    
    
    
	
    public Company getCompany() {
    	return company;
    }
    
    public void setCompany(Company company) {
    	this.company = company;
    }
	public String getGraduateState() {
		return graduateState;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
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

    private String recruitDateStringStart; 
	private String recruitDateStringEnd;
    
	public String getRecruitDateStringStart() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(recruitDateStart);
	}
	public String getRecruitDateStringEnd() {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	
		return sdf.format(recruitDateEnd);
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

	public void setRecruitDateStringStart(String recruitDateStringStart) {
		this.recruitDateStringStart = recruitDateStringStart;
	}

	public void setRecruitDateStringEnd(String recruitDateStringEnd) {
		this.recruitDateStringEnd = recruitDateStringEnd;
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

	
	    public Integer getGender() {
			return gender;
		}

		public void setGender(Integer gender) {
			this.gender = gender;
		}

		

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
	    	String[] week = {"월", "화", "수", "목", "금", "토", "일"};
	    	
	    	String result = "";
	    	
	    	char[] tmp = dayOfWeek.toCharArray();
	    	for(int i = 0; i < tmp.length; i++) {
	    		if(tmp[i] == '0')
	    			continue;
	    		
	    		result += week[i];
	    	}
	        return result;
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
	    
	    @Override
		public String toString() {
			return "Recruit [company=" + company + ", attachFile=" + attachFile + ", formServiceName=" + formServiceName
					+ ", subName=" + subName + ", name=" + name + ", graduateState=" + graduateState + ", address="
					+ address + ", addressMain=" + addressMain + ", recruitCount=" + recruitCount + ", gender=" + gender
					+ ", recruitNo=" + recruitNo + ", companyNo=" + companyNo + ", title=" + title + ", careerState="
					+ careerState + ", careerStart=" + careerStart + ", careerEnd=" + careerEnd + ", schoolLevel="
					+ schoolLevel + ", yearPayStart=" + yearPayStart + ", yearPayEnd=" + yearPayEnd + ", ageCountStart="
					+ ageCountStart + ", ageCountEnd=" + ageCountEnd + ", assignedTask=" + assignedTask + ", formService="
					+ formService + ", major=" + major + ", recruitForm=" + recruitForm + ", recruitFormFileNo="
					+ recruitFormFileNo + ", addressNo=" + addressNo + ", dayOfWeek=" + dayOfWeek + ", master=" + master
					+ ", phoneNumber=" + phoneNumber + ", recruitingState=" + recruitingState + ", recruitDateStart="
					+ recruitDateStart + ", recruitDateEnd=" + recruitDateEnd + ", recruitDateStringStart="
					+ recruitDateStringStart + ", recruitDateStringEnd=" + recruitDateStringEnd + "]";
		}

}