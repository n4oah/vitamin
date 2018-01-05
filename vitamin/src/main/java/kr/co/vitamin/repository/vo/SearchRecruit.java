package kr.co.vitamin.repository.vo;

import java.util.Arrays;

public class SearchRecruit {
	
	@Override
	public String toString() {
		return "SearchRecruit [cityCode=" + Arrays.toString(cityCode) + ", areaCode=" + Arrays.toString(areaCode)
				+ ", careerState=" + careerState + ", careerStart=" + careerStart + ", careerEnd=" + careerEnd
				+ ", schoolLevelStart=" + schoolLevelStart + ", schoolLevelEnd=" + schoolLevelEnd + ", schoolLevelNone="
				+ schoolLevelNone + ", yearPayStart=" + yearPayStart + ", yearPayEnd=" + yearPayEnd + ", yearPayNone="
				+ yearPayNone + ", ageCountStart=" + ageCountStart + ", ageCountEnd=" + ageCountEnd + ", ageNone="
				+ ageNone + ", gender=" + gender + "]";
	}

	private Integer[] cityCode, areaCode;
	
	private Integer careerState;
	private Integer careerStart;
	private Integer careerEnd;
	private Integer careerOnly;
	
	
	public Integer getCareerOnly() {
		return careerOnly;
	}

	public void setCareerOnly(Integer careerOnly) {
		this.careerOnly = careerOnly;
	}

	private Integer schoolLevelStart;
	private Integer schoolLevelEnd;
	private Integer schoolLevelNone;
	
	
	private Integer yearPayStart;
	private Integer yearPayEnd;
	private Integer yearPayNone;
	
	private Integer ageCountStart;
	private Integer ageCountEnd;
	private Integer ageNone;
	
	private Integer gender;

	public Integer[] getCityCode() {
		return cityCode;
	}

	public void setCityCode(Integer[] cityCode) {
		this.cityCode = cityCode;
	}

	public Integer[] getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(Integer[] areaCode) {
		this.areaCode = areaCode;
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

	public Integer getSchoolLevelStart() {
		return schoolLevelStart;
	}

	public void setSchoolLevelStart(Integer schoolLevelStart) {
		this.schoolLevelStart = schoolLevelStart;
	}

	public Integer getSchoolLevelEnd() {
		return schoolLevelEnd;
	}

	public void setSchoolLevelEnd(Integer schoolLevelEnd) {
		this.schoolLevelEnd = schoolLevelEnd;
	}

	public Integer getSchoolLevelNone() {
		return schoolLevelNone;
	}

	public void setSchoolLevelNone(Integer schoolLevelNone) {
		this.schoolLevelNone = schoolLevelNone;
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

	public Integer getYearPayNone() {
		return yearPayNone;
	}

	public void setYearPayNone(Integer yearPayNone) {
		this.yearPayNone = yearPayNone;
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

	public Integer getAgeNone() {
		return ageNone;
	}

	public void setAgeNone(Integer ageNone) {
		this.ageNone = ageNone;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}
	
	
}
