package kr.co.vitamin.repository.vo;

public class ProfileImage {
	private Integer profileNo, accountNo, fileNo, profileType;

	public Integer getProfileNo() {
		return profileNo;
	}

	public void setProfileNo(Integer profileNo) {
		this.profileNo = profileNo;
	}

	public Integer getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Integer accountNo) {
		this.accountNo = accountNo;
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	public Integer getProfileType() {
		return profileType;
	}

	public void setProfileType(Integer profileType) {
		this.profileType = profileType;
	}

	@Override
	public String toString() {
		return "ProfileImage [profileNo=" + profileNo + ", accountNo=" + accountNo + ", fileNo=" + fileNo
				+ ", profileType=" + profileType + ", getProfileNo()=" + getProfileNo() + ", getAccountNo()="
				+ getAccountNo() + ", getFileNo()=" + getFileNo() + ", getProfileType()=" + getProfileType()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}