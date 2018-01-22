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
				<a class="at-logo">
					<span class="at-logo-icon"></span>
					<span class="at-logo-text">TROLLO</span>
				</a>
			</div>
		</div>
		<div id="content">
			<div id="at-board"></div>
		</div>
	</div>
	<div id="modal" class="hide"></div>
</body>
<script>
///ready
var $activity = JSON.parse('${activity}');
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
		url:"/vitamin/cards/test.do",
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
		).append($("<div>").addClass("at-board-list-content"))
		.css({
			position: "absolute",
			top: $activityList[i].listTop,
			left: $activityList[i].listLeft
		});
		
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
	
	//파일 불러오기
	for (let i in $activityFiles){
		let $item = $(".at-list-item:data(itemNo"+$activityFiles[i].itemNo+")");
		let $itemContent = $item.children(".at-item-content");
		let $itemStatus = $item.children(".at-item-status");
		
		$itemContent.data("fileCount",$itemContent.data("fileCount")+1);
		$itemStatus.text("파일"+$itemContent.data("fileCount")+"개")
	}
});

/// 아이템 상세보기
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
			url:"/vitamin/cards/detailitem.do",
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
					}
				} 
				
				$("#modal").html(
					$("<div>").addClass("md-window")
					.append(
						$("<div>").addClass("md-item")
						.append($mdItemClose)
						.append($mdItemContent)
						.append($mdItemFiles)
					)
				);
				$("#modal").removeClass("hide");
			}
		});
	}
};
</script>
</html>