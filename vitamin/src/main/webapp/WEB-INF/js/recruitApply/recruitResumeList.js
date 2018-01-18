$(function() {
	$('#recruit-list-table .recruit-data-row').each(function() {
		let attr = $(this).find('select.recruit-state').attr('attr');
		let opts = $(this).find('select.recruit-state option');
		
		for(let opt of opts) {
			let val = $(opt).val();
			
			if(val == attr) {
				$(opt).attr('selected', 'selected');
				$("#recruit-list-table .recruit-data-row select.recruit-state").selectpicker('render');
				break;
			}
		}
	});
	
	$('#recruit-list-table .recruit-data-row select.recruit-state').on('change', function(){
		let comapplyNo = $(this).closest('tr.recruit-data-row').attr('attr');
		let state = $(this).find('option:selected').val();
		
		let url = getContextPath() + '/recruitApply/companyApplyState.do';
		let data = {'comapplyNo': comapplyNo, 'state': state};
		
		waitingDialog.show();
		
		$.ajax({
			url: url,
			data: data,
			success: function() {
				waitingDialog.hide();
			}
		});
	});
	
	$('.resume-name').click(function(event){
		$("#myModal").modal("show");
		$(".modal-body").load(getContextPath() + "/mypage/resumeInfo.do?resumeNo="+$(this).attr("attr"));
		event.preventDefault();
	});
	
	$('.introduction-name').click(function(event){
		console.log('bbbbbb');
		$("#myModal").modal("show");
		$(".modal-body").load(getContextPath() + "/mypage/introductionDetail.do?introductionNo="+$(this).attr("attr"));
		event.preventDefault();
    });
});