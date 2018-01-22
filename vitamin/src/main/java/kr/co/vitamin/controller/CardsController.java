package kr.co.vitamin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import kr.co.vitamin.repository.vo.CompanyApply;
import kr.co.vitamin.repository.vo.account.Company;
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
	
	///액티비티
	//멤버 트롤로
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
			model.addAttribute("tutorial","정어리");
		}
		
		model.addAttribute("activity",gson.toJson(activity));
		model.addAttribute("activityList",gson.toJson(ActivityListService.selectListByActivityNo(activity.getActivityNo())));
		model.addAttribute("activityItem",gson.toJson(ActivityItemService.selectItemByActivityNo(activity.getActivityNo())));
		model.addAttribute("activityFiles",gson.toJson(ActivityItemService.selectFileByActivityNo(activity.getActivityNo())));
	}
	
	//컴퍼니 트롤로 뷰어
	@RequestMapping("/cardsviewer.do")
	public String othercards(Model model, HttpSession session, int memberNo, Activity activity, Company company)
			throws Exception{
		Gson gson = new Gson();
		
		try {
			company = (Company)session.getAttribute("user");
		} catch (Exception e) {
			System.out.println("넘어가");
		}
		activity = ActivityService.selectActivityByMemberNo(memberNo);
		
		if(activity == null) {
			model.addAttribute("error", "트롤로 페이지가 없습니다.");
			model.addAttribute("description", "해당 회원이 존재하지 않거나, 아직 트롤로 페이지를 생성하지 않았습니다.");
			return "cards/cardserror";
		}else{
			String Perm = activity.getActivityPerm();
			switch(Perm) {
				case "B":
					boolean permission = true;
					
					HashMap<String,Integer> accountNo = new HashMap<String,Integer>();
					accountNo.put("memberNo", memberNo);
					accountNo.put("companyNo", company.getCompanyNo());
					
					Integer checkPermission = ActivityService.checkPermission(accountNo);
					if(checkPermission == null) {permission = false;}
					
					if(permission){
						model.addAttribute("activity",gson.toJson(activity));
						model.addAttribute("activityList",gson.toJson(ActivityListService.selectListByActivityNo(activity.getActivityNo())));
						model.addAttribute("activityItem",gson.toJson(ActivityItemService.selectItemByActivityNo(activity.getActivityNo())));
						model.addAttribute("activityFiles",gson.toJson(ActivityItemService.selectFileByActivityNo(activity.getActivityNo())));
						return "cards/cardsviewer";
					}else{
						model.addAttribute("error", "트롤로 페이지 열람 권한이 없습니다.");
						model.addAttribute("description", "지원한 기업에게만 공개 설정된 트롤로 페이지입니다.");
						return "cards/cardserror";
					}
				case "C":
					model.addAttribute("error", "트롤로 페이지 열람 권한이 없습니다.");
					model.addAttribute("description", "비공개 설정된 트롤로 페이지입니다.");
					return "cards/cardserror";
			}
		}
		//case "A"
		model.addAttribute("activity",gson.toJson(activity));
		model.addAttribute("activityList",gson.toJson(ActivityListService.selectListByActivityNo(activity.getActivityNo())));
		model.addAttribute("activityItem",gson.toJson(ActivityItemService.selectItemByActivityNo(activity.getActivityNo())));
		model.addAttribute("activityFiles",gson.toJson(ActivityItemService.selectFileByActivityNo(activity.getActivityNo())));
		
		return "cards/cardsviewer";
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
	
	@ResponseBody
	@PostMapping("/uploadactivity/background.do")
	public String uploadActivityBackground(HttpSession session, MultipartHttpServletRequest request) throws Exception {
		Activity activity = new Activity();
		
		//파일 업로드
		Iterator<String> files = request.getFileNames();
				
		String context = request.getServletContext().getRealPath("/upload");
		String path = "/cards/background";
				
		File dir = new File(context+path);
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		System.out.println(dir.getAbsolutePath());	
		
		while(files.hasNext()) {
			String key = files.next();
			MultipartFile file = request.getFile(key);
					
			String fileOrigin = file.getOriginalFilename();
			String fileName = UUID.randomUUID()+fileOrigin.substring(fileOrigin.lastIndexOf("."));
					
			file.transferTo(new File(context+path,fileName));
			
			activity.setActivityBackground("url(/vitamin/upload/cards/background/"+fileName+")");
			activity.setActivityNo(Integer.parseInt(request.getParameter("activityNo")));
			ActivityService.updateActivityBackground(activity);
			System.out.println("url(/vitamin/upload/cards/background/"+fileName+")");
		}
		
		return "backgroundimage 변경됨";
	}
	
	
	///리스트
	@ResponseBody
	@PostMapping("/getlist.do")
	public String getList(int listNo) throws Exception {
		return new Gson().toJson(ActivityListService.selectListByListNo(listNo));
	}
	
	@ResponseBody
	@PostMapping("/addlist.do")
	public int addList(ActivityList activityList) throws Exception {
		ActivityListService.insertList(activityList);
		return activityList.getListNo();
	}
	
	@ResponseBody
	@PostMapping("/updatelist/{column}.do")
	public String updateList(@PathVariable String column, ActivityList activityList) throws Exception {
		
		switch(column) {
			case "name":
				ActivityListService.updateListName(activityList);
				return "리스트 이름 저장됨";
			case "location":
				ActivityListService.updateListLocation(activityList);
				return "리스트 위치 저장됨";
			case "fix":
				ActivityListService.updateListFix(activityList);
				return "리스트 고정상태 저장됨";
			case "perm":
				ActivityListService.updateListPerm(activityList);
				return "리스트 공개상태 저장됨";
		}
		
		return null;
	}
	
	@ResponseBody
	@PostMapping("/deletelist.do")
	public String deleteList(int listNo) throws Exception {
		ActivityListService.deleteList(listNo);
		return "리스트 삭제됨";
	} 
	
	///아이템
	@ResponseBody
	@PostMapping("/detailitem.do")
	public Map<String,Object> detailItem(Model model,int itemNo) throws Exception{
		Map<String,Object> scribblenauts = new HashMap<String,Object>();
		
		scribblenauts.put("item", ActivityItemService.selectItemByItemNo(itemNo));
		scribblenauts.put("files",ActivityItemService.selectFileByItemNo(itemNo));
		return scribblenauts;
	}
	
	@ResponseBody
	@PostMapping("/additem.do")
	public int addItem(ActivityItem activityItem) throws Exception{
		ActivityItemService.insertItem(activityItem);
		return activityItem.getItemNo();
	}
	
	@ResponseBody
	@PostMapping("/updateitem/{column}.do")
	public String updateItem(@PathVariable String column,ActivityItem activityItem) throws Exception {
		
		switch(column) {
			case "location":
				ActivityItemService.updateItemLocation(activityItem);
				return "아이템 위치 저장됨";
			case "content":
				ActivityItemService.updateItemContent(activityItem);
				return "아이템 내용 저장됨";
		}
		
		return null;
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