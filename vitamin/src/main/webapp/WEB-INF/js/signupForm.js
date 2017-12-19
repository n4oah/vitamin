$(function() {
    $('#private-form-link').click(function(e) {
		$("#private-form").delay(100).fadeIn(100);
 		$("#company-form").fadeOut(100);
		$('#company-form-link').removeClass('active');
		$(this).addClass('active');
		console.log("aa");
		e.preventDefault();
	});
	$('#company-form-link').click(function(e) {
		$("#company-form").delay(100).fadeIn(100);
 		$("#private-form").fadeOut(100);
		$('#private-form-link').removeClass('active');
		$(this).addClass('active');
		console.log("bb");
		e.preventDefault();
	});
});