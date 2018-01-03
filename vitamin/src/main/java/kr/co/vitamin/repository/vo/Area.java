package kr.co.vitamin.repository.vo;

public class Area {
	private Integer areaCode;

	private Integer cityCode;

	private String name;

	public Integer getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(Integer areaCode) {
		this.areaCode = areaCode;
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

	// ViAreaCode 모델 복사
	public void CopyData(Area param) {
		this.areaCode = param.getAreaCode();
		this.cityCode = param.getCityCode();
		this.name = param.getName();
	}

	@Override
	public String toString() {
		return "Area [areaCode=" + areaCode + ", cityCode=" + cityCode + ", name=" + name + "]";
	}

}
