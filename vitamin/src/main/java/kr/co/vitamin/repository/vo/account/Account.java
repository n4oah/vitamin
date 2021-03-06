package kr.co.vitamin.repository.vo.account;

import java.util.Date;

import org.springframework.security.core.token.Sha512DigestUtils;

import kr.co.vitamin.common.auto.AutoVO;
import kr.co.vitamin.common.auto.Discriminator;

@AutoVO
public class Account {
	@AutoVO(id=true)
	private Integer accountNo;
	@AutoVO
	private Integer addressNo, emailTokenNo, emailTokenStatus;
	@Discriminator
	@AutoVO
	private Integer memberType;
	@AutoVO
	private String id, pwd, email;
	@AutoVO
	private Date regDate;

	public Integer getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Integer accountNo) {
		this.accountNo = accountNo;
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
	
	public String getMemberTypeName() {
		return getMemberType() == 1 ? "개인회원" : "기업회원";
	}

	@Override
	public String toString() {
		return "Account [accountNo=" + accountNo + ", addressNo=" + addressNo + ", emailTokenNo=" + emailTokenNo
				+ ", memberType=" + memberType + ", emailTokenStatus=" + emailTokenStatus + ", id=" + id + ", pwd="
				+ pwd + ", email=" + email + ", regDate=" + regDate + "]";
	}
}