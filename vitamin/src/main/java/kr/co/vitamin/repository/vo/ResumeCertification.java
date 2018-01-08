package kr.co.vitamin.repository.vo;

import java.util.Date;

public class ResumeCertification {
	private Integer certificationNo, resumeNo;
	private Date certificationDate;
	private String certificationCate, certificationTitle, certificationOffice,
					certificationDivision;
	
	
	public Integer getCertificationNo() {
		return certificationNo;
	}
	public void setCertificationNo(Integer certificationNo) {
		this.certificationNo = certificationNo;
	}
	public Integer getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(Integer resumeNo) {
		this.resumeNo = resumeNo;
	}
	public Date getCertificationDate() {
		return certificationDate;
	}
	public void setCertificationDate(Date certificationDate) {
		this.certificationDate = certificationDate;
	}
	public String getCertificationCate() {
		return certificationCate;
	}
	public void setCertificationCate(String certificationCate) {
		this.certificationCate = certificationCate;
	}
	public String getCertificationTitle() {
		return certificationTitle;
	}
	public void setCertificationTitle(String certificationTitle) {
		this.certificationTitle = certificationTitle;
	}
	public String getCertificationOffice() {
		return certificationOffice;
	}
	public void setCertificationOffice(String certificationOffice) {
		this.certificationOffice = certificationOffice;
	}
	public String getCertificationDivision() {
		return certificationDivision;
	}
	public void setCertificationDivision(String certificationDivision) {
		this.certificationDivision = certificationDivision;
	}
	
	@Override
	public String toString() {
		return "ResumeCertification [certificationNo=" + certificationNo + ", resumeNo=" + resumeNo
				+ ", certificationDate=" + certificationDate + ", certificationCate=" + certificationCate
				+ ", certificationTitle=" + certificationTitle + ", certificationOffice=" + certificationOffice
				+ ", certificationDivision=" + certificationDivision + "]";
	}
	
	
	
	
	
	
	
	
	

}
