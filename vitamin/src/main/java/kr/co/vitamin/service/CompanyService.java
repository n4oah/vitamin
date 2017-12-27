package kr.co.vitamin.service;

import java.util.List;

import kr.co.vitamin.repository.vo.Company;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;

public interface CompanyService {
	public void commentWrite(Review review) throws Exception;
	public List<Review> commentDetail(int no) throws Exception;
	public void commentModify(Review review) throws Exception;
	public void commentDelete(Review review) throws Exception;
	
	public Company companyDetail(int no) throws Exception;
	public String fileDetail(int no) throws Exception;
	
	public List<Recruit> recruitList(int no) throws Exception;
}
