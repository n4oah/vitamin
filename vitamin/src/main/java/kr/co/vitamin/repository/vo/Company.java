package kr.co.vitamin.repository.vo;

import java.util.Date;

//기업 회원
public class Company {

	private Integer companyNo;

	private Integer memberNo;

	private String licenseNumber;

	private String companyName;

	private String bossName;

	// 기업 형태
	private String companyType;

	// 설립일
	private Date buildupDate;

	// 사업 내용
	private String businessContent;

	// 업종 코드
	private Integer businessNo;

	// 대표전화
	private String telNumber;

	// 홈페이지 주소
	private String homepage;

	// 직원 수
	private Integer employeeCount;

	// 로고 번호
	private Integer logoNo;

	public Integer getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(Integer companyNo) {
		this.companyNo = companyNo;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
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

	public Date getBuildupDate() {
		return buildupDate;
	}

	public void setBuildupDate(Date buildupDate) {
		this.buildupDate = buildupDate;
	}

	public String getBusinessContent() {
		return businessContent;
	}

	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}

	public Integer getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(Integer businessNo) {
		this.businessNo = businessNo;
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

	// Company 모델 복사
	public void CopyData(Company param) {
		this.companyNo = param.getCompanyNo();
		this.memberNo = param.getMemberNo();
		this.licenseNumber = param.getLicenseNumber();
		this.companyName = param.getCompanyName();
		this.bossName = param.getBossName();
		this.companyType = param.getCompanyType();
		this.buildupDate = param.getBuildupDate();
		this.businessContent = param.getBusinessContent();
		this.businessNo = param.getBusinessNo();
		this.telNumber = param.getTelNumber();
		this.homepage = param.getHomepage();
		this.employeeCount = param.getEmployeeCount();
		this.logoNo = param.getLogoNo();
	}

	@Override
	public String toString() {
		return "Company [companyNo=" + companyNo + ", memberNo=" + memberNo + ", licenseNumber=" + licenseNumber
				+ ", companyName=" + companyName + ", bossName=" + bossName + ", companyType=" + companyType
				+ ", buildupDate=" + buildupDate + ", businessContent=" + businessContent + ", businessNo=" + businessNo
				+ ", telNumber=" + telNumber + ", homepage=" + homepage + ", employeeCount=" + employeeCount
				+ ", logoNo=" + logoNo + "]";
	}
	
	
}