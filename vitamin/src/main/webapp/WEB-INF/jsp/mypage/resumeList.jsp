<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>이력서 리스트</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/resume.css">
		<script src="${pageContext.request.contextPath}/js/resumeList.js"></script>
		<style type="text/css">
		.resumeTitle{
			cursor: pointer;
		}
		img.deleteimg{
			cursor: pointer;
		}
		.btn_smaller_type01 {
		    display: inline-block;
		    height: 23px;
		    padding: 1px 9px 3px 9px;
		    border: 1px solid #e4e4e4;
		    box-sizing: border-box;
		    background-color: #fff;
		    color: #444;
		    font-size: 12px;
		    letter-spacing: -1px;
		    line-height: 17px;
		}
		
		#feedback { font-size: 1.4em; }
 		.selectable .ui-selecting { background: #FECA40; }
  		.selectable .ui-selected { background: #F39814; color: white; }
		.selectable { list-style-type: none; margin: 0; padding: 0; width: 100%; }
		.selectable span { margin: 3px; padding: 0.4em; font-size: 12px; height: 18px;cursor: pointer;}
		/* }
		.modal {
		  text-align: center;
		  padding: 0!important;
		}
		
		.modal:before {
		  content: '';
		  display: inline-block;
		  height: 100%;
		  vertical-align: middle;
		  margin-right: -4px;
		}
		
		.modal-dialog {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		} */
		</style>
	</head>
	
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
	<div id="wrapper" style="margin-top: 0px;">
		<section class="container">
			<div class="horizontal_table table_wrap">
				<h4 class="table_title">이력서 리스트</h4>
				<input style="float: right" type="button" class="btn-primary"  id="regResume" value="이력서등록">
				<table class="table">
					<tbody>
				      <tr>
				        <th>이력서제목</th>
				        <th style="width:5%">공개여부</th>
				        <th style="width:5%"> 등록날짜</th>
				      </tr>
				      <c:forEach var="resume" items="${rlist}">
				      
				       <tr>
				        <td>
					        <span attr="${resume.resumeNo}" class="resumeTitle" >${resume.resumeTitle}</span>
					        <c:if test="${resume.term < 1}">
					        	<img alt="" src="../image/mypage/new.gif">
					        </c:if> 
					        <img class="deleteimg"  attr="${resume.resumeNo}" alt="" src="../image/mypage/delete.jpg">
					        <a attr="${resume.resumeNo}" href="${pageContext.request.contextPath}/mypage/resumeUpdateForm.do?resumeNo=${resume.resumeNo}"
					        style="align-content: right" class="btn_smaller_type01">수정</a>
					        
				        </td>
				        <td>
				        	
				       		<%-- <input name="openstate" type="checkbox" <c:if test="${resume.openState eq 1}">checked="checked"</c:if>> --%>
				       		<div class="selectable">
				       				
				       		<c:choose>
				       			<c:when test="${resume.openState eq 1}">
					       			<span attr="${resume.resumeNo}" class="ui-widget-content  ui-selected open">공개</span>
					       			<span attr="${resume.resumeNo}" class="ui-widget-content nonopen">비공개</span>
				       			</c:when>
				       			<c:otherwise>
					       			<span attr="${resume.resumeNo}" class="ui-widget-content open">공개</span>
					       			<span attr="${resume.resumeNo}" class="ui-widget-content ui-selected nonopen">비공개</span>
				       			</c:otherwise>
				       		</c:choose>
  							</div>
				        </td>
				        <td class="regDate"><fmt:formatDate value="${resume.regDate}" pattern="yyyy-MM-dd"/></td>
				      </tr>
				      </c:forEach>
				    </tbody>
				</table>
			</div>
		</section>
		
		<div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-lg">
		
		      <!-- Modal content-->
		      <div class="modal-content">
		   <!--      <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">이력서</h4>
		        </div> -->
		        <div class="modal-body">
		       		
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		      
		    </div>
  		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	<script>
	
	
	$('.deleteimg').click(function(){
		var chk = confirm("정말 삭제하시겠습니까?");
		if(chk == true){
		  $.ajax({
             url: "${pageContext.request.contextPath}/mypage/deleteResume.do?resumeNo="+$(this).attr("attr"),
             success: function(data) {
             	location.href="${pageContext.request.contextPath}/mypage/resumeList.do";
             	}
             }); 
		}
		
	});
	

	
	
	
	 $('.resumeTitle').click(function(event){
		$("#myModal").modal("show");
		$(".modal-body").load("${pageContext.request.contextPath}/mypage/resumeInfo.do?resumeNo="+$(this).attr("attr"));
	});
	 
	
	 
	 
	$(document).ready(function(){
		$("#regResume").click(function(){
			var count = $("span.resumeTitle").length;
			if(count<=4){
				location.href="${pageContext.request.contextPath}/mypage/resumeForm.do";
			}else{
				alert("이력서 최대 갯수는 5개입니다.");
			}
		});
		
		$( function() {
		    $( ".selectable" ).selectable({
		      stop: function() {
		        $( ".ui-selected", this ).each(function() {
		          var spanThis = this;	
		          var state = $( ".selectable span" ).index( this );
		        $.ajax({
		        	url:"${pageContext.request.contextPath}/mypage/openState.do?resumeNo="+$(this).attr("attr")+"&&openState="+state,
		        	success:function(data){
		        		
		        		/* $(this).addClass("ui-selected"); */
		        		/* location.href="${pageContext.request.contextPath}/mypage/resumeList.do"; */
		        		console.dir($(spanThis))
// 		        		$(this).addClass("ui-selected");
		        		var attrNo = $(spanThis).attr("attr")
		        		$("span[attr].ui-widget-content").each(function () {
		        			if (attrNo != $(this).attr("attr")) {
		        				var date = new Date();
			        			if ($(this).hasClass("open")) $(this).removeClass("ui-selected");
			        			if ($(this).hasClass("nonopen")) $(this).addClass("ui-selected");
		        			}
		        		})
		        		
		        	}
		        });
		          
		        });
		      }
		    });
		    
	
		  
		   
		   
		    
		    
		  });
		
		
		
		
		/* $('.ui-widget-content').click(function(){
			
		});  */
		
		
		
		
		
		/* function setModalMaxHeight(element) {
			  this.$element     = $(element);  
			  this.$content     = this.$element.find('.modal-content');
			  var borderWidth   = this.$content.outerHeight() - this.$content.innerHeight();
			  var dialogMargin  = $(window).width() < 768 ? 20 : 60;
			  var contentHeight = $(window).height() - (dialogMargin + borderWidth);
			  var headerHeight  = this.$element.find('.modal-header').outerHeight() || 0;
			  var footerHeight  = this.$element.find('.modal-footer').outerHeight() || 0;
			  var maxHeight     = contentHeight - (headerHeight + footerHeight);

			  this.$content.css({
			      'overflow': 'hidden'
			  });
			  
			  this.$element
			    .find('.modal-body').css({
			      'max-height': maxHeight,
			      'overflow-y': 'auto'
			  });
			} */
		
		
		 
			
		 
	});
	
		
	</script>
</body>
</html>