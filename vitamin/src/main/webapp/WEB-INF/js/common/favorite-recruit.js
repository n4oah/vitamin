$(function() {
	$('.favorite-recruit').click(function() {
		let check = $(this).hasClass('star');
		let recruitNo = $(this).attr('attr');
		
		let url = getContextPath() + '/favoriteRecruit/favoriteRecruit.do';
		
		let data = {'favorite': check, 'recruitNo': recruitNo};
		$.ajax({
			url: url,
			data: data,
			success: function() {
				swal("즐겨찾기 공고 추가", "즐겨찾기 공고 추가가 되었습니다.\r\n일정표에서 즐겨찾기 공고 일정을 알 수 있습니다.", "success");
			}
		});
	});
});