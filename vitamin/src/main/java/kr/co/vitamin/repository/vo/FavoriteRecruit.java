package kr.co.vitamin.repository.vo;

public class FavoriteRecruit {
	private Integer favoriteRecruitNo, recruitNo, memberNo;

	public Integer getFavoriteRecruitNo() {
		return favoriteRecruitNo;
	}

	public void setFavoriteRecruitNo(Integer favoriteRecruitNo) {
		this.favoriteRecruitNo = favoriteRecruitNo;
	}

	public Integer getRecruitNo() {
		return recruitNo;
	}

	public void setRecruitNo(Integer recruitNo) {
		this.recruitNo = recruitNo;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "FavoriteRecruit [favoriteRecruitNo=" + favoriteRecruitNo + ", recruitNo=" + recruitNo + ", memberNo="
				+ memberNo + "]";
	}
}