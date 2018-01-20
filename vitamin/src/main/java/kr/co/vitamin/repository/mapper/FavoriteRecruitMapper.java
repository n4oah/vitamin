package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.FavoriteRecruit;

public interface FavoriteRecruitMapper {
	public void insertFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception;
	public void deleteFavoriteRecruit(FavoriteRecruit favoriteRecruit) throws Exception;
}