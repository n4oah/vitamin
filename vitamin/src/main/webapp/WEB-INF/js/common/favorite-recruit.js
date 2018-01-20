$(function() {
	$('.favorite-recruit').click(function() {
		let check = $(this).hasClass('star');
		
		let url = getContextPath() + '/favoriteRecruit/favoriteRecruit.do';
		
		let data = {'favorite': check};
		console.log(data);
		
		$.ajax({
			url: url,
			data: data,
			success: function() {
				
			}
		});
	});
});