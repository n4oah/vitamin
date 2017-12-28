package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.CompanyMapper;
import kr.co.vitamin.repository.vo.Company;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	CompanyMapper companyMapper;
	
	@Override
	public void commentWrite(Review review) throws Exception {
		companyMapper.commentWrite(review);
	};
	@Override
	public List<Review> commentDetail(int no) throws Exception {
		return companyMapper.commentDetail(no);
	};
	@Override
	public void commentModify(Review review) throws Exception {
		companyMapper.commentModify(review);
	};
	@Override
	public void commentDelete(Review review) throws Exception {
		companyMapper.commentDelete(review);
	};
	
	
	@Override
	public Company companyDetail(int no) throws Exception {
		return companyMapper.companyDetail(no);
	};
	@Override
	public String fileDetail(int no) throws Exception {
		return companyMapper.fileDetail(no);
	};
	
	
	@Override
	public List<Recruit> recruitList(int no) throws Exception {
		return companyMapper.recruitList(no);
	}
}