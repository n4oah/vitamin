package kr.co.vitamin.repository.vo;


public class Page {
	private Integer pageNo;
	public Page() {}
	public Page(Integer pageNo) {
		if (pageNo != null)
			this.pageNo = pageNo;
		else this.pageNo = 1;
	}
	public Integer getPageNo() {
		if (pageNo == null)
			return 1;
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		if (pageNo != null)
			this.pageNo = pageNo;
		else this.pageNo = 1;
	}
	
	
	//페이지 시작
	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}
	
	public int getEnd() {
		return pageNo * 10;
	}
}
