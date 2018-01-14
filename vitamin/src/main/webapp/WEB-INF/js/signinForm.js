$(function() {
	$("#signin-btn").click((event) => {
		$("#signin-form").submit();
	});
	
	$("#signin-form").submit(function(event) {
		
	});
	
	let signupBtns = $('div.signup-btn-wrapper > input');
	for(let btn of signupBtns) {
		$(btn).click(function(event) {
			let src = $(btn).attr('src');
			console.log(src);
			
			location.href = src;
			
			event.preventDefault();
		});
	}
	
	$("#auto-signin").change(function() {
		if($("#auto-signin").is(":checked") == true) {
			$("#id-save").attr("checked", true);
			$("#id-save").attr('disabled', true);  
		} else {
			$("#id-save").attr("checked", false);
			$("#id-save").attr('disabled', false);  
		}
	});
});

