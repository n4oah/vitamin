package kr.co.vitamin.repository.mapper;

import kr.co.vitamin.repository.vo.Activity;

public interface ActivityMapper {
	public Activity selectActivityByMemberNo(int memberNo) throws Exception;
}
