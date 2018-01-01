package kr.co.vitamin.repository.vo.member;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;

public class MemberSignup extends Member {
	private Address address;
	private EmailToken emailTok;
	private String email1, email2;

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
	public EmailToken getEmailTok() {
		return emailTok;
	}

	public void setEmailTok(EmailToken emailTok) {
		this.emailTok = emailTok;
	}

	public void parseData() {
		this.emailTok = new EmailToken();
		super.setEmail(this.email1 + "@" + this.email2);
		address.parseData();
	}
	
	public Member getMember() throws Exception {
		this.parseData();
		return (Member)this;
	}
}
