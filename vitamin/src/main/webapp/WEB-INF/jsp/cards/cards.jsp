<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TROLLO</title>
<link href="../css/cards.css" rel="stylesheet" type="text/css"/>
<script src="../js/jquery/jquery-3.2.1.js"></script>
<script src="../js/jquery/jquery-ui-1.12.1.js"></script>
<script src="../js/jquery/jquery-ui-touch-punch.js"></script>
</head>
<body>
	<noscript><p>스크립트 켜라</p></noscript>
	<div id="troll">
		<div id="header">
			<div class="at-header-wrapper">
				<a class="at-activity-name">심영</a>
				<a class="at-activity-perm">전체공개</a>
				<a class="at-logo">
					<span class="at-logo-icon"></span>
					<span class="at-logo-text">TROLLO</span>
				</a>
				<a class="at-menubtn" href="#">
					<span class="at-menu-icon"></span>
				</a>
				<div class="at-menu hide">
					<div class="at-menu-header">
						<div class="at-menu-header-button at-back-icon hide"></div>
						<div class="at-menu-header-title">메뉴</div>
						<div class="at-menu-header-button at-close-icon"></div>
					</div>
					<div class="at-menu-content">
						<div class="at-menu-item at-menu-name">
							<div class="at-menu-item-label">활동명 설정</div>
							<div class="at-input-group">
								<input class="at-activity-name-input"/>
								<a class="at-button at-activity-name-button" href="#">
									<span class="at-confirm-icon"></span>
								</a>
							</div>
							<div class="at-menu-name-description"></div>
						</div>
						<div class="at-menu-item at-menu-perm">
							<div class="at-menu-item-label">공개상태 설정</div>
							<div class="at-button-group">
								<div class="at-button at-activity-perm-button">전체공개</div>
								<div class="at-button at-activity-perm-button">지원기업공개</div>
								<div class="at-button at-activity-perm-button">비공개</div>
							</div>
							<div class="at-menu-perm-description"></div>
						</div>
						<div class="at-menu-item at-menu-background">
							<div class="at-menu-item-label">배경화면 설정</div>
							
								<div class="at-background-image">
									<span class="at-button at-background-image-button">사진</span>
									<input type="file" class="at-background-image-input" style="display:none;" accept="image/*"/>
								</div>
								<div class="at-background-color">
									<span class="at-button at-background-color-button">단색</span>
									<input type="color" class="at-background-color-input" style="display:none;">
								</div>
								<div class="at-button at-background-apply">적용하기</div>
								<div class="at-button at-background-revert">되돌리기</div>
								
						</div>
						<div class="at-menu-item at-menu-askagain">
							추가, 삭제시 다시 묻기<input type="checkbox" class="at-askagain" checked>
						</div>
						<div class="at-menu-item mtt">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div id="at-board"></div>
			<div class="at-board-menulist">
				<div class="at-board-menu at-addblock"><span class="at-addblock-icon"></span></div>
				<div class="at-board-menu at-delblock"><span class="at-delblock-icon"></span></div>
			</div>
		</div>
	</div>
	<div id="modal" class="hide">
		<div class="md-blind"></div>
		<div class="md-dialog">
			<div class="md-dialog-message"></div>
			<div class="md-dialog-items"></div>
		</div>
	</div>
