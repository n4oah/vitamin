$(document).ready(function(){ 
	var max = 500;
    $('#characterLeft').text(max + '자 남음');
    $('#message').keydown(function () {
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('더 이상 글을 쓸 수 없습니다.');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');            
        } 
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + '자 남음');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');            
        }
    });    
});
