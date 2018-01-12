package kr.co.vitamin.common;

public class PageResult {
	private int listSize = 10;
	private int tabSize = 10;
	private int pageNo;
	private int count;
	private int beginPage, endPage;
	private boolean prev, next;
	
	public PageResult (int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		
		// 마지막 페이지 번호 구하기
		int lastPage = (count % listSize == 0) ? count / listSize
											   : count / listSize + 1;
		
		int currTab = (pageNo -1) / tabSize + 1;
		beginPage = (currTab -1) * tabSize + 1;
		endPage = (currTab * tabSize > lastPage) ? lastPage
												 : currTab * tabSize;
		prev = (beginPage != 1);
		next = (endPage != lastPage);
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}
	
}
