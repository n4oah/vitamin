$( function() {
	
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
        let str = '',
            strNo = '';

        for(let map of array) {
            str += `${map.get('content')}`;
            strNo += `${map.get('no')}`;
        }

        $('#hope_bussiness').val(str);
        $('#hope_bussiness_no').val(strNo)
	});
	
});