package kr.co.vitamin.repository.vo;

public class CompanyApply {
	private Integer comapplyNo, memberNo, recruitNo, resumeNo, introductionNo;
	private Integer state;

	public Integer getComapplyNo() {
		return comapplyNo;
	}

	public void setComapplyNo(Integer comapplyNo) {
		this.comapplyNo = comapplyNo;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public Integer getRecruitNo() {
		return recruitNo;
	}

	public void setRecruitNo(Integer recruitNo) {
		this.recruitNo = recruitNo;
	}

	public Integer getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(Integer resumeNo) {
		this.resumeNo = resumeNo;
	}

	public Integer getIntroductionNo() {
		return introductionNo;
	}

	public void setIntroductionNo(Integer introductionNo) {
		this.introductionNo = introductionNo;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "CompanyApply [comapplyNo=" + comapplyNo + ", memberNo=" + memberNo + ", recruitNo=" + recruitNo
				+ ", resumeNo=" + resumeNo + ", introductionNo=" + introductionNo + ", state=" + state + "]";
	}
}