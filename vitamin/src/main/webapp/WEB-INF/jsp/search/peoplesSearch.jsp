<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="content-script-type" content="text/javascript">
		<title>Insert title here</title>
		<%@ include file="/WEB-INF/jsp/include/basic.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
 
<script src="https://use.fontawesome.com/942e94bfdb.js"></script>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/peoplesSearch.css">
<script src="${pageContext.request.contextPath}/js/waitMe.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/waitMe.css">

<!-- include the jQuery and jQuery UI scripts -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                
<!-- plus a jQuery UI theme, here I use "flick" -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-slider-pips.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui-slider-pips.js"></script>
		<link rel="stylesheet" href="../css/mCalendar.css">
		<script src="../js/mCalendar.js"></script>
		<script src="../js/simpledateformat.js"></script>
	</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<div id="wrapper" style="margin-top: 0px;">
<section class="container">
	<div class="row">
		<div class="search_wrapper">
			<div class="row" style="margin: 0px">
				<div class="city_wrapper">
					<c:forEach items="${cityList }" var="city">
						<span class="showSelect btn-secondary" data-target="#ddCity${city.cityCode}" id="ddCityBtn" data-no="${city.cityCode}">${city.subName}</span>
					</c:forEach>
				</div>
			</div>
			
			<div class="detail_wrapper">
				<div class="career">
					<Strong class="career_title">경력</Strong>
					<div class="career_slider slider"></div>
				</div>
				
				<div class="education">
					<Strong class="education_title">학력</Strong>
					<c:forEach items="${schList }" var="sch" varStatus="i">
						<c:choose>
							<c:when test="${i.index == 0 }">
								<label class="btn active">
						          <input type="checkbox" class="bootCheck allCheck"><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> <span> 전체 선택</span>
					        	</label>
							</c:when>
							<c:otherwise>
								<label class="btn active">
						          <input type="checkbox" name="schoolLevel" class="bootCheck" value="${sch.level }"><i class="fa fa-square-o fa-2x"></i><i class="fa fa-check-square-o fa-2x"></i> <span> ${sch.graduateState}</span>
						        </label>
					        </c:otherwise>
						</c:choose>
			        </c:forEach>
				</div>
				
				
				<div class="age">
					<Strong class="age_title">나이</Strong>
					
					<span class="dropdown " >
						 <span class="select">
       						 <span>전체</span>
		         			 <i class="fa fa-chevron-down"></i>
		        		</span>
		        		
		        			<ul class="dropdown-menu" data-mir="start">
		        				<li>전체</li>
		          				<c:forEach begin="20" end="60" var="i">
		          				<li>${i }세 이상</li>
		          				</c:forEach>
		        			</ul>
					</span>
					
					<span class="river">
						<Strong>~</Strong>
					</span>
					
					<span class="dropdown">
						 <span class="select">
       						 <span>전체</span>
		         			 <i class="fa fa-chevron-down"></i>
		        		</span>
		        		
		        			<ul class="dropdown-menu" data-mir="end">
		        				<li>전체</li>
		          				<c:forEach begin="20" end="60" var="i">
		          				<li>${i }세 이하</li>
		          				</c:forEach>
		        			</ul>
					</span>
					
					<span class="col-md-offset-3">
						<Strong class="salary_title">성별 </Strong>
				
						<label><input type="radio" value="1" name="gender"> <font>남자</font></label>
						<label><input type="radio" value="2" name="gender"> <font>여자</font></label>
						<label><input type="radio" value="3" name="gender" checked="checked"> <font>성별무관</font></label>
					</span>
				</div>
				
				<div class="licenseInput">
					<Strong class="age_title">자격증</Strong>
					<span>
						<input type="text" class="license">
						<button type="button" class="button blue licensePlus">추가</button>
					</span>
				</div>
				
				<div class="selectList">
					<span>
						<Strong class="marry_title">혼인</Strong>
				
						<label><input type="radio" value="0" name="marry"> <font>미혼</font></label>
						<label><input type="radio" value="1" name="marry"> <font>비혼</font></label>
						<label><input type="radio" value="3" name="marry" checked="checked"> <font>혼인 무관</font></label>
					</span>
					
					<span style="margin-left: 8%;">
						<Strong class="army_title">군필</Strong>
				
						<label><input type="checkbox" value="0" name="army"> <font>비대상</font></label>
						<label><input type="checkbox" value="1" name="army"> <font>군필</font></label>
						<label><input type="checkbox" value="2" name="army"> <font>미필</font></label>
						<label><input type="checkbox" value="3" name="army"> <font>면제</font></label>
						<label><input type="checkbox" value="4" name="army"> <font>복무중</font></label>
						<label><input type="checkbox" value="5" name="army"> <font>군필 무관</font></label>
					</span>
					
					<span style="margin-left: 8%;">
						<Strong class="job_title">구직 중만</Strong>
						<div class="switch">
							<input type="checkbox" name="toggle" class="jobState">
							<label for="toggle"><i></i></label>
							<span></span>
						</div>
					</span>
				</div>
				
				
				<div class="search_button">
					<input type="button" value="검색">
				</div>
			</div>

			<div class="wrapper preload">
				<section class="grid-unit top-left">
					<div class="careerList">
						<div>
							최소 경력:
							<font class="careerStart">신입</font>
							<span class="remove" data-name="cs">X</span>
						</div>
						
						<div>
							최대 경력:
							<font class="careerEnd">20년 이상</font>
							<span class="remove" data-name="ce">X</span>
						</div>
					</div>
					
					<div class="licenseList">
						<span>
							자격증:
						</span>
					</div>
					<div class="sphere"></div>
					<span class="icon fa fa-black-tie"></span> <span class="label">Career</span>
				</section>
				
				
				<section class="grid-unit top-right">
					<div class="schList">
					</div>
					<div class="sphere"></div>
					<span class="icon fa fa-graduation-cap"></span> <span class="label">School</span>
				</section>
				
				
				<section class="grid-unit bottom-left">
					<div class="addrList">
					</div>
					<div class="sphere"></div>
					<span class="icon fa fa-globe"></span> <span class="label">Address</span>
				</section>
				
				
				<section class="grid-unit bottom-right">
					<div class="ageList">
						<div>
							최소 나이:
							<font class="ageStart">전체</font>
							<span class="removeAge" data-name="cs">X</span>
						</div>
						
						<div>
							최대 나이:
							<font class="ageEnd">전체</font>
							<span class="removeAge" data-name="ce">X</span>
						</div>
					</div>
					
					<div class="genderHope">
						<div>
							희망 성별:
							<font class="gender" data-mir="3">성별무관</font>
							<span class="removeGender">X</span>
						</div>
					</div>
					
					<div class="marryHope">
						<div>
							혼인 유무:
							<font class="marry" data-mir="3">혼인 무관</font>
							<span class="removeMarry">X</span>
						</div>
					</div>
					
					<div class="armyHope">
						<div>
							군필:
						</div>
					</div>
					
					<div class="sphere"></div>
					<span class="icon fa fa-id-card"></span> <span class="label">Info</span>
				</section>
			</div>
			<!-- end wrapper -->
		</div>
		
		<!-- <div class="iframe">
			<div class="moveBar">여기를 잡고 움직이세요.</div>
			<iframe src="http://192.168.0.146:3030/?memberNo=${user.accountNo}&password=${user.pwd}" width="500" height="300" name="iframe"></iframe>
		</div> -->
		
		<div class="recruit_list">
			<div class="listSize">검색 결과: <font class="listSizeInt">0</font>개</div>
			<table class="recruit_table table" >
				<colgroup>
					<col width="34px">       
					<col width="18%">
					<col width="*">
					<col width="9%">
					<col width="10%">
					<col width="12%">
					<col width="7.6%">
		    	</colgroup>
					
					<thead>
				    	<tr>
			                <th class="col-md-1">
			                	이름 <span class="member_name_asc">↑</span><span class="member_name_desc">↓</span>
			                	나이
		                	</th>
					        <th class="col-md-2">
					        	이력서 제목 <span class="title_asc">↑</span><span class="title_desc">↓</span>
					        	등록일 <span class="resume.reg_date_asc">↑</span><span class="resume.reg_date_desc">↓</span>
				        	</th>
					        <th class="col-md-1">군필 <span class="army.army_service_no_asc">↑</span><span class="army.army_service_no_desc">↓</span></th>
					        <th class="col-md-1">
					        	경력 <span class="career_years_asc">↑</span><span class="career_years_desc">↓</span>
					        	학력 <span class="vi_school_level.school_level_no_asc">↑</span><span class="vi_school_level.school_level_no_desc">↓</span>
					        </th>
					        <th class="col-md-1">지역</th>
					        <th class="col-md-1">생년월일</th>
				    	</tr>
			   		 </thead>
			   		 
			   		 
			    	<tbody>
					</tbody>
				</table>
			</div>
		</div>			
	</section>
