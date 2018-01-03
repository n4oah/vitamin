package kr.co.vitamin.repository.vo;

public class Certificate {
	private Integer certificateNo;
	private String name;
	private Integer licensingDepartmentNo;
	
	public Integer getCertificateNo() {
		return certificateNo;
	}
	public void setCertificateNo(Integer certificateNo) {
		this.certificateNo = certificateNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getLicensingDepartmentNo() {
		return licensingDepartmentNo;
	}
	public void setLicensingDepartmentNo(Integer licensingDepartmentNo) {
		this.licensingDepartmentNo = licensingDepartmentNo;
	}
	
	
}
