package kr.co.vitamin.repository.vo;

public class Address {
	private Integer addressNo, cityCode, areaCode;
	private String address, postCode, addressSub;
	private String cityName;
	private String areaName;
	private String addressMain;
	private City city;
	private Area area;
	
	

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	private String address1, address2, sigunguCode;
	
	
	public String getAddressMain() {
		return addressMain;
	}

	public void setAddressMain(String address1) {
		this.addressMain = address1;
	}


	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

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
		setAddressMain(address1);
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		setAddressSub(address2);
		this.address2 = address2;
	}
	
	public String getSigunguCode() {
		return sigunguCode;
	}

	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

	public void parseData() {
		setAddress(address1 +" "+ address2);
		setAddressMain(address1);
		
		if(!sigunguCode.equals("-1")) {
			int cityCode = Integer.parseInt(sigunguCode.substring(0, 2));
			int areaCode = Integer.parseInt(sigunguCode);
			setCityCode(cityCode);
			setAreaCode(areaCode);
		}
		
	}

	public String getAddressSub() {
		return addressSub;
	}

	public void setAddressSub(String addressSub) {
		this.addressSub = addressSub;
	}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", cityCode=" + cityCode + ", areaCode=" + areaCode + ", address="
				+ address + ", postCode=" + postCode + ", addressSub=" + addressSub + ", cityName=" + cityName
				+ ", areaName=" + areaName + ", addressMain=" + addressMain + ", address1=" + address1 + ", address2="
				+ address2 + ", sigunguCode=" + sigunguCode + "]";
	}
}