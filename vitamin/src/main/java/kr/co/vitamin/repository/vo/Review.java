package kr.co.vitamin.repository.vo;

import java.util.Date;

//  회사 후기
public class Review {

    private Integer reviewNo;

    private Integer companyNo;

    private Integer memberNo;

    //  점수
    private Integer score;

    //  후기 내용
    private String content;

    //  작성 날짜
    private Date regDate;

    public Integer getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(Integer reviewNo) {
        this.reviewNo = reviewNo;
    }

    public Integer getCompanyNo() {
        return companyNo;
    }

    public void setCompanyNo(Integer companyNo) {
        this.companyNo = companyNo;
    }

    public Integer getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    // ViReview 모델 복사
    public void CopyData(Review param)
    {
        this.reviewNo = param.getReviewNo();
        this.companyNo = param.getCompanyNo();
        this.memberNo = param.getMemberNo();
        this.score = param.getScore();
        this.content = param.getContent();
        this.regDate = param.getRegDate();
    }
}
