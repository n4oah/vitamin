package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;

public interface CompanyService {
	public void commentWrite(Review review) throws Exception;
	public List<Review> commentDetail(Review review) throws Exception;
	public List<Review> newCommentDetail(Review review) throws Exception;
	public List<Review> commentDetailPlus(Review review) throws Exception;
	public void commentModify(Review review) throws Exception;
	public void commentDelete(Review review) throws Exception;
	
	public Company companyDetail(int no) throws Exception;
	public String fileDetail(int no) throws Exception;
	
	public List<Recruit> recruitList(int no) throws Exception;
	
	public int lastAi() throws Exception;
	
	public Integer reviewInsertChk(Review review) throws Exception;
	
	public Review reviewOneDetail(int no) throws Exception;
}
