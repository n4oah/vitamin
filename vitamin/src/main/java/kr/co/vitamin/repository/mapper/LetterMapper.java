
package kr.co.vitamin.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.vitamin.repository.vo.Letter;

public interface LetterMapper {
	public void insertLetter(Letter letterVO) throws Exception;
	public List<Letter> selectPageRecvLetterList(Map<String, Integer> map) throws Exception;
	public Integer selectPageRecvFirstLetter(Integer accountNo) throws Exception;
	public List<Letter> selectPageSendLetterList(Map<String, Integer> map) throws Exception;
	public Integer selectPageSendFirstLetter(Integer accountNo) throws Exception;
}