package kr.co.vitamin.repository.vo.account.copy;

import java.util.Date;


public class Company2 extends Account2 {
	private Integer companyNo, employeeCount, logoNo, businessNo;
	private String licenseNumber, companyName, bossName, companyType, telNumber, homepage, businessContent;
	private Date buildupDate;

	public String getBusinessContent() {
		return businessContent;
	}

	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}

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

	public Integer getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(Integer businessNo) {
		this.businessNo = businessNo;
	}

	@Override
	public String toString() {
		return "Company [companyNo=" + companyNo + ", employeeCount=" + employeeCount + ", logoNo=" + logoNo
				+ ", businessNo=" + businessNo + ", licenseNumber=" + licenseNumber + ", companyName=" + companyName
				+ ", bossName=" + bossName + ", companyType=" + companyType + ", telNumber=" + telNumber + ", homepage="
				+ homepage + ", businessContent=" + businessContent + ", buildupDate=" + buildupDate
				+ ", getAccountNo()=" + getAccountNo() + ", getAddressNo()=" + getAddressNo() + ", getEmailTokenNo()="
				+ getEmailTokenNo() + ", getMemberType()=" + getMemberType() + ", getEmailTokenStatus()="
				+ getEmailTokenStatus() + ", getId()=" + getId() + ", getPwd()=" + getPwd() + ", getEmail()="
				+ getEmail() + ", getRegDate()=" + getRegDate() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}
}