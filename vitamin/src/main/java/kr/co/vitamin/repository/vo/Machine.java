package kr.co.vitamin.repository.vo;

public class Machine {
	private Integer percent, value, recruitNo, memberNo;
	private Recruit recruit;

	
	public Recruit getRecruit() {
		return recruit;
	}
	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}
	public Integer getPercent() {
		return percent;
	}
	public void setPercent(Integer percent) {
		this.percent = percent;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public Integer getRecruitNo() {
		return recruitNo;
	}
	public void setRecruitNo(Integer recruitNo) {
		this.recruitNo = recruitNo;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "Machine [percent=" + percent + ", value=" + value + ", recruitNo=" + recruitNo + ", memberNo="
				+ memberNo + "]";
	}
}
