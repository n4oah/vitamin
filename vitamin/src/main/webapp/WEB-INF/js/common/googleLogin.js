$(function() {
	$('.google-login-btn').click(function(event){
		console.log(getContextPath() + '/account/googleLogin.do');
		$.ajax({
			url: getContextPath() + '/account/googleLogin.do',
			success: function(url) {
				location.href = url;
			}
		})
		event.preventDefault();
	});
});