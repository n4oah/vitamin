package kr.co.vitamin.repository.vo;

import java.util.Date;

import org.springframework.security.core.token.Sha512DigestUtils;

public class EmailToken {
	private Integer emailTokenNo;
	private String token;
	private Date deleteDate;

	public Integer getEmailTokenNo() {
		return emailTokenNo;
	}

	public void setEmailTokenNo(Integer emailTokenNo) {
		this.emailTokenNo = emailTokenNo;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = Sha512DigestUtils.shaHex(token);
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	@Override
	public String toString() {
		return "EmailToken [emailTokenNo=" + emailTokenNo + ", token=" + token + ", deleteDate=" + deleteDate + "]";
	}
}