package kr.co.vitamin.repository.vo;

import java.util.Date;

public class Letter {
	private Integer letterNo, sendAccountNo, recvAccountNo, read;
	private String title, content;
	private Date sendDate;
	
	public Integer getLetterNo() {
	    return letterNo;
	}
	
	public void setLetterNo(Integer letterNo) {
	    this.letterNo = letterNo;
	}
	
	public Integer getSendAccountNo() {
		return sendAccountNo;
	}

	public void setSendAccountNo(Integer sendAccountNo) {
		this.sendAccountNo = sendAccountNo;
	}

	public Integer getRecvAccountNo() {
	    return recvAccountNo;
	}
	
	public void setRecvAccountNo(Integer recvAccountNo) {
	    this.recvAccountNo = recvAccountNo;
	}
	
	public String getTitle() {
	    return title;
	}
	
	public void setTitle(String title) {
	    this.title = title;
	}
	
	public String getContent() {
	    return content;
	}
	
	public void setContent(String content) {
	    this.content = content;
	}
	
	public Integer getRead() {
	    return read;
	}
	
	public void setRead(Integer read) {
	    this.read = read;
	}
	
	public Date getSendDate() {
	    return sendDate;
	}
	
	public void setSendDate(Date sendDate) {
	    this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "Letter [letterNo=" + letterNo + ", sendAccountNo=" + sendAccountNo + ", recvAccountNo=" + recvAccountNo
				+ ", read=" + read + ", title=" + title + ", content=" + content + ", sendDate=" + sendDate + "]";
	}
}