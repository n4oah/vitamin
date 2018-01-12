package kr.co.vitamin.repository.vo;

import java.util.Date;

public class Introduction {
	
	private Integer introductionNo, memberNo, term;
	private String introductionTitle, introductionCate, introductionContent;
	private Date introductionRegDate;
	public Integer getIntroductionNo() {
		return introductionNo;
	}
	public void setIntroductionNo(Integer introductionNo) {
		this.introductionNo = introductionNo;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public String getIntroductionTitle() {
		return introductionTitle;
	}
	public void setIntroductionTitle(String introductionTitle) {
		this.introductionTitle = introductionTitle;
	}
	public String getIntroductionCate() {
		return introductionCate;
	}
	public void setIntroductionCate(String introductionCate) {
		this.introductionCate = introductionCate;
	}
	public String getIntroductionContent() {
		return introductionContent;
	}
	public void setIntroductionContent(String introductionContent) {
		this.introductionContent = introductionContent;
	}
	public Date getIntroductionRegDate() {
		return introductionRegDate;
	}
	public void setIntroductionRegDate(Date introductionRegDate) {
		this.introductionRegDate = introductionRegDate;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	
	
	

}
