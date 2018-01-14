package kr.co.vitamin.repository.vo;

import java.util.List;

public class LetterRes {
	Integer profileNo;
	String name;
	Letter letter;

	public Integer getProfileNo() {
		return profileNo;
	}

	public void setProfileNo(Integer profileNo) {
		this.profileNo = profileNo;
	}

	public Letter getLetter() {
		return letter;
	}

	public void setLetter(Letter letter) {
		this.letter = letter;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "LetterRes [profileNo=" + profileNo + ", name=" + name + ", letter=" + letter + "]";
	}
}