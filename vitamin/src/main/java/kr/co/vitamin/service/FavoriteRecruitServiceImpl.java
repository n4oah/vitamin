package kr.co.vitamin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vitamin.repository.mapper.AddressMapper;
import kr.co.vitamin.repository.mapper.AutoSigninMapper;
import kr.co.vitamin.repository.mapper.EmailTokenMapper;
import kr.co.vitamin.repository.mapper.FavoriteRecruitMapper;
import kr.co.vitamin.repository.mapper.FileMapper;
import kr.co.vitamin.repository.mapper.AccountMapper;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.FavoriteRecruit;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.ProfileImage;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;
import kr.co.vitamin.repository.vo.account.Company;
import kr.co.vitamin.repository.vo.account.Member;

@Service
public class FavoriteRecruitServiceImpl implements FavoriteRecruitService {
	@Autowired
	FavoriteRecruitMapper favoriteRecruitMapper;

	@Override
	public void setFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception {
		favoriteRecruitMapper.insertFavoriteRecruit(favoriteRecruit);
	}

	@Override
	public void deleteFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception {
		favoriteRecruitMapper.deleteFavoriteRecruit(favoriteRecruit);
	}
}