<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드</title>
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
						</div>
						<div class="at-menu-item at-menu-perm">
							<div class="at-menu-item-label">공개상태 설정</div>
							<div class="at-button-group">
								<div class="at-button at-activity-perm-button">전체공개</div>
								<div class="at-button at-activity-perm-button">지원기업공개</div>
								<div class="at-button at-activity-perm-button">비공개</div>
							</div>
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
								<div class="at-button at-background-revert">되돌려</div>
								
						</div>
						<div class="at-menu-item at-menu-askagain">
							추가, 삭제시 다시 묻기<input type="checkbox" class="at-askagain" checked>
						</div>
						<div class="at-menu-item mtt">아</div>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div id="at-board">
				<div class="at-list-item" style="position:absolute;">테스트테스트박스</div>
				<div class="at-list-item" style="position:absolute;">테스트테스트박스2</div>
				<div class="at-board-list">
					<div class="at-board-list-header">
						<span class="at-list-name">테스트박스</span>
						<div class="at-list-menu at-list-icon"></div>
					</div>
					<div class="at-board-list-content"><div>공간</div></div>
				</div>
			</div>
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
		리스트 불러오기
		리스트 상태 저장하기
		아이템 불러오기
		아이템 상태 저장하기
		리스트에 아이템 추가하기
		아이템에 파일 업로드하고 불러오기
		리스트 설정 추가하기
		메모 추가하기
		
		기본설정 메뉴 완성하기
		
		다녀간 기업 조회하기
	*/

	///ready
	var $activity = JSON.parse('${activity}');
	var $activityPerm = {"A":"전체공개","B":"지원기업공개","C":"비공개"}
	var $activityPermInv = {"전체공개":"A","지원기업공개":"B","비공개":"C"}
	
	var $list = "";
	var $listitem = "";
	
	$(document).ready(function() {
		$(document).on('dragover drop', function(e) {
		    e.preventDefault();
		    e.stopPropagation();
		});
		
		//불러오기
		$("html").css({
			"background":$activity.activityBackground,
			"background-size":"cover"
		});
		
		$(".at-activity-name").text($activity.activityName);
		
		$(".at-activity-perm").text($activityPerm[$activity.activityPerm]);
		$(".at-activity-perm-button").filter(function(){
			return $(this).text() == $activityPerm[$activity.activityPerm]
		}).addClass("selected");
		
		$(".at-askagain").attr("checked",$activity.activityAskagain == "Y")
		$.ajax({
			url:"test.do",
			success:function(d){
				console.log(d);
			}
		});
		
		//임시 리스트 불러오기
		var testlistlist = JSON.parse('{'
			+'"0": {"name": "aaa", "top": 500, "left": 300},'
			+'"1": {"name": "bbb", "top": 300, "left": 700}}');
		
		for ( var testlist in testlistlist) {
			
			$("<div>").addClass("at-board-list").html(
				'<div class="at-board-list-header">'
					+'<span class="at-list-name">'+testlistlist[testlist].name+'</span>'
					+'<div class="at-list-menu at-list-icon"></div>'
				+'</div>'
				+'<div class="at-board-list-content">'
					
			).append(
				$("<div>").addClass("at-board-list-content").html('<div>공간</div>').droppable({
					addClasses: false,
					accept:".at-list-item",
					drop: function(e,u){$(this).append(u.draggable.css({"left":0,"top":0}));}
				})
			).css({
				position: "absolute",
				top: testlistlist[testlist].top,
				left: testlistlist[testlist].left
			}).appendTo("#at-board");
		}
		
		$(".at-board-list").draggable($boardListDraggable);
		
		modal('아이디:${sessionScope.user.id}',1);
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
				if($(this).position().top < 0 && $(this).position().left < 0){
					$(this).animate({top:0,left:0},200,"easeOutExpo",function(){})
				}
				else if($(this).position().left < 0){
					$(this).animate({left:0},200,"easeOutExpo",function(){})
				}   
				else if($(this).position().top < 0){
					$(this).animate({top:0},200,"easeOutExpo",function(){})
				}
			} 
		};
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
			if($(this).position().top < 0 && $(this).position().left < 0){
				$(this).animate({top:0,left:0},200,"easeOutExpo",function(){})
			}
			else if($(this).position().left < 0){
				$(this).animate({left:0},200,"easeOutExpo",function(){})
			}   
			else if($(this).position().top < 0){
					$(this).animate({top:0},200,"easeOutExpo",function(){})
			}
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
	//추가블록
	$(".at-addblock").on("click",function(e){
		$(this).addClass("takeonme");
		$(this).removeClass("takeonme",100);
		
		$newlist = $("<div>")
		.html(
		'<div class="at-board-list-header">'
			+'<span class="at-list-name">테스트박스</span>'
			+'<div class="at-list-menu at-list-icon"></div>'
		+'</div>'
		).append(
			$("<div>").addClass("at-board-list-content").html('<div>공간</div>').droppable({
				addClasses: false,
				accept:".at-list-item",
				drop: function(e,u){$(this).append(u.draggable.css({"left":0,"top":0}));}
			})
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
		},400,"easeOutExpo");
	});
	
	//삭제블록
	$(".at-delblock").droppable({
		addClasses: false,
		accept: ".at-board-list, .at-list-item",
		over: function(e,u){u.draggable.addClass("faster")},
		out: function(e,u){u.draggable.removeClass("faster")},
		drop: function(e,u){
			let $delblock = function(){
				$(".at-delblock").addClass("takeonme");
				$(".at-delblock").removeClass("takeonme",1000);
				u.draggable.remove();
			}
			
			if($(".at-askagain")[0].checked){
				modal("삭제?",0,$delblock);
				return;
			}
			$delblock();
		}
	});
	
	//아이템
	$(".at-list-item").draggable($listItemDraggable);
	$("#at-board").on('drop',".at-board-list-content",function(e){
		e.preventDefault();
		e.stopPropagation();
		if(e.originalEvent.dataTransfer){
			console.dir(e.originalEvent.dataTransfer.files);
			$(this).append(
				$("<div>").addClass("at-list-item")
				.text(e.originalEvent.dataTransfer.files[0].name)
				.draggable()
			);
		}
	});
	$(".at-board-list-content").droppable({
		addClasses: false,
		accept:".at-list-item",
		drop: function(e,u){
			$(this).append(u.draggable.css({"left":0,"top":0,"position":"relative"}));
			
		}
	});
	
	//리스트 설정
	$(document).on("click",function(){return;});
	
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