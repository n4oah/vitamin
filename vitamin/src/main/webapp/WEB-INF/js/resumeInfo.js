$( function() {
			    
});
			
			
				/*$('.intermediate_save').click(function(){
					$.ajax({
						url : "${pageContext.request.contextPath}/mypage/intermediateSave.do",
						type:"POST",
						success : function () {
							
						}
					});
				});*/
			
			
function validation(){
	
	var jobstate = $('#jobState').val()
	var marrystate= $('#marryState').val()
	var bohonstate= $('#bohonState').val()
	var supportstate= $('#supportState').val()
	var armyservicestate= $('#armyServiceState').val()
	var armyservicereason= $('#armyServiceReason').val()
	
	if(jobstate.length<1){
		alert("구직상태를 설정해주세요")
	}else if(marrystate.length<1){
		alert("결혼여부를 설정해주세요")
	}else if(bohonstate.length<1){
		alert("보훈대상여부를 설정해주세요")
	}else if(supportstate.length<1){
		alert("고용지원금대상여부를 설정해주세요")
	}else if(armyservicestate.length<1){
		alert("군대 여부를 설정해주세요")
	}else if(armyservicestate=="3"){
		if(armyservicereason.length<1){
			alert("면제사유를 적어주세요")
		}
	}
	
				
				/* var enterDate = new Date($('#highenter').val())
				var endDate = new Date($('#highgraduate').val())
				var endYear = endDate.getYear()
				var endMonth = endDate.getMonth()
				var enterYear= enterDate.getYear()
				var enterMonth = enterDate.getMonth()
				
				
				if(endYear-enterYear<2){
					alert("졸업기간이 2년이내입니다.")
				}
				else if(endYear-enterYear==2 && endMonth-enterMonth!=0){
					alert("졸업기간이 2년이내입니다.")
					
				}*/
				
} 
			
			/* $(document).ready(function(){
				$('#highenter').click(function(){
					$('#highgraduate').val()=""
				});
			}); */





			
			
			
				
			