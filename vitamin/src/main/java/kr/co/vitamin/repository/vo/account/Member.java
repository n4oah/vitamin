package kr.co.vitamin.repository.vo.account;

import java.util.Date;

public class Member extends Account {
	private Integer memberNo; 
	private String phoneNumber;
	private Date birthDate;
	private Character gender;

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Character getGender() {
		return gender;
	}

	public void setGender(Character gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", phoneNumber=" + phoneNumber + ", birthDate=" + birthDate
				+ ", gender=" + gender + ", getAccountNo()=" + getAccountNo() + ", getAddressNo()=" + getAddressNo()
				+ ", getEmailTokenNo()=" + getEmailTokenNo() + ", getMemberType()=" + getMemberType()
				+ ", getEmailTokenStatus()=" + getEmailTokenStatus() + ", getId()=" + getId() + ", getPwd()=" + getPwd()
				+ ", getName()=" + getName() + ", getEmail()=" + getEmail() + ", getRegDate()=" + getRegDate()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
}