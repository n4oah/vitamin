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
	<noscript style="position: fixed;
	top: 0; left: 0;right: 0; bottom: 0;
    background: white;
    color: black; font-weight: bolder; font-size: 10vh;
    text-align: center; line-height: 60vh;
    z-index: 9999;"><p>스크립트 켜라</p></noscript>
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
				<a class="at-mypagebtn" href="/vitamin/mypage/myInfo.do">
					<span class="at-user-icon"></span>
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
								<!--
								<div class="at-button at-background-apply">적용하기</div>
								<div class="at-button at-background-revert">되돌리기</div>
								-->
						</div>
						<div class="at-menu-item at-menu-askagain">
							<span>리스트 또는 아이템 삭제시 다시 묻기</span><input type="checkbox" class="at-askagain">
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
	<div id="modal" class="hide"></div>
</body>
<script>
///TODO
/*
	리스트
	-불러오기 O
	-이동 O
	-추가 O
	-삭제 O
	-수정(이름, 고정, 공개) O

	아이템
	-불러오기 O
	-이동 O
	-추가 O
	-삭제 O
	-상세 O
	-내용수정 O -- input 크기 문제
	-파일수정
	-업로드 O
	
	기업 페이지
	
	기본설정,메모,다녀간 기업, waitme
*/

///ready
var $activity = JSON.parse('${activity}');
var $activityPerm = {"A":"전체공개","B":"지원기업공개","C":"비공개"}
var $activityPermInv = {"전체공개":"A","지원기업공개":"B","비공개":"C"}

var $activityList = {};
var $activityItem = {};
var $activityFiles = {};
if('${activityList}'){$activityList = JSON.parse('${activityList}');}
if('${activityItem}'){$activityItem = JSON.parse('${activityItem}');}
if('${activityFiles}'){$activityFiles = JSON.parse('${activityFiles}');}

$(document).ready(function() {
	$(document).on('dragover drop', function(e) {
	    e.preventDefault();
	    e.stopPropagation();
	});
	
	$.ajax({
		url:"test.do",
		success:function(d){
			console.log(d);
		}
	});
	
	//도움말
	if('${tutorial}'){modal.tutorial();}
	
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
		
		$newList = 
		$("<div>").addClass("at-board-list")
		.data("listNo",$activityList[i].listNo)
		.data("listNo"+$activityList[i].listNo,"item 초기화용 데이터")
		.append(
			$("<div>").addClass("at-board-list-header")
			.append(
				$("<span>").addClass("at-list-name").text($activityList[i].listName)
			).append(
				$("<div>").addClass("at-list-menu")
			)
		).append(
			$("<div>").addClass("at-board-list-content")
			.append(
				$("<div>").addClass("at-list-add")
				.append(
					$("<span>").addClass("at-addblock-icon")
				)
			)
			.droppable($boardListDroppable)
		).css({
			position: "absolute",
			top: $activityList[i].listTop,
			left: $activityList[i].listLeft
		}).draggable($boardListDraggable);
		
		if($activityList[i].listFix == "Y"){
			$newList.draggable("disable");
		}
		
		$newList.appendTo("#at-board");
	}
	
	//아이템 불러오기
	for (let i in $activityItem){
		$("<div>").addClass("at-list-item")
		.data("itemNo",$activityItem[i].itemNo)
		.data("itemNo"+$activityItem[i].itemNo,"files 초기화용 데이터")
		.append(
			$("<div>").addClass("at-item-content").text($activityItem[i].itemContent)
			.data("fileCount",0)
		).append(
			$("<div>").addClass("at-item-status")
		)
		.appendTo($(".at-board-list:data(listNo"+$activityItem[i].listNo+")").find(".at-board-list-content"))
	}
	$(".at-list-item").draggable($listItemDraggable);
	
	//파일 불러오기
	for (let i in $activityFiles){
		let $item = $(".at-list-item:data(itemNo"+$activityFiles[i].itemNo+")");
		let $itemContent = $item.children(".at-item-content");
		let $itemStatus = $item.children(".at-item-status");
		
		$itemContent.data("fileCount",$itemContent.data("fileCount")+1);
		$itemStatus.text("파일"+$itemContent.data("fileCount")+"개")
	}
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
		start:function(e,u){
			$(".ui-draggable-dragging").removeClass("ui-draggable-dragging");
			$(".takeonme").removeClass("takeonme");
			$(".at-list-menu-buttons").remove();
		},
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
	$(".at-menu").removeClass("hide",200,"linear");
	$(".at-mypagebtn").addClass("hide");
	$(".at-menubtn").addClass("hide");
});
$(".at-menu-header-button.at-close-icon").on("click", function(){
	$(".at-menu").addClass("hide",200,"linear");
	$(".at-mypagebtn").removeClass("hide",200);
	$(".at-menubtn").removeClass("hide",200);
});
$(".at-menu-header-button.at-back-icon").on("click", function(){
	$(".at-menu-header-title").text("[메뉴]");
	$(this).addClass("hide",200);
});

