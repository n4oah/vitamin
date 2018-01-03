package kr.co.vitamin.repository.vo.member;

import java.util.Date;

import org.springframework.security.core.token.Sha512DigestUtils;

public class Account {
	private Integer memberNo, addressNo, emailTokenNo, memberType, emailTokenStatus;
	private String id, pwd, name, email;
	private Date regDate;

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

	public Integer getMemberType() {
		return memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}

	public Integer getEmailTokenStatus() {
		return emailTokenStatus;
	}

	public void setEmailTokenStatus(Integer emailTokenStatus) {
		this.emailTokenStatus = emailTokenStatus;
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
	
	public void setShaPwd(String pwd) {
		this.pwd = Sha512DigestUtils.shaHex(pwd);
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}