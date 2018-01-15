package kr.co.vitamin.repository.vo;

public class LetterRes {
	Integer profileNo;
	String name;
	String id;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "LetterRes [profileNo=" + profileNo + ", name=" + name + ", id=" + id + ", letter=" + letter + "]";
	}
}