package kr.co.vitamin.repository.vo.account;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;

public class AccountSignup extends Account {
	private Address address;
	private EmailToken emailTok;
	private String email1, email2;
	private Member member;
	private Company company;
	
	@Override
	public void setAccountNo(Integer accountNo) {
		super.setAccountNo(accountNo);
		if(member != null) {
			member.setAccountNo(accountNo);
		} else if(company != null) {
			company.setAccountNo(accountNo);			
		}
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

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
		return (Account) this;
	}

	@Override
	public String toString() {
		return "AccountSignup [address=" + address + ", emailTok=" + emailTok + ", email1=" + email1 + ", email2="
				+ email2 + ", member=" + member + ", company=" + company + ", getAccountNo()=" + getAccountNo()
				+ ", getAddressNo()=" + getAddressNo() + ", getEmailTokenNo()=" + getEmailTokenNo()
				+ ", getMemberType()=" + getMemberType() + ", getEmailTokenStatus()=" + getEmailTokenStatus()
				+ ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getName()=" + getName() + ", getEmail()="
				+ getEmail() + ", getRegDate()=" + getRegDate() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}
