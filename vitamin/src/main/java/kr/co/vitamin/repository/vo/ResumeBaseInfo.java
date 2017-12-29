package kr.co.vitamin.repository.vo;

import java.util.Date;

public class ResumeBaseInfo {
	private String resumeTitle;
	private String name;
	private Date birth;
	private Integer postCode;
	private String address;
	private Integer phoneNumber;
	private String email;
	private String gender;
	private String jobState;
	private String marryState;
	private String bohoonState;
	private String supportState;
	private String armyServiceState;
	private String armyServiceReason;
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Integer getPostCode() {
		return postCode;
	}
	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(Integer phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJobState() {
		return jobState;
	}
	public void setJobState(String jobState) {
		this.jobState = jobState;
	}
	public String getMarryState() {
		return marryState;
	}
	public void setMarryState(String marryState) {
		this.marryState = marryState;
	}
	public String getBohoonState() {
		return bohoonState;
	}
	public void setBohoonState(String bohoonState) {
		this.bohoonState = bohoonState;
	}
	public String getSupportState() {
		return supportState;
	}
	public void setSupportState(String supportState) {
		this.supportState = supportState;
	}
	public String getArmyServiceState() {
		return armyServiceState;
	}
	public void setArmyServiceState(String armyServiceState) {
		this.armyServiceState = armyServiceState;
	}
	public String getArmyServiceReason() {
		return armyServiceReason;
	}
	public void setArmyServiceReason(String armyServiceReason) {
		this.armyServiceReason = armyServiceReason;
	}
	
	
	
}