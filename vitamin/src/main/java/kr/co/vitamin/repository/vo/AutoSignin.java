package kr.co.vitamin.repository.vo;

import java.util.Date;
import java.util.UUID;

import org.springframework.security.core.token.Sha512DigestUtils;

public class AutoSignin {
	private Integer autoSigninNo, accountNo;
	private String authToken, ip;
	private Date deleteDate;

	public Integer getAutoSigninNo() {
		return autoSigninNo;
	}

	public void setAutoSigninNo(Integer autoSigninNo) {
		this.autoSigninNo = autoSigninNo;
	}

	public Integer getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Integer accountNo) {
		this.accountNo = accountNo;
	}

	public String getAuthToken() {
		return authToken;
	}

	public void setAuthToken(String authToken) {
		this.authToken = authToken;
	}
	
	public void makeAuthToken() {
		this.authToken = Sha512DigestUtils.shaHex(UUID.randomUUID().toString());
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	@Override
	public String toString() {
		return "AutoSignin [autoSigninNo=" + autoSigninNo + ", accountNo=" + accountNo + ", authToken=" + authToken
				+ ", ip=" + ip + ", deleteDate=" + deleteDate + "]";
	}
}