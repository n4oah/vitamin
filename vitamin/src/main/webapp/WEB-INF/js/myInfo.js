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

$(function() {
    var ptn = new Array();
    ptn.push(new Pattern($('#id'), /^[a-z0-9]{4,12}$/, '아이디는 4~12자 소문자 영문과 숫자를 조합해서만 사용 가능합니다.'));
    ptn.push(new Pattern($('#title'), /^\w{1,50}$/, '제목은 1~50자 사이로 적을 수 있습니다.'));
    ptn.push(new Pattern($('#content'), /^\w{1,500}$/, '내용은 1~500자 사이로 적을 수 있습니다.'));

    $('#letter-submit').on('click', function(event) {
        for(let i = 0; i < ptn.length; i++) {
            if(ptn[i].matches() == false) {
                alert(ptn[i].msg);
                ptn[i].id.focus();
                return;
            }
        }

        var param = $('#letter-form').serialize();

        $.ajax({
            url: $('#letter-form').attr('action'),
            dataType: "json",
            data: param,
            success: function(chk) {
                console.log(chk);
            }
        });
        

        /*$.ajax({
            type='POST',

        });*/

        event.preventDefault();
    });
});