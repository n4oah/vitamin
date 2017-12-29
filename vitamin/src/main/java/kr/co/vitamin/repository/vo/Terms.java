package kr.co.vitamin.repository.vo;

public class Terms {
	private String title, content;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Terms [title=" + title + ", content=" + content + "]";
	}
}