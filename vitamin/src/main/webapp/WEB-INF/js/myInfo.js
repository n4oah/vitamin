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
    	waitingDialog.show();
    	
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
            	if(chk == true) {
            		alert('쪽지를 성공적으로 보냈습니다.');
            	} else if(chk == false) {
            		alert('존재하지 않는 아이디 입니다.');
            	}
                waitingDialog.hide();
                $('#largeModal').modal('hide');
            },
        	fail: function() {
        		alert('서버 에러');
        		waitingDialog.hide();
        		$('#largeModal').modal('hide');
        	}
        });

        event.preventDefault();
    });

    $('form#myInfoModify #email').click(function(event) {
        $('#email-change-modal').modal('show');

        event.preventDefault();
    });

    var $changeForm = $('#email-change-input');
    var $authForm = $('#email-change-auth');
    var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    $('#login_lost_btn').click( function () { modalAnimate($changeForm, $authForm); });
    $('#lost_login_btn').click( function () { modalAnimate($authForm, $changeForm); });

    $('#email-change-input').submit(function(event) {
        waitingDialog.show();

        var param = $('#email-change-input').serialize();

        $.ajax({
            url: $('#email-change-input').attr('action'),
            dataType: "json",
            data: param,
            success: function() {
                modalAnimate($changeForm, $authForm);
                waitingDialog.hide();
            }
        });

        event.preventDefault();
    });

    $('#email-change-auth').submit(function(event) {
        waitingDialog.show();

        var param = $('#email-change-auth').serialize();

        $.ajax({
            url: $('#email-change-auth').attr('action'),
            dataType: "json",
            data: param,
            success: function(email) {
                console.log(email);
                $('email').val(email);
                waitingDialog.hide();
            }
        });

        event.preventDefault();
    });
    
    function modalAnimate ($oldForm, $newForm) {
        var $oldH = $oldForm.height();
        var $newH = $newForm.height();
        $divForms.css("height",$oldH);
        $oldForm.fadeToggle($modalAnimateTime, function(){
            $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                $newForm.fadeToggle($modalAnimateTime);
            });
        });
    }
    
    function msgFade ($msgId, $msgText) {
        $msgId.fadeOut($msgAnimateTime, function() {
            $(this).text($msgText).fadeIn($msgAnimateTime);
        });
    }
    
    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function() {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
  		}, $msgShowTime);
    }
});