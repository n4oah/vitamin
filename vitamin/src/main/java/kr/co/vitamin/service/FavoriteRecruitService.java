package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.FavoriteRecruit;
import kr.co.vitamin.repository.vo.File;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.repository.vo.account.AccountInfo;

public interface FavoriteRecruitService {
	void setFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception;
	void deleteFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception;
}