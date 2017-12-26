package kr.co.vitamin.repository.vo;

public class SchoolLevel {
	Integer schoolLevelNo;
	String graduateState;
	Character level;

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

	public Character getLevel() {
		return level;
	}

	public void setLevel(Character level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "SchoolLevel [schoolLevelNo=" + schoolLevelNo + ", graduateState=" + graduateState + ", level=" + level
				+ "]";
	}
}