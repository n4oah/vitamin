package kr.co.vitamin.repository.vo.account;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class Member extends Account {
	private Integer memberNo;
	private String name, phoneNumber;
	private Date birthDate;
	private Character gender;

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Character getGender() {
		return gender;
	}
	
	public String getGenderName() {
		return getGender() == 'm' ? "남성" : "여성";
	}

	public void setGender(Character gender) {
		this.gender = gender;
	}
	
	public Integer getAge() {
		Integer age;
		
		Calendar today = Calendar.getInstance(Locale.KOREA);
		Calendar birth = Calendar.getInstance();
		birth.setTime(birthDate);
		
		age = today.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
		
		System.out.println(age);
		
		if(today.get(Calendar.DAY_OF_YEAR) < birth.get(Calendar.DAY_OF_YEAR))
			age--;
		
		return age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", name=" + name + ", phoneNumber=" + phoneNumber + ", birthDate="
				+ birthDate + ", gender=" + gender + "]";
	}
}