</body>
<script>
	///TODO
	/*
		리스트
		-불러오기 O
		-이동 O
		-추가 O
		-삭제 O
		-수정(이름, 고정, 공개)
	
		아이템
		-불러오기 O
		-이동 O
		-추가 
		-상세
		-수정
		-업로드 O
		
		기본설정
		-메뉴구분
		-이름
		-공개
		-배경(사진업로드)
		
		메모
		
		다녀간 기업
	*/

	///ready
	var $activity = JSON.parse('${activity}');
	var $activityPerm = {"A":"전체공개","B":"지원기업공개","C":"비공개"}
	var $activityPermInv = {"전체공개":"A","지원기업공개":"B","비공개":"C"}
	
	var $activityList = {};
	var $activityItem = {};
	var $activityFile = {};
	if('${activityList}'){$activityList = JSON.parse('${activityList}');}
	if('${activityItem}'){$activityItem = JSON.parse('${activityItem}');}
	if('${activityFile}'){$activityItem = JSON.parse('${activityFile}');}
	
	$(document).ready(function() {
		$(document).on('dragover drop', function(e) {
		    e.preventDefault();
		    e.stopPropagation();
		});
		
		modal('아이디:${sessionScope.user.id}',1);
		$.ajax({
			url:"test.do",
			success:function(d){
				console.log(d);
			}
		});
		
		//설정 불러오기
		$("html").css({
			"background":$activity.activityBackground,
			"background-size":"cover"
		});
		
		$(".at-activity-name").text($activity.activityName);
		
		$(".at-activity-perm").text($activityPerm[$activity.activityPerm]);
		$(".at-activity-perm-button").filter(function(){
			return $(this).text() == $activityPerm[$activity.activityPerm]
		}).addClass("selected");
		
		$(".at-askagain").attr("checked",$activity.activityAskagain == "Y");
		
		//리스트 불러오기
		for (let i in $activityList) {
			$("<div>").addClass("at-board-list")
			.data("listNo",$activityList[i].listNo)
			.data("listNo"+$activityList[i].listNo,"item 초기화용 데이터")
			.append(
				$("<div>").addClass("at-board-list-header")
				.append(
					$("<span>").addClass("at-list-name").text($activityList[i].listName)
				).append(
					$("<div>").addClass("at-list-menu at-list-icon")
				)
			).append(
				$("<div>").addClass("at-board-list-content")
				.append(
					$("<div>").addClass("at-list-add").text("추가")
				)
				.droppable($boardListDroppable)
			).css({
				position: "absolute",
				top: $activityList[i].listTop,
				left: $activityList[i].listLeft
			}).appendTo("#at-board");
		}
		$(".at-board-list").draggable($boardListDraggable);
		
		//아이템 불러오기
		for (let i in $activityItem){
			$("<div>").addClass("at-list-item")
			.data("itemNo",$activityItem[i].itemNo)
			.data("itemNo"+$activityItem[i].itemNo,"file 초기화용 데이터")
			.append($("<div>").text($activityItem[i].itemContent))
			.appendTo($(".at-board-list:data(listNo"+$activityItem[i].listNo+")").find(".at-board-list-content"))
		}
		$(".at-list-item").draggable($listItemDraggable);
		
		
	});
	
	var $boardListDraggable = {
			handle: ".at-board-list-header",
			addClasses: false,
			scroll: false,
			classes:{
				"ui-draggable-handle": "at-sanic",
				"ui-draggable-dragging": "at-gottagofast"
			},
			create:function(e,u){$(".ui-draggable-handle").removeClass("ui-draggable-handle")},
			start:function(e,u){$(".ui-draggable-dragging").removeClass("ui-draggable-dragging")},
			stop: function(e,u){
				let $listTop = $(this).position().top;
				let $listLeft = $(this).position().left;
				
				if($listTop < 0 && $listLeft < 0){
					$listTop = 0;
					$listLeft = 0;
					$(this).animate({top:0,left:0},200,"easeOutExpo",function(){})
				}
				else if($listTop < 0){
					$listTop = 0;
					$(this).animate({top:0},200,"easeOutExpo",function(){})
				}
				else if($listLeft < 0){
					$listLeft = 0;
					$(this).animate({left:0},200,"easeOutExpo",function(){})
				}   
				
				
				if($(this).data("listNo")){
					$.ajax({
						url:"updatelist/location.do",
						method:"post",
						data:{
							listNo: $(this).data("listNo"),
							listTop: parseInt($listTop,10),
							listLeft: parseInt($listLeft,10)
						},
						success:function(d){
							console.log(d);
						}
					});
				}
			} 
		};
	
	var $boardListDroppable = {
			addClasses: false,
			accept:".at-list-item",
			activate:function(e,u){$(".ui-droppable-active").removeClass("ui-droppable-active")},
			over:function(e,u){$(".ui-droppable-hover").removeClass("ui-droppable-hover")},
			drop: function(e,u){
				$(this).append(u.draggable.css({"left":0,"top":0,"position":"relative"}));
		
				$.ajax({
					url:"updateitem/location.do",
					method:"post",
					data:{
						itemNo:u.draggable.data("itemNo"),
						listNo:$(this).parent().data("listNo")
					},
					success:function(d){
						console.log(d);
					}
				});
			}
		}
	
	var $listItemDraggable = {
		addClasses: false,
		scroll: false,
		classes:{
			"ui-draggable-handle": "at-sanic",
			"ui-draggable-dragging": "at-gottagofast"
		},
		create:function(e,u){$(".ui-draggable-handle").removeClass("ui-draggable-handle")},
		start:function(e,u){
			$(".ui-draggable-dragging").removeClass("ui-draggable-dragging")
		},
		stop: function(e,u){
		}
	};
	
	///메뉴
	//버튼그룹
	$(document).on("click",".at-button-group > .at-button", function(){
		$(this).siblings().removeClass("selected");
		$(this).addClass("selected",200);
	})
	//기본설정
	$(".at-menubtn").on("click", function(){
		$(".at-menu").removeClass("hide",200,"linear")
		$(".at-menubtn").addClass("hide")
	});
	$(".at-menu-header-button.at-close-icon").on("click", function(){
		$(".at-menu").addClass("hide",200,"linear")
		$(".at-menubtn").removeClass("hide",200)
	});
	$(".at-menu-header-button.at-back-icon").on("click", function(){
		$(".at-menu-header-title").text("[메뉴]")
		$(this).addClass("hide",200)
	});
	
	$(".at-menu").on("keydown",".at-activity-name-input",function(e){
		if(e.keyCode == 13){$(".at-activity-name-button").trigger("click");}
	});
	$(".at-menu").on("click",".at-activity-name-button", function(){
		$(".at-activity-name").text($(".at-activity-name-input").val());
		$.ajax({
			url:"updateactivity/name.do",
			method:"post",
			data:{
				activityNo:$activity.activityNo,
				value:$(".at-activity-name-input").val()
			},
			success:function(d){
				console.log(d);
			}
		});
	});
	$(".at-menu").on("click",".at-activity-perm-button", function(){
		$(".at-activity-perm").text($(this).text());
		$.ajax({
			url:"updateactivity/perm.do",
			method:"post",
			data:{
				activityNo:$activity.activityNo,
				value:$activityPermInv[$(this).text()]
			},
			success:function(d){
				console.log(d);
			}
		});
	});
	
	
	$(".at-menu").on("click",".at-background-image-button", function(){
		$(".at-background-image-input").trigger("click");
	});
	$(".at-menu").on("change",".at-background-image-input", function(){
		let file = this.files[0]
		if(file){
			if(file.type.startsWith("image")){
				
				let reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function () {
					$prevBackground = $("html").css("background");
					$("html").css({
						"background":"url("+reader.result+")",
						"background-size":"cover"
					});
				};
				reader.onerror = function (error) {console.log("오류:", error);};
				
				$.ajax({
					url:"updateactivity/background.do",
					method:"post",
					data:{
						activityNo:$activity.activityNo,
						value:"url(../image/cards/bf4bg2.jpg)"
					},
					success:function(d){
						console.log(d);
					}
				});
			}
		}
	});
	$(".at-menu").on("click",".at-background-color-button", function(){
		$(".at-background-color-input").trigger("click");
	});
	$(".at-menu").on("change",".at-background-color-input",function(){
		$prevBackground = $("html").css("background");
		$("html").css({
			"background":$(this).val(),
			"background-size":"cover"
		});
		$.ajax({
			url:"updateactivity/background.do",
			method:"post",
			data:{
				activityNo:$activity.activityNo,
				value:$(this).val()
			},
			success:function(d){
				console.log(d);
			}
		});
	});
	
	$prevBackground = "";
	$(".at-menu").on("click",".at-background-revert", function(){
		if($prevBackground){$("html").css({"background":$prevBackground});}
		$prevBackground = "";
	});
	
	$(".at-menu").on("change",".at-askagain", function(){
		let $askagain="";
		if($(this)[0].checked){$askagain="Y"}
		else{$askagain="N"}
		
		$.ajax({
			url:"updateactivity/askagain.do",
			method:"post",
			data:{
				activityNo:$activity.activityNo,
				value:$askagain
			},
			success:function(d){
				console.log(d);
			}
		});
	})
	
	$(".at-menu").on("click",".mtt",function(){
		$(".at-menu-header-button.at-back-icon").toggleClass("hide",200)
		modal("테스트",1);
	});
	
	
	
	
	///보드
	//추가
	$(".at-addblock").on("click",function(e){
		$(this).addClass("takeonme");
		$(this).removeClass("takeonme",100);
		
		let $newlist = $("<div>")
			.append(
				$("<div>").addClass("at-board-list-header")
				.append(
					$("<span>").addClass("at-list-name").text("박스")
				).append(
					$("<div>").addClass("at-list-menu at-list-icon")
				)
			).append(
				$("<div>").addClass("at-board-list-content")
				.append(
					$("<div>").addClass("at-list-add").text("추가")	
				)
				.droppable($boardListDroppable)
			)
			.addClass("at-board-list")
			.css({
				left: e.pageX,
				top: e.pageY-30,
				position: "absolute"
			}).draggable($boardListDraggable)
		.appendTo("#at-board");
		
		$newlist.animate({
			left: Math.floor(Math.random() * ($("#content").prop("scrollWidth")-$newlist.width())),
			top: Math.floor(Math.random() * ($("#content").prop("scrollHeight")-$newlist.height()))
		},400,"easeOutExpo",function(){
			$.ajax({
				url:"addlist.do",
				method:"post",
				data:{
					listName:"박스",
					activityNo:$activity.activityNo,
					listLeft:parseInt($(this).position().left,10),
					listTop:parseInt($(this).position().top,10)
				},
				success: function(d){
					$newlist.data("listNo",d);
					console.log($newlist.data("listNo")," 리스트 추가됨")
				}
			});
		});
	});
	
	//삭제
	$(".at-delblock").droppable({
		addClasses: false,
		accept: ".at-board-list, .at-list-item",
		over: function(e,u){u.draggable.addClass("faster")},
		out: function(e,u){u.draggable.removeClass("faster")},
		drop: function(e,u){
			
			let $delblock = function(){
				$(".at-delblock").addClass("takeonme");
				$(".at-delblock").removeClass("takeonme",1000);
				
				if(u.draggable.data("listNo")){
					$.ajax({
						url:"deletelist.do",
						method:"post",
						data:{listNo:u.draggable.data("listNo")},
						success:function(d){
							console.log(d);
						}
					});
				}
				if(u.draggable.data("itemNo")){
					$.ajax({
						url:"deleteitem.do",
						method:"post",
						data:{itemNo:u.draggable.data("itemNo")},
						success:function(d){
							console.log(d);
						}
					});
				}
				
				u.draggable.remove();
			}
			
			if($(".at-askagain")[0].checked){
				modal("삭제?",0,$delblock);
				return;
			}
			$delblock();
		}
	});
	
	///아이템
	//추가
	$("#at-board").on("click",".at-list-add", function(e){
		let $newItem = $("<div>")
		.append($("<div>").text("아이템"))
		.addClass("at-list-item")
		.draggable($listItemDraggable)
		
		
		$newItem.appendTo($(this).parent());
	});
	
	//파일
	var maxSize = 10*1024*1024; //10MB
	$("#at-board").on("drop",".at-board-list-content",function(e){
		e.preventDefault();
		e.stopPropagation();
		
		let $this = $(this);
		if(e.originalEvent.dataTransfer.files){
			console.dir(e.originalEvent.dataTransfer.files);
			let files = e.originalEvent.dataTransfer.files;
			
			let $newItem = $("<div>")
			.append($("<div>").text(files[0].name))
			.addClass("at-list-item")
			.draggable($listItemDraggable)
			
			let formData = new FormData();
			for(let i=0; i<files.length; i++){
				formData.append("file"+i,files[i])
				//초과하는 파일 포함시
				if(files[i].size > maxSize){
					console.log("안돼");
					return;
				}
			}
			formData.append("listNo",$this.parent().data("listNo"));
			formData.append("itemContent",files[0].name);
			
			$.ajax({
				url:"uploaditem.do",
				method:"post",
				data:formData,
				processData:false,
				contentType: false,
				success: function(d){
					$newItem.data("itemNo",d);
					$this.append($newItem);
				},
				error: function(jq,ex){
					console.log(jq.status,"에-러");
				}
			})
		}
	});
	
	//돌려놓기
	$("html").droppable({
		addClasses: false,
		accept:".at-list-item",
		out:function(e,u){u.draggable.css({left:0,top:0})},
		drop:function(e,u){u.draggable.css({left:0,top:0})}
	})
	
	//정렬(jquery index, droppable)
	
	
	///모달
	var modalFunc = function(){return;};
	modal = function(msg, type, func = function(){return;}){
		//메세지
		$(".md-dialog-message").text(msg);
		//아이템
		if(type==0){
			$(".md-dialog-items").html(
				'<a href="#" class="md-dialog-item md-dialog-yes">그래</a>'+
				'<a href="#" class="md-dialog-item md-dialog-no">아니</a>'
			);
		}else if(type==1){
			$(".md-dialog-items").html('<a href="#" class="md-dialog-item">닫기</a>');
		}
		//함수
		modalFunc = func;
		$("#modal").removeClass("hide");
	};
	$("#modal").on("click",".md-dialog-item",function(){$("#modal").addClass("hide");});
	$("#modal").on("click",".md-dialog-yes",function(){modalFunc();});
	
</script>
</html>