package kr.co.vitamin.repository.vo;

public class Address {
	private Integer addressNo, cityCode, areaCode;
	private String address, postCode;
	
	private String address1, address2, sigunguCode;

	public Integer getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(Integer addressNo) {
		this.addressNo = addressNo;
	}

	public Integer getCityCode() {
		return cityCode;
	}

	public void setCityCode(Integer cityCode) {
		this.cityCode = cityCode;
	}

	public Integer getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	public String getSigunguCode() {
		return sigunguCode;
	}

	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

	public void parseData() {
		setAddress(address1 + address2);
		
		int cityCode = Integer.parseInt(sigunguCode.substring(0, 2));
		int areaCode = Integer.parseInt(sigunguCode);
		
		setCityCode(cityCode);
		setAreaCode(areaCode);
	}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", cityCode=" + cityCode + ", areaCode=" + areaCode + ", address="
				+ address + ", postCode=" + postCode + ", address1=" + address1 + ", address2=" + address2
				+ ", sigunguCode=" + sigunguCode + "]";
	}
}