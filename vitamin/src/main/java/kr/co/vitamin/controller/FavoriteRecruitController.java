package kr.co.vitamin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.vitamin.repository.vo.FavoriteRecruit;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.FavoriteRecruitService;

@Controller
@RequestMapping("/favoriteRecruit")
public class FavoriteRecruitController {
	@Autowired
	FavoriteRecruitService favoriteRecruitService;
	
	@ResponseBody
	@RequestMapping("/favoriteRecruit.do")
	public void favoriteRecruit(HttpSession session, FavoriteRecruit favoriteRecruit, boolean favorite) throws Exception {
		Member member = (Member)session.getAttribute("user");
		
		favoriteRecruit.setMemberNo(member.getMemberNo());
		System.out.println(favorite);
		if(favorite == true) {
			favoriteRecruitService.setFavoriteRecruit(favoriteRecruit);
		} else if(favorite == false) {
			favoriteRecruitService.deleteFavoriteRecruit(favoriteRecruit);
		}
	}
}
