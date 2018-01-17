package kr.co.vitamin.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kr.co.vitamin.repository.vo.Activity;
import kr.co.vitamin.repository.vo.ActivityFiles;
import kr.co.vitamin.repository.vo.ActivityItem;
import kr.co.vitamin.repository.vo.ActivityList;
import kr.co.vitamin.repository.vo.account.Member;
import kr.co.vitamin.service.ActivityService;
import kr.co.vitamin.service.ActivityItemService;
import kr.co.vitamin.service.ActivityListService;

@Controller
@RequestMapping("/cards")
public class CardsController {
	@Autowired
	private ActivityService ActivityService;
	@Autowired
	private ActivityListService ActivityListService;
	@Autowired
	private ActivityItemService ActivityItemService;
	
	@RequestMapping("/iframe.do")
	public void iframe() throws Exception {}
	
	@ResponseBody
	@RequestMapping("/test.do")
	public String test() throws Exception {
		return "test 작동중";
	}
	
	@RequestMapping("/testtest.do")
	public String testtest() throws Exception {
		return "cards/cardsviewer";
	}
	
	///액티비티
	//본인 트롤로
	@RequestMapping("/cards.do")
	public void cards(Model model, HttpSession session, Activity activity, Member member) throws Exception {
		Gson gson = new Gson();
		member = (Member)session.getAttribute("user");
		
		activity = ActivityService.selectActivityByMemberNo(member.getMemberNo());
		if(activity == null) {
			activity = new Activity();
			activity.setMemberNo(member.getMemberNo());
			activity.setActivityName(member.getName()+"의 활동");
			ActivityService.insertActivity(activity);
			
			activity = ActivityService.selectActivityByMemberNo(member.getMemberNo());
		}
		
		model.addAttribute("activity",gson.toJson(activity));
		model.addAttribute("activityList",gson.toJson(ActivityListService.selectListByActivityNo(activity.getActivityNo())));
		model.addAttribute("activityItem",gson.toJson(ActivityItemService.selectItemByActivityNo(activity.getActivityNo())));
	}
	
	//다른 계정의 트롤로
	@RequestMapping("/{memberNo}/cards.do")
	public String othercards(Model model, @PathVariable int memberNo, Activity activity)throws Exception{
		//cards viewer jsp로 연결 예정
		
		activity = ActivityService.selectActivityByMemberNo(memberNo);
		if(activity == null) {
			model.addAttribute("n", "없어요");
			return null;
		}else{
			String Perm = activity.getActivityPerm();
			switch(Perm) {
				case "B":
					//지원기업일 때, 아닐 때 분기
					if(true){
						return null;
					}else{
						return null;
					}
				case "C":
					model.addAttribute("n", "비공개");
					return null;
			}
		}
		return null;
	}
	
	@ResponseBody
	@PostMapping("/updateactivity/{column}.do")
	public String updateActivity(@PathVariable String column, HttpServletRequest request) throws Exception {

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
		return column+" 변경됨";
	}
	
	///리스트
	@ResponseBody
	@PostMapping("/addlist.do")
	public int addList(ActivityList activityList) throws Exception {
		ActivityListService.insertList(activityList);
		return activityList.getListNo();
	}
	
	@ResponseBody
	@PostMapping("/updatelist/location.do")
	public String updateListLocation(ActivityList activityList) throws Exception {
		ActivityListService.updateListLocation(activityList);
		return "리스트 위치 저장됨";
	}
	
	@ResponseBody
	@PostMapping("/deletelist.do")
	public String deleteList(int listNo) throws Exception {
		ActivityListService.deleteList(listNo);
		return "리스트 삭제됨";
	} 
	
	///아이템
	@ResponseBody
	@PostMapping("/additem.do")
	public int addItem(ActivityItem activityItem) throws Exception{
		ActivityItemService.insertItem(activityItem);
		return activityItem.getItemNo();
	}
	
	@ResponseBody
	@PostMapping("/updateitem/location.do")
	public String updateItemLocation(ActivityItem activityItem) throws Exception {
		ActivityItemService.updateItemLocation(activityItem);
		return "아이템 위치 저장됨";
	}
	
	@ResponseBody
	@PostMapping("/deleteitem.do")
	public String deleteItem(int itemNo) throws Exception {
		ActivityItemService.deleteItem(itemNo);
		return "아이템 삭제됨";
	}
	
	@ResponseBody
	@PostMapping("/uploaditem.do")
	public int uploadFile(HttpSession session, MultipartHttpServletRequest request, Member member) throws Exception{
		Gson gson = new Gson();
		member = (Member)session.getAttribute("user");
		
		//아이템 생성
		ActivityItem activityItem = new ActivityItem();
		
		activityItem.setListNo(Integer.parseInt(request.getParameter("listNo")));
		activityItem.setItemContent(request.getParameter("itemContent"));
		ActivityItemService.insertItem(activityItem);
		int itemNo = activityItem.getItemNo();
		
		//파일 업로드
		Iterator<String> files = request.getFileNames();
		
		String context = request.getServletContext().getRealPath("/upload");
		String path = "/cards/"+member.getMemberNo();
		
		File dir = new File(context+path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
			System.out.println(dir.getAbsolutePath());
		}
		
		while(files.hasNext()) {
			ActivityFiles activityFiles = new ActivityFiles();
			
			String key = files.next();
			MultipartFile file = request.getFile(key);
			
			String fileOrigin = file.getOriginalFilename();
			String fileName = UUID.randomUUID()+fileOrigin.substring(fileOrigin.lastIndexOf("."));
			
			file.transferTo(new File(context+path,fileName));
			
			activityFiles.setItemNo(itemNo);
			activityFiles.setAtFileName(fileName);
			activityFiles.setAtFileOrigin(fileOrigin);
			activityFiles.setAtFilePath(path);
			ActivityItemService.insertFile(activityFiles);
		}
		
		return itemNo;
	}
	
}