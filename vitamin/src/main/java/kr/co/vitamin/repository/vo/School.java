package kr.co.vitamin.repository.vo;

import java.util.Date;

public class School extends ResumeBaseInfo{
	private Integer schoolNo, schoolLevelNo;
	private Date schoolStartDate, schoolEndDate;
	private String schoolTitle, major;
	private Double schoolScoreStandard;
	private Double schoolScore;

	public Date getSchoolStartDate() {
		return schoolStartDate;
	}

	public void setSchoolStartDate(Date schoolStartDate) {
		this.schoolStartDate = schoolStartDate;
	}

	public Date getSchoolEndDate() {
		return schoolEndDate;
	}

	public void setSchoolEndDate(Date schoolEndDate) {
		this.schoolEndDate = schoolEndDate;
	}

	public Integer getSchoolNo() {
		return schoolNo;
	}

	public void setSchoolNo(Integer schoolNo) {
		this.schoolNo = schoolNo;
	}

	public Integer getSchoolLevelNo() {
		return schoolLevelNo;
	}

	public void setSchoolLevelNo(Integer schoolLevelNo) {
		this.schoolLevelNo = schoolLevelNo;
	}

	public String getSchoolTitle() {
		return schoolTitle;
	}

	public void setSchoolTitle(String schoolTitle) {
		this.schoolTitle = schoolTitle;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Double getSchoolScoreStandard() {
		return schoolScoreStandard;
	}

	public void setSchoolScoreStandard(Double schoolScoreStandard) {
		this.schoolScoreStandard = schoolScoreStandard;
	}

	public Double getSchoolScore() {
		return schoolScore;
	}

	public void setSchoolScore(Double schoolScore) {
		this.schoolScore = schoolScore;
	}

	@Override
	public String toString() {
		return "School [schoolNo=" + schoolNo + ", schoolLevelNo=" + schoolLevelNo + ", schoolStartDate="
				+ schoolStartDate + ", schoolEndDate=" + schoolEndDate + ", schoolTitle=" + schoolTitle + ", major="
				+ major + ", schoolScoreStandard=" + schoolScoreStandard + ", schoolScore=" + schoolScore + "]";
	}
}
