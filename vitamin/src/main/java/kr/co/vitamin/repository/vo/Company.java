package kr.co.vitamin.repository.vo;

import java.util.Date;

import kr.co.vitamin.repository.vo.member.Account;

public class Company extends Account {
	private Integer companyNo, employeeCount, logoNo;
	private String licenseNumber, companyName, bossName, companyType, businessContent, telNumber, homepage;
	private Date buildupDate;

	public Integer getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(Integer companyNo) {
		this.companyNo = companyNo;
	}

	public Integer getEmployeeCount() {
		return employeeCount;
	}

	public void setEmployeeCount(Integer employeeCount) {
		this.employeeCount = employeeCount;
	}

	public Integer getLogoNo() {
		return logoNo;
	}

	public void setLogoNo(Integer logoNo) {
		this.logoNo = logoNo;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBossName() {
		return bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getBusinessContent() {
		return businessContent;
	}

	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public Date getBuildupDate() {
		return buildupDate;
	}

	public void setBuildupDate(Date buildupDate) {
		this.buildupDate = buildupDate;
	}

	@Override
	public String toString() {
		return "Company [companyNo=" + companyNo + ", employeeCount=" + employeeCount + ", logoNo=" + logoNo
				+ ", licenseNumber=" + licenseNumber + ", companyName=" + companyName + ", bossName=" + bossName
				+ ", companyType=" + companyType + ", businessContent=" + businessContent + ", telNumber=" + telNumber
				+ ", homepage=" + homepage + ", buildupDate=" + buildupDate + ", getMemberNo()=" + getMemberNo()
				+ ", getAddressNo()=" + getAddressNo() + ", getEmailTokenNo()=" + getEmailTokenNo()
				+ ", getMemberType()=" + getMemberType() + ", getEmailTokenStatus()=" + getEmailTokenStatus()
				+ ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getName()=" + getName() + ", getEmail()="
				+ getEmail() + ", getRegDate()=" + getRegDate() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
}