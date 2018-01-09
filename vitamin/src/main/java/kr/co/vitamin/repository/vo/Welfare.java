package kr.co.vitamin.repository.vo;

import java.util.Arrays;

public class Welfare {
	
	public Welfare() {
	}
	

	
	 public Welfare(Integer recruitNo, String welfareTitle,
			String welfareContent) {
		super();
		this.recruitNo = recruitNo;
		this.welfareTitle = welfareTitle;
		this.welfareContent = welfareContent;
	}

	private Integer welfareNo;

	    //  이력서 번호
	    private Integer recruitNo;

	    //  복리후생 제목
	    private String welfareTitle;
	    private String [] welfareTitleList;

	    //  복리후생 내용
	    private String welfareContent;
	    private String [] welfareContentList;

	    public Integer getWelfareNo() {
	        return welfareNo;
	    }

	    public String[] getWelfareTitleList() {
			return welfareTitleList;
		}

		public void setWelfareTitleList(String[] welfareTitleList) {
			this.welfareTitleList = welfareTitleList;
		}

		public String[] getWelfareContentList() {
			return welfareContentList;
		}

		public void setWelfareContentList(String[] welfareContentList) {
			this.welfareContentList = welfareContentList;
		}

		public void setWelfareNo(Integer welfareNo) {
	        this.welfareNo = welfareNo;
	    }

	    public Integer getRecruitNo() {
	        return recruitNo;
	    }

	    public void setRecruitNo(Integer recruitNo) {
	        this.recruitNo = recruitNo;
	    }


	    public String getWelfareTitle() {
	        return welfareTitle;
	    }

	    public void setWelfareTitle(String welfareTitle) {
	        this.welfareTitle = welfareTitle;
	    }

	    public String getWelfareContent() {
	        return welfareContent;
	    }

	    public void setWelfareContent(String welfareContent) {
	        this.welfareContent = welfareContent;
	    }

	    // ViWelfare 모델 복사
	    public void CopyData(Welfare param)
	    {
	        this.welfareNo = param.getWelfareNo();
	        this.recruitNo = param.getRecruitNo();
	        this.welfareTitle = param.getWelfareTitle();
	        this.welfareContent = param.getWelfareContent();
	    }

		@Override
		public String toString() {
			return "Welfare [welfareNo=" + welfareNo + ", recruitNo=" + recruitNo 
					+ ", welfareTitle=" + welfareTitle + ", welfareTitleList=" + Arrays.toString(welfareTitleList)
					+ ", welfareContent=" + welfareContent + ", welfareContentList="
					+ Arrays.toString(welfareContentList) + "]";
		}
	    
	    
}
