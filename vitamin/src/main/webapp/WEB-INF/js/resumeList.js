$(function() {
	$('#myModal').on('hide.bs.modal', function (event) {
		console.log('assa');
		$('#myModal div.modal-body').html('');
	});
});
