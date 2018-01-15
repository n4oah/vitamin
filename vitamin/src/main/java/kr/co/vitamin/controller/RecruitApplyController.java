package kr.co.vitamin.controller;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.RecruitApplyService;

@Controller
@RequestMapping("/recruitApply")
public class RecruitApplyController {
	@Autowired
	RecruitApplyService recruitApplyService;
	
	@RequestMapping("/apply.do")
	public void apply(HttpSession session, Integer recruitNo) {
		//Recruit
	}
	
	@ResponseBody
	@RequestMapping("/getData.do")
	public String getData(HttpSession session) throws Exception {
		Member memberVO = (Member)session.getAttribute("user");
		return new Gson().toJson(recruitApplyService.getRecruitSorceData(memberVO));
	}
}