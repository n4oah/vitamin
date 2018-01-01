package kr.co.vitamin.repository.vo.member;

import java.util.Date;

import org.springframework.security.core.token.Sha512DigestUtils;

public class Member {
	private Integer memberNo, addressNo, emailTokenNo;
	private String id, pwd, name, email, phoneNumber;
	private Date regDate, birthDate;
	private Character gender, memberType;
	
	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public Integer getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(Integer addressNo) {
		this.addressNo = addressNo;
	}

	public Integer getEmailTokenNo() {
		return emailTokenNo;
	}

	public void setEmailTokenNo(Integer emailTokenNo) {
		this.emailTokenNo = emailTokenNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = Sha512DigestUtils.shaHex(pwd);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
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

	public Character getMemberType() {
		return memberType;
	}

	public void setMemberType(Character memberType) {
		this.memberType = memberType;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", addressNo=" + addressNo + ", emailTokenNo=" + emailTokenNo + ", id="
				+ id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", regDate=" + regDate + ", birthDate=" + birthDate + ", gender=" + gender + ", memberType="
				+ memberType + "]";
	}
}