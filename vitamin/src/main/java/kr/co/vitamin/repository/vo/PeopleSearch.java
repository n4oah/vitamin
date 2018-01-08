package kr.co.vitamin.repository.vo;

import java.util.List;

public class PeopleSearch {
	private List<Integer> cityCode, areaCode, licenseCode, schoolCode, army;
	private List<String> licenseName;
	private Integer careerStart, careerEnd, ageStart, ageEnd, gender, marry, jobState;
	
	public List<Integer> getArmy() {
		return army;
	}
	public void setArmy(List<Integer> army) {
		this.army = army;
	}
	public Integer getMarry() {
		return marry;
	}
	public void setMarry(Integer marry) {
		this.marry = marry;
	}
	public Integer getJobState() {
		return jobState;
	}
	public void setJobState(Integer jobState) {
		this.jobState = jobState;
	}
	public List<Integer> getCityCode() {
		return cityCode;
	}
	public void setCityCode(List<Integer> cityCode) {
		this.cityCode = cityCode;
	}
	public List<Integer> getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(List<Integer> areaCode) {
		this.areaCode = areaCode;
	}
	public List<Integer> getLicenseCode() {
		return licenseCode;
	}
	public void setLicenseCode(List<Integer> licenseCode) {
		this.licenseCode = licenseCode;
	}
	public List<Integer> getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(List<Integer> schoolCode) {
		this.schoolCode = schoolCode;
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
	public Integer getAgeStart() {
		return ageStart;
	}
	public void setAgeStart(Integer ageStart) {
		this.ageStart = ageStart;
	}
	public Integer getAgeEnd() {
		return ageEnd;
	}
	public void setAgeEnd(Integer ageEnd) {
		this.ageEnd = ageEnd;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public List<String> getLicenseName() {
		return licenseName;
	}
	public void setLicenseName(List<String> licenseName) {
		this.licenseName = licenseName;
	}
	
	@Override
	public String toString() {
		return "PeopleSearch [cityCode=" + cityCode + ", areaCode=" + areaCode + ", licenseCode=" + licenseCode
				+ ", schoolCode=" + schoolCode + ", army=" + army + ", licenseName=" + licenseName + ", careerStart="
				+ careerStart + ", careerEnd=" + careerEnd + ", ageStart=" + ageStart + ", ageEnd=" + ageEnd
				+ ", gender=" + gender + ", marry=" + marry + ", jobState=" + jobState + ", getArmy()=" + getArmy()
				+ ", getMarry()=" + getMarry() + ", getJobState()=" + getJobState() + ", getCityCode()=" + getCityCode()
				+ ", getAreaCode()=" + getAreaCode() + ", getLicenseCode()=" + getLicenseCode() + ", getSchoolCode()="
				+ getSchoolCode() + ", getCareerStart()=" + getCareerStart() + ", getCareerEnd()=" + getCareerEnd()
				+ ", getAgeStart()=" + getAgeStart() + ", getAgeEnd()=" + getAgeEnd() + ", getGender()=" + getGender()
				+ ", getLicenseName()=" + getLicenseName() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
