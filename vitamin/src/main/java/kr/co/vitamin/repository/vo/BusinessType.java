package kr.co.vitamin.repository.vo;

/**
 * @author USER
 *
 */
public class BusinessType {

	private Integer businessNo;
	private	String businessContent;
	private Integer businessOrder;
	private Integer businessCategory;
	private String businessType, btype;
	
	public Integer getBusinessNo() {
		return businessNo;
	}
	public void setBusinessNo(Integer businessNo) {
		this.businessNo = businessNo;
	}
	public String getBusinessContent() {
		return businessContent;
	}
	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}
	public Integer getBusinessOrder() {
		return businessOrder;
	}
	public void setBusinessOrder(Integer businessOrder) {
		this.businessOrder = businessOrder;
	}
	public Integer getBusinessCategory() {
		return businessCategory;
	}
	public void setBusinessCategory(Integer businessCategory) {
		this.businessCategory = businessCategory;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	@Override
	public String toString() {
		return "BusinessType [businessNo=" + businessNo + ", businessContent=" + businessContent + ", businessOrder="
				+ businessOrder + ", businessCategory=" + businessCategory + ", businessType=" + businessType
				+ ", btype=" + btype + "]";
	}
	
	
	
	
	
	
}
