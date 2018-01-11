package kr.co.vitamin.controller;

import java.beans.PropertyEditorSupport;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;

import kr.co.vitamin.common.EmailSender;
import kr.co.vitamin.repository.vo.Activity;
import kr.co.vitamin.repository.vo.Address;
import kr.co.vitamin.repository.vo.AutoSignin;
import kr.co.vitamin.repository.vo.BusinessType;
import kr.co.vitamin.repository.vo.EmailToken;
import kr.co.vitamin.repository.vo.SchoolLevel;
import kr.co.vitamin.repository.vo.Terms;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.repository.vo.account.Account;
import kr.co.vitamin.service.AccountService;
import kr.co.vitamin.service.ActivityService;
import kr.co.vitamin.service.ResumeService;
import kr.co.vitamin.service.SchoolLevelService;

@Controller
@RequestMapping("/cards")
public class CardsController {
	@Autowired
	private ActivityService ActivityService;
	
	@RequestMapping("/cards.do")
	public void cards(Model model, HttpSession session, Activity activity, Member member) throws Exception {
		Gson gson = new Gson();
		member = (Member)session.getAttribute("user");
		
		//임시 처리; 파라미터로 받을 예정
		activity = ActivityService.selectActivityByMemberNo(member.getMemberNo());
		
		model.addAttribute("activity",gson.toJson(activity));
	}
	@RequestMapping("/iframe.do")
	public void iframe(Model model) throws Exception {}
	
	@ResponseBody
	@RequestMapping("/test.do")
	public String test(Model model, HttpSession session, Activity activity) throws Exception {
		return "test 작동중";
	}
}