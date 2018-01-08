package kr.co.vitamin.repository.vo;

public class Peoples {
	private String title, name, gender, graduateState, cityName, areaName; 
	private Integer resumeNo, age, careerState, careerYears, jobState;
	private Certificate certificate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGraduateState() {
		return graduateState;
	}
	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public Integer getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(Integer resumeNo) {
		this.resumeNo = resumeNo;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getCareerState() {
		return careerState;
	}
	public void setCareerState(Integer careerState) {
		this.careerState = careerState;
	}
	public Integer getCareerYears() {
		return careerYears;
	}
	public void setCareerYears(Integer careerYears) {
		this.careerYears = careerYears;
	}
	public Integer getJobState() {
		return jobState;
	}
	public void setJobState(Integer jobState) {
		this.jobState = jobState;
	}
	public Certificate getCertificate() {
		return certificate;
	}
	public void setCertificate(Certificate certificate) {
		this.certificate = certificate;
	}
	
	@Override
	public String toString() {
		return "Peoples [title=" + title + ", name=" + name + ", gender=" + gender + ", graduateState=" + graduateState
				+ ", cityName=" + cityName + ", areaName=" + areaName + ", resumeNo=" + resumeNo + ", age=" + age
				+ ", careerState=" + careerState + ", careerYears=" + careerYears + ", jobState=" + jobState
				+ ", certificate=" + certificate + "]";
	}
}
