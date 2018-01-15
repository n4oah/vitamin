package kr.co.vitamin.repository.mapper;

import java.util.List;

import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;

public interface CompanyMapper {
	public void commentWrite(Review review) throws Exception;
	public List<Review> commentDetail(Review review) throws Exception;
	public List<Review> newCommentDetail(Review review) throws Exception;
	public List<Review> commentDetailPlus(Review review) throws Exception;
	public void commentModify(Review review) throws Exception;
	public void commentDelete(Review review) throws Exception;
	
	public Company companyDetail(Review review) throws Exception;
	public String fileDetail(int no) throws Exception;
	
	public List<Recruit> recruitList(int no) throws Exception;
	
	public int lastAi() throws Exception;
	
	public Integer reviewInsertChk(Review review) throws Exception;
	
	public Review reviewOneDetail(int no) throws Exception;
	public Integer bookmarkChk(Review review) throws Exception;
	public void bookmarkInsert(Review review) throws Exception;
	public void bookmarkRemove(Review review) throws Exception;
}