</div>

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

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

<script>
$(document).ajaxStart(function () {waitEffect();})
.ajaxStop(function () {$("body").waitMe("hide");});

$('.wrapper').removeClass('preload');

function waitEffect() {
	$("body").waitMe({
		effect : "bounce",
		text : "Wait",
		bg : "rgba(0, 0, 0, 0.5)",
		color : "white"
	});
}

var careerStart;
var careerEnd;
		    
   $(".career_slider").slider({ 
       min: 0, 
       max: 20, 
       range: true,
       values: [0, 20] 
   }).slider("pips", {
       rest: "label",
       suffix: "년",
       labels: {"first": "신입", "last": "20년<font class='up_arrow'>↑</font>"}
   }).slider("float", {
   	suffix: "년",
   	labels: {"first": "신입", "last": "20년<font class='up_arrow'>↑</font>"}
   }).on("slidechange", function (e, ui) {
   	careerStart = ui.values[0];
   	careerEnd = ui.values[1];
   	
   	var val1;
   	var val2;
   	
   	if (ui.values[0] == "0") {
   		val1 = "신입";
   	}
   	
   	if (ui.values[1] == "0") {
   		val2 = "신입";
   	} else if (ui.values[1] == "20") {	    		
   		val2 = ui.values[1]+"년 이상";
   	}
   	
   	if (ui.value == ui.values[0])
   		$(".careerStart").text(val1 ? val1 : ui.values[0]+"년 이상").attr("data-mir", ui.values[0]);
   	if (ui.value == ui.values[1])
   		$(".careerEnd").text(val2 ? val2 : ui.values[1]+"년 이하").attr("data-mir", ui.values[1]);
   });
   
   var chk = true;

