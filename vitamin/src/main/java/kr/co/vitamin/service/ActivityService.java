package kr.co.vitamin.service;

import kr.co.vitamin.repository.vo.Activity;

public interface ActivityService {
	public Activity selectActivityByMemberNo(int memberNo) throws Exception;
}
