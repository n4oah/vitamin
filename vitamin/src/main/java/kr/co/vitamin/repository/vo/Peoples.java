package kr.co.vitamin.repository.vo;

import java.util.Date;

public class Peoples {
	private Integer [] cityCode, areaCode, careerCode, schoolLevel, armyState;
	// 도시 번호, 시군구 번호, 0이면 신입 1이면 경력, 학력 번호, 군필 번호
	private Integer jobState, marryState, supportState, careerYearsStart, careerYearsEnd;
	// 구직 상태, 미혼 비혼, 정부 지원 대상, 최소 경력, 최대 경력
	private Date regDate; //이력서 등록날짜
	
}
