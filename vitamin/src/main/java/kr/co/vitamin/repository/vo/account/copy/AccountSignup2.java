package kr.co.vitamin.repository.vo.account.copy;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.EmailToken;

public class AccountSignup2 extends Account2 {
	private Address address;
	private EmailToken emailTok;
	private String email1, email2;
	private Member2 member;
	private Company2 company;
	
	@Override
	public void setAccountNo(Integer accountNo) {
		super.setAccountNo(accountNo);
		if(member != null) {
			member.setAccountNo(accountNo);
			System.out.println("맘 배");
		} else if(company != null) {
			company.setAccountNo(accountNo);			
			System.out.println("룬루");
		}
	}

	public Company2 getCompany() {
		return company;
	}

	public void setCompany(Company2 company) {
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

	public Member2 getMember() {
		return member;
	}

	public void setMember(Member2 member) {
		this.member = member;
	}

	public void parseData() {
		this.emailTok = new EmailToken();
		super.setEmail(this.email1 + "@" + this.email2);
		address.parseData();
	}

	public Account2 getAccount() throws Exception {
		this.parseData();
		return (Account2) this;
	}

	@Override
	public String toString() {
		return "AccountSignup [address=" + address + ", emailTok=" + emailTok + ", email1=" + email1 + ", email2="
				+ email2 + ", member=" + member + ", company=" + company + ", getAccountNo()=" + getAccountNo()
				+ ", getAddressNo()=" + getAddressNo() + ", getEmailTokenNo()=" + getEmailTokenNo()
				+ ", getMemberType()=" + getMemberType() + ", getEmailTokenStatus()=" + getEmailTokenStatus()
				+ ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getEmail()=" + getEmail() + ", getRegDate()="
				+ getRegDate() + ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}
}