var path = "${pageContext.request.contextPath}";
$(function() {
	let anim = $('.showSelect').css('transition');
	
	let length = $('.showSelect').length;
	let ss = $('.city_wrapper > span.showSelect');
	ss.css('transition', 'none');
	ss.width((ss.parent().width() / length) - 24 - 2);

	//ss.css('transition', anim);
});

$(".career_none, .education_none").toggle(function () {
	$(this).attr("checked", $(this).is(":checked"));
	$(this).parent().parent().siblings().not("strong").css("pointer-events", "none");
}, function () {
	$(this).attr("checked", $(this).is(":checked"));
	$(this).parent().parent().siblings().not("strong").css("pointer-events", "");
});

$(".showSelect").click(function () {
	var no = $(this).attr("data-no");
	if ($("#ddCity"+no).length <= 0) {
		$.ajax({
			type: "post",
			data: "no="+no,
			url: path+"/search/areaList.do",
                  dataType: "JSON",
			success: function (city) {						
				var div = $("<div>").addClass("optContainer").attr("id", "ddCity"+city.cityCode).css("display", "block")
			    .append($("<label>")
			    	.append($("<input>").addClass("checked").attr({"type": "checkbox"}).val(city.cityCode))
			    	.append($("<b>").text(city.subName+"전체")))
		    	.append($("<h5>").text("지역"));
				
				city.areaList.forEach(function (area) {
			    	div.append($("<label>").addClass("area")
			    			.append($("<input>").attr("type", "checkbox").val(area.areaCode))
			    			.append($("<b>").text(area.name)));
			    });
			    
			    $(".search_wrapper > .row").after(div);
			}
		});
	}

	$("#ddCity"+no).toggle();
	$(".optContainer:not("+"#ddCity"+no+")").hide();
});

