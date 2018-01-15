package kr.co.vitamin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import kr.co.vitamin.repository.vo.Activity;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.ActivityService;

@Controller
@RequestMapping("/cards")
public class CardsController {
	@Autowired
	private ActivityService ActivityService;
	
	@RequestMapping("/iframe.do")
	public void iframe() throws Exception {}
	
	@RequestMapping("/cards.do")
	public void cards(Model model, HttpSession session, Activity activity, Member member) throws Exception {
		Gson gson = new Gson();
		member = (Member)session.getAttribute("user");
		
		//임시 처리; 파라미터로 받을 예정
		activity = ActivityService.selectActivityByMemberNo(member.getMemberNo());
		
		if(activity == null) {
			activity = new Activity();
			activity.setMemberNo(member.getMemberNo());
			activity.setActivityName(member.getName()+"의 활동");
			ActivityService.insertActivity(activity);
			
			activity = ActivityService.selectActivityByMemberNo(member.getMemberNo());
		}
		
		model.addAttribute("activity",gson.toJson(activity));
		
	}
	
	@ResponseBody
	@RequestMapping("/updateactivity/{column}.do")
	public String update(@PathVariable String column, HttpServletRequest request) throws Exception {

		Activity activity = new Activity();
		activity.setActivityNo(Integer.parseInt(request.getParameter("activityNo")));
		String value = request.getParameter("value");
		
		switch(column) {
			case "name":
				activity.setActivityName(value);
				ActivityService.updateActivityName(activity);
				break;
			case "perm":
				activity.setActivityPerm(value);
				ActivityService.updateActivityPerm(activity);
				break;
			case "background":
				activity.setActivityBackground(value);
				ActivityService.updateActivityBackground(activity);
				break;
			case "askagain":
				activity.setActivityAskagain(value);
				ActivityService.updateActivityAskagain(activity);
				break;
		}
		
		return column+"변경됨";
	}
	
	@ResponseBody
	@RequestMapping("/test.do")
	public String test(Model model, HttpSession session, Activity activity) throws Exception {
		return "test 작동중";
	}
}