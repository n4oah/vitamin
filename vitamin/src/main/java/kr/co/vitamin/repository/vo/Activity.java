package kr.co.vitamin.repository.vo;

public class Activity {


	int activityNo;
	int memberNo;
	String activityName;
	String activityBackground;
	String activityPerm;
	String activityAskagain;
	
	public int getActivityNo() {return activityNo;}
	public void setActivityNo(int activityNo) {this.activityNo = activityNo;}
	
	public int getMemberNo() {return memberNo;}
	public void setMemberNo(int memberNo) {this.memberNo = memberNo;}
	
	public String getActivityName() {return activityName;}
	public void setActivityName(String activityName) {this.activityName = activityName;}
	
	public String getActivityBackground() {return activityBackground;}
	public void setActivityBackground(String activityBackground) {this.activityBackground = activityBackground;}
	
	public String getActivityPerm() {return activityPerm;}
	public void setActivityPerm(String activityPerm) {this.activityPerm = activityPerm;}
	
	public String getActivityAskagain() {return activityAskagain;}
	public void setActivityAskagain(String activityAskagain) {this.activityAskagain = activityAskagain;}
}