$(".search_wrapper").on("click", ".area > :checkbox", function () {
	var value = $(this).val();
	var checked = $(this).parent().parent().find(".checked");
	var fValue = checked.val();
	
	if (!$(this).prop("checked")) {
		if (checked.is(":checked")) {
			checked.prop({"checked": false});
			$(this).parent().parent().find(":checked").each(function (i, e) {
				$("<span>")
					.append($("<font>").attr("data-mir", $(this).val()).text($(this).next().text()))
					.append($("<span>").addClass("removeAddr").text("X"))
				.appendTo(".addrList");
			});
		}
		
		$("[data-mir='"+value+"'], [data-mir='"+value+"'] + span").remove();
		
		$("font[data-mir='"+fValue+"'], font[data-mir='"+fValue+"'] + span").remove();
	} else {
		$("<span>")
			.append($("<font>").attr("data-mir", value).text($(this).next().text()))
			.append($("<span>").addClass("removeAddr").text("X"))
		.appendTo(".addrList");
		
		if ($(this).parent().parent().find(".area > input:checked").length ==
		$(this).parent().parent().find(".area > input").length) {
			$(".checked").trigger("click");					
		}
	}
});

$(".search_wrapper").on("click", ".checked", function () {
	var chk = $(this).prop("checked");
	var value = $(this).val();

	$(this).parent().parent().find(":checkbox").prop({"checked": chk});
	
	if (chk) {
		//$(this).parent().parent().find(":checkbox").parent().addClass("checked");
		
		$(this).parent().parent().find(":checkbox").each(function (i, e) {
			var eValue = $(this).val();
			$("[data-mir='"+eValue+"'], [data-mir='"+eValue+"'] + span").remove();
		});
		
		
		$("<span>")
			.append($("<font>").attr({"data-mir": value, "data-city": true}).text($(this).next().text()))
			.append($("<span>").addClass("removeAddr").text("X"))
		.appendTo(".addrList");
	} else {
		//$(this).parent().parent().find(":checkbox").parent().removeClass("checked");
		
		$("font[data-mir='"+value+"'], font[data-mir='"+value+"'] + span").remove();
	}
});

$(".bootCheck").click(function () {
	if (!$(this).prop("checked")) $(this).parent().siblings().find(".allCheck").prop({"checked": false});
	else {
		if ($(this).parent().parent().find("input:checked").length -
		$(this).parent().parent().find("input").length == -1)
			$(".allCheck").prop({"checked": true});
	}
});

$(".bootCheck:not(.allCheck)").on("change", function () {
	if ($(this).is(":checked")) {
		$("<font>").addClass("sch").text($(this).parent().find("span").text()).attr("data-mir", $(this).val()).appendTo(".schList");
		$("<span>").addClass("removeSch").text("X").appendTo(".schList");				
	} else {
		var civa = $("font.sch[data-mir='"+$(this).val()+"']");
		civa.next().remove();
		civa.remove();
	}
});

$(".schList, .addrList").on("click", ".removeSch, .removeAddr", function (e) {
	$("[value='"+$(this).prev().attr("data-mir")+"']").trigger("click");
});	

$(".allCheck").click(function () {
	var chk = $(this).prop("checked");
	$(this).parent().parent().find("[type=checkbox]").prop({"checked": chk});
	if (chk) {
		$(".bootCheck:not(.allCheck)").each(function (i, e) {
			var input = $(e);
			
			if ($("font.sch[data-mir='"+input.val()+"']").length <= 0) {
				$("<font>").addClass("sch").text(input.parent().find("span").text()).attr("data-mir", input.val()).appendTo(".schList");
				$("<span>").addClass("removeSch").text("X").appendTo(".schList");						
			}
			
		});
	} else {
		$(".bootCheck:not(.allCheck)").each(function (i, e) {
			var civa = $("font.sch[data-mir='"+$(this).val()+"']");
			civa.next().remove();
			civa.remove();
		})
	}
});

