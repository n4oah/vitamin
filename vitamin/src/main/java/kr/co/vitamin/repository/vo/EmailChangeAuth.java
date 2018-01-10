package kr.co.vitamin.repository.vo;

import java.util.Date;

public class EmailChangeAuth {
	private Integer accountNo, emailChangeTokenNo;
	private String authToken, changeEmail;
	private Date deleteDate;

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

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}
	
	public Integer getEmailChangeTokenNo() {
		return emailChangeTokenNo;
	}

	public void setEmailChangeTokenNo(Integer emailChangeTokenNo) {
		this.emailChangeTokenNo = emailChangeTokenNo;
	}

	public String getChangeEmail() {
		return changeEmail;
	}

	public void setChangeEmail(String changeEmail) {
		this.changeEmail = changeEmail;
	}

	@Override
	public String toString() {
		return "EmailChangeAuth [accountNo=" + accountNo + ", emailChangeTokenNo=" + emailChangeTokenNo + ", authToken="
				+ authToken + ", changeEmail=" + changeEmail + ", deleteDate=" + deleteDate + "]";
	}
}
