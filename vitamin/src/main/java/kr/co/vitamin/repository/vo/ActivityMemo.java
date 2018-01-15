package kr.co.vitamin.repository.vo;

public class ActivityMemo {
	private int memo_no;
	private int activity_no;
	private int memo_left;
	private int memo_top;
	private String memo_content;
	
	public int getMemo_no() {return memo_no;}
	public void setMemo_no(int memo_no) {this.memo_no = memo_no;}
	
	public int getActivity_no() {return activity_no;}
	public void setActivity_no(int activity_no) {this.activity_no = activity_no;}
	
	public int getMemo_left() {return memo_left;}
	public void setMemo_left(int memo_left) {this.memo_left = memo_left;}
	
	public int getMemo_top() {return memo_top;}
	public void setMemo_top(int memo_top) {this.memo_top = memo_top;}
	
	public String getMemo_content() {return memo_content;}
	public void setMemo_content(String memo_content) {this.memo_content = memo_content;}
	
}