$(".remove").click(function (e) {
	switch ($(this).attr("data-name")) {
		case "cs" :
			//$("span.ui-slider-label:eq(0)").trigger("click");
			$(".career_slider").slider({ 
		        values: [0, careerEnd] 
	    	});
			break;
		case "ce" :
			$(".career_slider").slider({ 
		        values: [careerStart, 20] 
	    	});
	}
	
	//$(this).prev().text("");
});



$('span.dropdown').click(function () {
	if (chk) {
		$(this).attr('tabindex', 1).focus();
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle(300);
	} else $(this).removeClass('active');
    });
    $('span.dropdown').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.dropdown-menu').slideUp(300);
    });
    $('span.dropdown .dropdown-menu li').click(function () {
        $(this).parents('span.dropdown').find('span > span').text($(this).text());
        
        var text = $(this).text()
        var val = parseInt(text);
        
        switch ($(this).parent().attr("data-mir")) {
	        case "start" :
	        	$(".ageStart").text(val ? text : "전체");
				break;
	        case "end" :
	        	$(".ageEnd").text(val ? text : "전체");
        }
    });
    
    
   $(".dropdown-menu > li").click(function () {
   	var start = parseInt($(".select:eq(0) > span").text());
   	var end = parseInt($(".select:eq(1) > span").text());

   	if(start && end && start > end) {
		chk = false;
		$(this).siblings(":first-child").trigger("click")
		alert("나이를 확인해주세요.");
		chk = true;
	}
   });
   
   function ageRemove(no) {
   	$(".removeAge:eq("+no+")").click(function () {
   		chk = false;
    	$(".dropdown-menu:eq("+no+") > li:first-child").trigger("click");
    	chk = true;
    });
   }
   
   ageRemove(0);
   ageRemove(1);
   
   function selectChange(str) {
    $("input[name='"+str+"']").on("change", function () {
    	$("."+str+"").text($(this).next().text()).attr("data-mir", $(this).val());
    });
    
    $(".remove"+str.charAt(0).toUpperCase()+str.slice(1)).click(function () {
    	$("input[name='"+str+"'][value='3']").trigger("click");
    });	    	
   }
   
   selectChange("gender");
   selectChange("marry");
   
   
   $("input[name='army']").on("change", function () {
   	var val = $(this).val();
   	var str = $(this).next().text();

   	if ($(this).is(":checked")) {
   		if ($("input[name='army'][value=5]").not(this).length != 0 && $("input[name='army'][value=5]").is(":checked")) {
    		$("input[name='army'][value=5]").attr("checked", false);
    		$(".army[data-mir=5]").next().remove();
    		$("font.army[data-mir=5]").remove();
    	}
   		
   		$(".armyHope > div:first-child").append($("<font>").addClass("army").attr("data-mir", val).text(str));
   		$(".armyHope > div:first-child").append($("<span>").addClass("removeArmy").text("X"));	    		    		
   	} else {
   		$(".army[data-mir="+val+"]").next().remove();
   		$("font.army[data-mir="+val+"]").remove();	    		
   	}
   });
   
   $(".armyHope").on("click", ".removeArmy", function () {
   	$("input[name='army'][value="+$(this).prev().attr("data-mir")+"]").trigger("click");
   });
   
   $("input[name='army'][value=5]").on("change", function () {
   	if ($(this).is(":checked")) {
   		$("input[name='army']").not(this).each(function (i, data) {
   			if ($(data).is(":checked"))
   				$(data).trigger("click");
   		});
   	}
   });
   
   var license;
   
   $( ".license" ).autocomplete({
       source : function( request, response ) {
            $.ajax({
                   type: 'post',
                   url: path+"/mypage/certificationSelect.do",
                   dataType: "JSON",
                   data: { "name" : request.term },
                   success: function(data) {
                         response(
                            $.map(data, function(item) {
                               return {
                                   label: item.name,
                                   value: item.name,
                                   no: item.certificateNo
                               }
                           }));
                   	}
                   });
              },
       minLength: 2,
       select: function( event, ui ) {
       	license = ui.item;
       }
   });
   
   $(".license").on("keydown", function (e) {
   	if (e.keyCode == 8) license = null;
   });
   
   $(".licensePlus").click(function () {
   	if (!license) {
   		alert("정확한 자격증 정보를 입력해주세요.");
   		return;
   	}
	var civa = $("font.lic[data-mir='"+license.no+"']");
   	if (civa.length < 1) {
		$("<font>").addClass("lic").text(license.label).attr("data-mir", license.no).appendTo(".licenseList");
		$("<span>").addClass("removeLic").text("X").appendTo(".licenseList");				
	} else {
		alert("이미 존재하는 자격증입니다.");
		if (!confirm("삭제하시겠습니까?")) {
		    return;
		} else {
			civa.next().remove();
			civa.remove();
		}
	}
   });
   
   $(".licenseList").on("click", ".removeLic", function () {
   	$(this).prev().remove();
   	$(this).remove();
   });
   
   var submitChk = false;
   var lastNo;
   var parameterDataGlobal;
   var parameterDataGlobalAppend;
   var orderChk = false;
   var page = 0;
   var orderByGlobal;
   function getPage() {
	   page += 1;
	   return page;
   }
   
	var sdf = new simpleDateFormat("yyyy-MM-dd");
	
   var submit = function (e, scroll, order, orderBy) {
   	if (!scroll && !order) submitChk = true;
   	if (scroll && lastNo && !orderChk) parameterDataGlobalAppend = parameterDataGlobal+"&lastNo="+lastNo;
   	else if (scroll && orderChk) parameterDataGlobalAppend = parameterDataGlobal+"&orderBy="+orderByGlobal+"&lastNo="+lastNo;
   	else if (order && orderBy) parameterDataGlobalAppend = parameterDataGlobal+"&orderBy="+orderBy;
   	else {
   		orderChk = false;
   		parameterDataGlobalAppend = null;
   		page = 0;
	   	var parameterData = "?";
	   	
	   	var cs = parseInt($(".careerList font:eq(0)").text());
	   	var ce = parseInt($(".careerList font:eq(1)").text());
	   	if (cs) parameterData += "&careerStart="+cs;	    	
	   	if (ce && ce != 20) parameterData += "&careerEnd="+ce;	    	
	   	$(".lic").each(function (i, data) {
	   		parameterData += "&licenseCode="+$(data).attr("data-mir");
	   		parameterData += "&licenseName="+$(data).text();
	   	});
	   	$(".sch").each(function (i, data) {
	   		parameterData += "&schoolCode="+$(data).attr("data-mir");
	   	});
	   	$(".addrList font").each(function (i, data) {
	   		parameterData += "&"+($(data).attr("data-city") ? "cityCode" : "areaCode")+"="+$(data).attr("data-mir");
	   	});	    	
	   	var as = parseInt($(".ageStart").text());
	   	var ae = parseInt($(".ageEnd").text());	    	
	   	if (as) parameterData += "&ageStart="+as;	    	
	   	if (ae) parameterData += "&ageEnd="+ae;	    	
	   	var gender = $(".gender").attr("data-mir");
	   	if (gender != 3) parameterData += "&gender="+gender;
	   	var marry = $(".marry").attr("data-mir");
	   	if (marry != 3) parameterData += "&marry="+marry;
	   	$(".army:not([data-mir=5])").each(function (i, data) {
	   		parameterData += "&army="+$(data).attr("data-mir");
	   	});
	   	if ($(".jobState").is(":checked")) parameterData += "&jobState=1";
	   	if (order) parameterData += "&orderBy="+orderBy;
	   	
	   	parameterDataGlobal = parameterData;
   	}
   	console.log(parameterDataGlobal);
   	console.log(parameterDataGlobalAppend);
   	
   	$.ajax({
   		type: "POST",
   		url: path+"/search/peoplesSearchList.do",
   		data: parameterDataGlobalAppend ? parameterDataGlobalAppend : parameterDataGlobal,
   		dataType: "JSON",
   		success: function (data) {
   			console.log(data)
   			if (!scroll) {
   				$("tbody").empty();
   				$(".listSizeInt").text(data.listSize);
   			}
   			data.list.forEach(function (human, i) {
				var tr = $("<tr>");

				if (data.list.length-1 == i) lastNo = human.resumeNo;
				
				tr.append($("<td>").addClass("recruit_nm")
					.append($("<a>").addClass("str_tit nameAjax")
							.attr({"title": human.name, "data-mir": human.memberNo})
						.append($("<span>").text(human.name+"("+human.age+"세)")))
					.append($("<div>").addClass("icon")));
				
				tr.append($("<td>").addClass("notification_info")
					.append($("<div>").addClass("job_tit")
						.append($("<a>").addClass("str_tit resumeTitle").attr({"title": human.title,
							"data-mir": human.resumeNo})
							.append($("<span>").text(human.title)))
						.append($("<p>").addClass("job_sector")
							.append($("<span>").text("등록일\t"+sdf.format(new Date(human.regDate)))))));
				
				var army;
				
				switch (human.armyServiceState) {
					case 0 :
						army = "비대상";
						break;
					case 1 :
						army = "군필";
						break;
					case 2 :
						army = "미필";
						break;
					case 3 :
						army = "면제";
						break;
					case 4 :
						army = "복무중";
						break;
				}
				
				tr.append($('<td>').addClass('army_condition')
						.append($('<p>').addClass('armyAjax').text(army))
						.append($('<p>').addClass('armyAjax').text(human.armyServiceReason ? human.armyServiceReason : "")));
				
				tr.append($('<td>').addClass('recruit_condition')
					.append($('<p>').addClass('careerAjax').text(human.careerYears ? human.careerYears+"년차" : "신입"))	
					.append($('<p>').addClass('educationAjax').text(human.graduateState)));
				
				tr.append($('<td>').addClass('company_info')
					.append($('<p>').addClass('employment_typeAjax').text(human.cityName))
					.append($('<p>').addClass('work_placeAjax').text(human.areaName)));
					
					
				tr.append($('<td>').addClass('support_infoAjax')
					.append($('<p>').addClass('recruit_date_startAjax').css("padding-left", "2px").text(sdf.format(new Date(human.birthDate)))));
					
				$("tbody").append(tr);
			});
			
   			if (!scroll) $(".search_button > input").one("click", submit);
   		}
   	});
   	
   };
   
   $(".search_button > input").one("click", submit);
   
   $(window).scroll(function (e) {
   	if (submitChk && $(this).scrollTop() == $(document).height() - $(window).height()) {
   		submit(e, true);
   	}
   });
   $("[class$='_asc']").click(function (e) {
	   if (submitChk) {
		   orderChk = true;
		   orderByGlobal = $(this).attr("class").replace("_asc", " asc");
		   submit(e, false, true, $(this).attr("class").replace("_asc", " asc"));		   
	   }
   });
   $("[class$='_desc']").click(function (e) {
	   if (submitChk) {
		   orderChk = true;
		   orderByGlobal = $(this).attr("class").replace("_desc", " desc");
		   submit(e, false, true, $(this).attr("class").replace("_desc", " desc"));		   
	   }
   });
   
   $('tbody').on("click", ".resumeTitle", function (event) {
	console.log(path+"/search/resumeInfo.do?resumeNo="+$(this).attr("data-mir"))
	$("#myModal").modal("show");
	$(".modal-body").load(path+"/search/resumeInfo.do?resumeNo="+$(this).attr("data-mir"));
});
   
   $(".iframe").draggable();
   
   console.log($(document.querySelector('iframe')));
</script>
</body>
</html>