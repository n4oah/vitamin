package kr.co.vitamin.repository.vo;

public class SchoolLevel extends School{
	Integer schoolLevelNo;
	String graduateState;
	Integer level;

	public Integer getSchoolLevelNo() {
		return schoolLevelNo;
	}

	public void setSchoolLevelNo(Integer schoolLevelNo) {
		this.schoolLevelNo = schoolLevelNo;
	}

	public String getGraduateState() {
		return graduateState;
	}

	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "SchoolLevel [schoolLevelNo=" + schoolLevelNo + ", graduateState=" + graduateState + ", level=" + level
				+ "]";
	}
}