$(".at-menu").on("keydown",".at-activity-name-input",function(e){
	if(e.keyCode == 13){$(".at-activity-name-button").trigger("click");}
});
$(".at-menu").on("click",".at-activity-name-button", function(){
	
	if($(".at-activity-name-input").val().length < 5 || $(".at-activity-name-input").val().length > 25){
		modal.alert("활동명은 5자 이상 25자 이하로 작성해주세요.");
		return;
	}
	
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
	
	if(file.size > maxSize){
		modal.alert("파일의 용량이 너무 큽니다.(15MB까지 업로드 가능)");
		return;
	}
	
	if(file){
		if(file.type.startsWith("image")){
			
			let reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function () {
				$("html").css({
					"background":"url("+reader.result+")",
					"background-size":"cover"
				});
			};
			reader.onerror = function (error) {console.log("오류:", error);};
			
			let formData = new FormData();
			formData.append("file",file);
			formData.append("activityNo",$activity.activityNo);
			
			$.ajax({
				url:"uploadactivity/background.do",
				method:"post",
				data:formData,
				processData:false,
				contentType: false,
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
	modal.alert("테스트");
});




///리스트
//이름
$("#at-board").on("dblclick", ".at-list-name",function(e){
	$listNameInput = $("<input>").addClass("at-list-name-input")
	.val($(this).text());
	
	$(this).parents(".at-board-list-header").append($listNameInput);
	$(this).remove();
});

$("#at-board").on("keydown", ".at-list-name-input",function(e){
	if(e.keyCode == 13){
		$listName = $("<span>").addClass("at-list-name").text($(this).val());
		
		if($(this).val().length > 20){
			modal.alert("리스트 이름은 20자 이하로 작성해주세요.");
			return;
		}
		
		$.ajax({
			url:"updatelist/name.do",
			method:"post",
			data:{
				listNo:$(this).parents(".at-board-list").data("listNo"),
				listName:$(this).val()
			},
			success:function(d){
				console.log(d);
			}
		});
		
		$(this).parents(".at-board-list-header").append($listName);
		$(this).remove();
	}
});

//추가
$(".at-addblock").on("click",function(e){
	$(this).addClass("takeonme");
	$(this).removeClass("takeonme",100);
	let $newlist = $("<div>")
		.append(
			$("<div>").addClass("at-board-list-header")
			.append(
				$("<span>").addClass("at-list-name").text("새 리스트")
			).append(
				$("<div>").addClass("at-list-menu")
			)
		).append(
			$("<div>").addClass("at-board-list-content")
			.append(
				$("<div>").addClass("at-list-add")
				.append(
					$("<span>").addClass("at-addblock-icon")
				)
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
				listName:"새 리스트",
				activityNo:$activity.activityNo,
				listLeft:parseInt($(this).position().left,10),
				listTop:parseInt($(this).position().top,10)
			},
			success: function(d){
				$newlist.data("listNo",d);
				$newlist.data("listNo"+d,"item 초기화용 데이터");
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
			modal.confirm("삭제하겠습니까?",$delblock);
			return;
		}
		$delblock();
	}
});

//설정
$("#at-board").on("click",".at-list-menu:not(.takeonme)", function(e){
	$(".takeonme").removeClass("takeonme");
	$(".at-list-menu-buttons").remove();
	
	let $this = $(this);
	
	$.ajax({
		url:"getlist.do",
		method:"post",
		data:{listNo:$(this).parents(".at-board-list").data("listNo")},
		success:function(d){
			let $list = JSON.parse(d);
			
			let $fix = $("<div>").addClass("at-list-menu-button")
			.data("value",$list.listFix)
			.append($("<div>").addClass("at-fix-icon"))
			.on("click",function(){
				if($(this).data("value") == "Y"){
					$(this).data("value","N");
					$(this).removeClass("on")
					$(this).parents(".at-board-list").draggable("enable");
				}
				else{
					$(this).data("value","Y");
					$(this).addClass("on");
					$(this).parents(".at-board-list").draggable("disable");
				}
				
				$.ajax({
					url:"updatelist/fix.do",
					method:"post",
					data:{
						listNo:$this.parents(".at-board-list").data("listNo"),
						listFix:$(this).data("value")
					},
					success:function(d){
						console.log(d);
					}
				});
			});
			
			let $perm = $("<div>").addClass("at-list-menu-button")
			.data("value",$list.listPerm)
			.append($("<div>").addClass("at-perm-icon"))
			.on("click",function(){
				if($(this).data("value") == "Y"){$(this).data("value","N"); $(this).removeClass("on");}
				else{$(this).data("value","Y"); $(this).addClass("on");}
				
				$.ajax({
					url:"updatelist/perm.do",
					method:"post",
					data:{
						listNo:$this.parents(".at-board-list").data("listNo"),
						listPerm:$(this).data("value")
					},
					success:function(d){
						console.log(d);
					}
				});
			});
			
			if($list.listFix == "Y"){$fix.addClass("on");}
			if($list.listPerm == "Y"){$perm.addClass("on");}
			
			$this.addClass("takeonme");
			$this.parents(".at-board-list-header").append(
				$("<div>").addClass("at-list-menu-buttons")
				.append($fix)
				.append($perm)
			);
		}
	});
});

$("#at-board").on("click",".at-list-menu.takeonme", function(e){
	$(this).removeClass("takeonme");
	$(".at-list-menu-buttons").remove();
});

///아이템
//추가
$("#at-board").on("click",".at-list-add", function(e){
	$(this).addClass("takeonme");
	$(this).removeClass("takeonme",200);
	
	$listContent = $(this).parents(".at-board-list-content");
	
	let $newItem = $("<div>")
	.append(
		$("<div>").addClass("at-item-content").text("아이템")
	).append(
		$("<div>").addClass("at-item-status")
	).addClass("at-list-item")
	.draggable($listItemDraggable)
	
	$.ajax({
		url:"additem.do",
		method:"post",
		data:{
			listNo: $listContent.parent().data("listNo"),
			itemContent: "아이템"
		},
		success:function(d){
			$newItem.data("itemNo",d);
			$newItem.data("itemNo"+d,"files 초기화용 데이터")
			$listContent.append($newItem);
		}
	});
	
});

//파일
var maxSize = 15*1024*1024; //15MB
$("#at-board").on("drop",".at-board-list-content",function(e){
	e.preventDefault();
	e.stopPropagation();
	
	let $listContent = $(this);
	if(e.originalEvent.dataTransfer){
		console.dir(e.originalEvent.dataTransfer.files);
		let files = e.originalEvent.dataTransfer.files;
		
		let $newItem = $("<div>")
		.append(
			$("<div>").addClass("at-item-content").text(files[0].name)
		).append(
			$("<div>").addClass("at-item-status").text("파일"+files.length+"개")
			.data("fileCount",files.length)
		)
		.addClass("at-list-item")
		.draggable($listItemDraggable)
		
		let formData = new FormData();
		for(let i=0; i<files.length; i++){
			formData.append("file"+i,files[i])
			//초과하는 파일 포함시
			if(files[i].size > maxSize){
				modal.alert("일부 파일의 용량이 너무 큽니다.(15MB까지 업로드 가능)");
				return;
			}
		}
		formData.append("listNo",$listContent.parent().data("listNo"));
		formData.append("itemContent",files[0].name);
		
		$.ajax({
			url:"uploaditem.do",
			method:"post",
			data:formData,
			processData:false,
			contentType: false,
			success: function(d){
				$newItem.data("itemNo",d);
				$newItem.data("itemNo"+d,"files 초기화용 데이터")
				$listContent.append($newItem);
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

//상세보기
$("#at-board").on("click",".at-list-item",function(e){
	modal.item($(this).data("itemNo"));
});

///모달
modal = {
	//얼럿
	alert:function(msg){
		let $mdAlertOk = $("<div>").addClass("md-alert-ok")
		.text("확인").on("click",function(){$("#modal").addClass("hide").html("")});
		
		$("#modal").html(
			$("<div>").addClass("md-window")
			.append(
				$("<div>").addClass("md-alert")
				.append(
					$mdAlertOk
				)
				.append(
					$("<div>").addClass("md-alert-message")
					.text(msg)
				)
			)
		);
		$("#modal").removeClass("hide");
	},
	//컨펌
	confirm:function(msg, func = function(){return;}){
		let $mdConfirmYes = $("<div>").addClass("md-confirm-button md-confirm-yes")
		.text("예").on("click",function(){$("#modal").addClass("hide").html(""); func(); });
		let $mdConfirmNo = $("<div>").addClass("md-confirm-button")
		.text("아니오").on("click",function(){$("#modal").addClass("hide").html("")});
		
		let $mdConfirmItems = $("<div>").addClass("md-confirm-buttons")
		.append($mdConfirmYes).append($mdConfirmNo);
		
		$("#modal").html(
			$("<div>").addClass("md-window")
			.append(
				$("<div>").addClass("md-confirm")
				.append(
					$mdConfirmItems
				)
				.append(
					$("<div>").addClass("md-confirm-message")
					.text(msg)
				)
			)
		);
		$("#modal").removeClass("hide");
	},
	//아이템 상세보기
	item:function(itemNo){
		$.ajax({
			url:"detailitem.do",
			method:"post",
			data:{itemNo:itemNo},
			success:function(d){
				let $data = JSON.parse(d);
				
				let $item = $data.item;
				let $files = $data.files;
				
				if(!$item){return;}
				
				let $mdItemClose = $("<div>").addClass("md-item-close")
				.on("click",function(){$("#modal").addClass("hide").html("");});
				
				let $mdItemContent = $("<div>").addClass("md-item-content")
				.append($("<span>").text($item.itemContent));
				let $mdItemContentEdit = $("<div>").addClass("md-item-content-edit")
				.on("click",function(){
					$mdItemContentInput
					.text($mdItemContent.children("span").text())
					.removeClass("hide");
					$mdItemContentButtons.removeClass("hide");
					$(this).addClass("hide");
				});
				let $mdItemContentInput = $("<div>").addClass("md-item-content-input hide")
				.attr("contenteditable","true");
				
				let $mdItemContentButtons = $("<div>").addClass("md-item-content-buttons hide")
				let $mdItemContentCancle = $("<div>").addClass("md-item-content-button").text("취소")
				.on("click",function(){
					$mdItemContentInput.addClass("hide");
					$mdItemContentButtons.addClass("hide");
					$mdItemContentEdit.removeClass("hide");
					$mdItemContentInput.text("");
				})
				let $mdItemContentSave = $("<div>").addClass("md-item-content-button md-item-save").text("저장")
				.on("click",function(){
					$.ajax({
						url:"updateitem/content.do",
						method:"post",
						data:{
							itemNo:itemNo,
							itemContent:$mdItemContentInput.text()
						},
						success: function(d){
							console.log(d);
							$mdItemContent.children("span").text($mdItemContentInput.text());
							$(".at-list-item:data(itemNo"+itemNo+")")
							.children(".at-item-content")
							.text($mdItemContentInput.text());
						},
						complete: function(){
							$mdItemContentCancle.trigger("click");
						}
					});
				})
				
				let $mdItemFiles = $("<div>").addClass("md-item-files");
				
				if($files.length != 0){
					$mdItemFiles.text("첨부파일");
					for(i in $files){
						let $file = $files[i];
						$mdItemFiles.append(
							$("<div>").addClass("md-item-file")
							.append(
								$("<div>").addClass("md-item-file-name")
								.text($file.atFileOrigin)
							)
							.append(
								$("<a>")
								.addClass("md-item-file-download")
								.attr("download",$file.atFileOrigin)
								.attr("href",
									"${pageContext.request.contextPath}/upload"+
									$file.atFilePath +"/"+ $file.atFileName
								)
								.text("다운로드")
							)
						)
						console.dir($file);
					}
				} 
				
				$("#modal").html(
					$("<div>").addClass("md-window")
					.append(
						$("<div>").addClass("md-item")
						.append($mdItemClose)
						.append(
							$mdItemContent
							.append($mdItemContentEdit)
							.append($mdItemContentInput)
						)
						.append(
							$mdItemContentButtons
							.append($mdItemContentSave)
							.append($mdItemContentCancle)
						)
						.append($mdItemFiles)
					)
				);
				$("#modal").removeClass("hide");
			}
		});
	},
	//ㄷㅇㅁ
	tutorial:function(){
		modal.alert("");
	}
};
</script>
</html>