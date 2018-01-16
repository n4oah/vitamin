package kr.co.vitamin.repository.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Schedule {
	private Integer scheduleNo, memberNo;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate, endDate;
	private String scheduleTitle;
	
	public Integer getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(Integer scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getScheduleTitle() {
		return scheduleTitle;
	}
	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	
	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", memberNo=" + memberNo + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", scheduleTitle=" + scheduleTitle + "]";
	}
}
