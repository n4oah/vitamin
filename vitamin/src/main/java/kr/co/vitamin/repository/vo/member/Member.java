package kr.co.vitamin.repository.vo.member;

import java.util.Date;

import org.springframework.security.core.token.Sha512DigestUtils;

public class Member extends Account {
	private String phoneNumber;
	private Date birthDate;
	private Character gender;

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
		return "Member [phoneNumber=" + phoneNumber + ", birthDate=" + birthDate + ", gender=" + gender
				+ ", getMemberNo()=" + getMemberNo() + ", getAddressNo()=" + getAddressNo() + ", getEmailTokenNo()="
				+ getEmailTokenNo() + ", getMemberType()=" + getMemberType() + ", getEmailTokenStatus()="
				+ getEmailTokenStatus() + ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getName()=" + getName()
				+ ", getEmail()=" + getEmail() + ", getRegDate()=" + getRegDate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}