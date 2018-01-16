package kr.co.vitamin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vitamin.repository.mapper.CompanyMapper;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.Recruit;
import kr.co.vitamin.repository.vo.Review;
import kr.co.vitamin.repository.vo.account.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	CompanyMapper companyMapper;
	
	@Override
	public void commentWrite(Review review) throws Exception {
		companyMapper.commentWrite(review);
	};
	@Override
	public List<Review> commentDetail(Review review) throws Exception {
		return companyMapper.commentDetail(review);
	};
	@Override
	public List<Review> newCommentDetail(Review review) throws Exception {
		return companyMapper.newCommentDetail(review);
	};
	@Override
	public List<Review> commentDetailPlus(Review review) throws Exception {
		return companyMapper.commentDetailPlus(review);
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
	public Company companyDetail(Review review) throws Exception {
		return companyMapper.companyDetail(review);
	};
	@Override
	public String fileDetail(int no) throws Exception {
		return companyMapper.fileDetail(no);
	};
	
	
	@Override
	public List<Recruit> recruitList(int no) throws Exception {
		return companyMapper.recruitList(no);
	}
	
	@Override
	public int lastAi() throws Exception {
		return companyMapper.lastAi();
	};
	
	@Override
	public Integer reviewInsertChk(Review review) throws Exception {
		return companyMapper.reviewInsertChk(review);
	}
	
	@Override
	public Review reviewOneDetail(int no) throws Exception {
		return companyMapper.reviewOneDetail(no);
	}
	
	@Override
	public Integer bookmarkChk(Review review) throws Exception {
		return companyMapper.bookmarkChk(review);
	}
	
	@Override
	public void bookmarkInsert(Review review) throws Exception {
		companyMapper.bookmarkInsert(review);
	}
	
	@Override
	public void bookmarkRemove(Review review) throws Exception {
		companyMapper.bookmarkRemove(review);
	}
	
	@Override
	public List<Recruit> recruitDetail(Integer no) throws Exception {
		return companyMapper.recruitDetail(no);
	}
}
