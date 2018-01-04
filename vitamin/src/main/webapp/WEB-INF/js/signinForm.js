$(function() {
	$("#signin-btn").click((event) => {
		$("#signin-form").submit();
	});
	
	$("#signin-form").submit(function(event) {
		
	});
	
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

