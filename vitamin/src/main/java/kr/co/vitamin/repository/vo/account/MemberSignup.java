package kr.co.vitamin.repository.vo.account;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;

public class MemberSignup extends Account {
	private Address address;
	private EmailToken emailTok;
	private String email1, email2;
	private Member member;

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

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public void parseData() {
		this.emailTok = new EmailToken();
		super.setEmail(this.email1 + "@" + this.email2);
		address.parseData();
	}
	
	public Account getAccount() throws Exception {
		this.parseData();
		return (Account)this;
	}
}
