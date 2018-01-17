package kr.co.vitamin.repository.vo;

import java.util.Date;

public class CalendarRecruit {
	private String title, recruitTitle;
	private Date start, end;
	private Integer companyNo, recruitNo, scheduleNo;
	
	
	public Integer getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(Integer scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public Integer getRecruitNo() {
		return recruitNo;
	}
	public void setRecruitNo(Integer recruitNo) {
		this.recruitNo = recruitNo;
	}
	public String getRecruitTitle() {
		return recruitTitle;
	}
	public void setRecruitTitle(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}
	public Integer getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(Integer companyNo) {
		this.companyNo = companyNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
}