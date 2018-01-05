$(function() {
	//자격증 발행처	
	 $( "#certification" ).autocomplete({
	        source : function( request, response ) {
	             $.ajax({
	                    type: 'post',
	                    url: "${pageContext.request.contextPath}/mypage/certificationSelect.do",
	                    dataType: "json",
	                    data: { "name" : request.term },
	                    success: function(data) {
	                    
	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                          response(
	                             $.map(data, function(item) {
	                                return {
	                                    label: item.name,
	                                    value: item.name,
	                                    no: item.licensingDepartmentNo
	                                }
	                            })
	                            )
	                    	}
	                    });
	               },
	        minLength: 2,
	        select: function( event, ui ) {
	             $.ajax({
	            	 url:"${pageContext.request.contextPath}/mypage/licensingDepartment.do?licensingDepartmentNo="+ui.item.no,
	            	 dataType:"json",
	            	 success: function(data){
	            		 $("#licensingDepartment").val(data.name);
	            	 }
	             });
	        }
	    });
	 
	 
	 
	
	//희망직종
	const MAX_COUNT = 3;
		
	let array = new Array();
	
	$('#hope_bussiness').click(function(event){
		$("#myModal").modal("show");
	});

	$('div#myModal input.selectedBusiness').change(function(event) {
		if($(this).is(':checked') == true) {
            if(array.length >= MAX_COUNT) {
                $(this).attr('checked', false);
                alert(`직종은 ${MAX_COUNT}개 까지만 선택 가능합니다.`);
                event.preventDefault();
                return;
            }

            let no = $(this).val();
            let content = $(this).parent('label').find('span.content').text();
            let category = $(this).closest('tr').find('th').text();

            let map = new Map();
            map.set('no', no);
            map.set('content', content);
            map.set('category', category);
            
			array.push(map);
		} else if($(this).is(':checked') == false) {
            let no = $(this).val();
            let content = $(this).parent('label').find('span.content').text();
            let category = $(this).parent('tr').find('th').text();

            for(let i = 0; i < array.length; i++) {
                if(array[i].get('no') == no) {
                    array.splice(i, 1);
                }
            }
		}
	});
	
	$('#myModal').on('hide.bs.modal', function (event) {
        let split = ', ';
        let str = '', strNo = '';

        for(let map of array) {
            str += `${map.get('category')} > ${map.get('content')}${split}`;
            strNo += `${map.get('no')}|`;
        }
        str = str.substr(0, str.length-split.length);
        strNo = strNo.substr(0, strNo.length-1);
        
        console.log(strNo);

        $('#hope_bussiness').val(str);
        $('#hope_bussiness_no').val(strNo)
	});
});
