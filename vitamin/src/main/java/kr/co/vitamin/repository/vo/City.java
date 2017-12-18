package kr.co.vitamin.repository.vo;

public class City {
	private Integer cityCode;
	private String name;
	private String subName;
	

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public Integer getCityCode() {
		return cityCode;
	}

	public void setCityCode(Integer cityCode) {
		this.cityCode = cityCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// ViCityCode 모델 복사
	public void CopyData(City param) {
		this.cityCode = param.getCityCode();
		this.name = param.getName();
		this.subName = param.getSubName();
	 }
}
