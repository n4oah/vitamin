package kr.co.vitamin.repository.vo;

import java.util.List;

public class PeopleSearch {
	private List<Integer> cityCode, areaCode, licenseCode, schoolCode;
	private List<String> licenseName;
	private Integer careerStart, careerEnd, ageStart, ageEnd, gender;
	
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
		return cityCode + "\t" + areaCode + "\t" + licenseCode + "\t" +schoolCode + "\t" +
		careerStart + "\t" + careerEnd + "\t" + ageStart + "\t" + ageEnd + "\t" + gender + "\t" +
		licenseName;
	}
}
