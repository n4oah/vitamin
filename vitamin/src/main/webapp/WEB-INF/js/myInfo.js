var letters = new Array();
class Letter {
    constructor(letterNo, id, name, title, content, date) {
        this.letterNo = letterNo;
        this.id = id;
        this.name = name;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    static searchLetter(letters, letterNo) {
        for(let letter of letters) {
            if(letter.letterNo == letterNo) {
                return letter;
            }
        }
    }
}

$(document).ready(function() {
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
        console.log(param);
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

    var $changeForm = $('#email-change-input');
    var $authForm = $('#email-change-auth');
    var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    $('form#myInfoModify #email').click(function(event) {
        $('#email-change-modal').modal('show');

        var status = $authForm.css('display');
        console.log(status);
        if(status == 'block') {
            $('changeEmail').text('');
            $('authToken').text('');

            $changeForm.fadeToggle();
            $authForm.fadeToggle();
        }

        event.preventDefault();
    });

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
                if(email == 'undefined') {
                    alert('인증번호가 틀렷습니다.');
                } else {
                    console.log(email);
                    $('#email').val(email);
                }
                $('#email-change-modal').modal('hide');
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

    $("input#profileImg").on("change", function(event) {
	    let file = event.target.files[0];
        let fileName = file.name;

        console.log(file);
        console.log(fileName);

        var reader = new FileReader();
        
        reader.onload = function(e) {
            console.log(reader.result);
            console.log('#eee url(' + reader.result + ');');
            $('div.custom-input-file.profile-image').css('background-image', 'url(\'' + reader.result + '\')');
        }
        reader.readAsDataURL(this.files[0]);
    });

    $('ul.media-list').on('click', '.show-letter', function(event) {
        let parent = $(this).closest('li.media');
        let letterNo = parent.attr('attr');

        let letter = Letter.searchLetter(letters, letterNo);

        let modal = $('#letter-read-modal');

        modal.find('input[name="id"]').val(letter.id);
        modal.find('input[name="name"]').val(letter.name);
        modal.find('h3[name="title"]').text(letter.title);
        modal.find('textarea[name="content"]').val(letter.content);
        modal.find('button.show-letter-reply').attr('attr', letter.letterNo);

        modal.modal('show');
        event.preventDefault();
    });

    $('#wrapper').on('click', '.show-letter-reply', function(event) {
        let modals = $('div.modal');
        for(let mod of modals) {
            $(mod).modal('hide');
        }

        let letterNo = $(this).attr('attr');
        let modal = $('#largeModal');

        let letter = Letter.searchLetter(letters, letterNo);

        modal.find('input[name="id"]').val(letter.id);
        modal.find('input[name="title"]').focus();

        modal.modal('show');
        event.preventDefault();
    });

    $('#largeModal').on('hidden.bs.modal', function () {
        $('#largeModal').find('input').each(function(event) {
            $(this).val('');
        });
        $('#largeModal').find('textarea').each(function(event) {
            $(this).val('');
        });
    });

    let funcMap = new Map();
    funcMap.set('recvList', recvList);
    funcMap.set('sendList', sendList);
    //funcMap.set('myRecuritList', myRecuritList);
    //funcMap.set('favoriteCompanyList', favoriteCompanyList);
    
    for(let func of funcMap.values()) {
        func();
    }
});

function recvList(lastRecvNo = -1, blankObj) {
    let url = getContextPath() + '/letter/recvLetterList.do';
    let data = {'lastLetterNo': lastRecvNo};
    
    $.ajax({
        url: url,
        data: data,
        success: function(dataList) {
            let html = '';
            let parent = $('div#letter-recv ul.media-list');

            let letterList = JSON.parse(dataList);

            if(blankObj != undefined) {
                $(blankObj).children().each(function() {
                    $(this).remove();
                });
            }

            for(let data of letterList) {
                html = '';

                let profileNo = data['profileNo'];
                let name = data['name'];
                let id = data['id'];
                let letter = data['letter'];

                let date = new Date(letter['sendDate']);
                
                letters.push(new Letter(letter['letterNo'], id, name, letter['title'], letter['content'], date));

                html = letterForm(profileNo, id, letter['letterNo'], name, letter['title'], date);
                parent.append(html);
            }
        }
    });
}

function sendList(lastSendNo = -1, blankChk = false) {
    let url = getContextPath() + '/letter/sendLetterList.do';
    let data = {'lastLetterNo': lastSendNo};
    
    $.ajax({
        url: url,
        data: data,
        success: function(dataList) {
            let html = '';
            let parent = $('div#letter-send ul.media-list');

            let letterList = JSON.parse(dataList);

            for(let data of letterList) {
                html = '';

                let profileNo = data['profileNo'];
                let name = data['name'];
                let id = data['id'];
                let letter = data['letter'];

                let date = new Date(letter['sendDate']);

                letters.push(new Letter(letter['letterNo'], id, name, letter['title'], letter['content'], date));

                html = letterForm(profileNo, id, letter['letterNo'], name, letter['title'], date);
                parent.append(html);
            }
        }
    });
}

function myRecuritList() {
    let url = getContextPath() + '/mypage/myRecuritList.do';
}

function favoriteCompanyList() {

}

function myRecuritForm() {

}

function favoriteCompanyForm() {
    
}

function letterForm(profileNo, id, letterNo, name, title, date) {
    let html = '';

    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    
    html += `<li class="media" attr="${letterNo}">`;
    html += `   <a id="profile-img-full" class="pull-left">`;
    html += `       <img class="media-object img-circle" src="/vitamin/common/fileDown.do?fileNo=${profileNo}" alt="profile">`;
    html += `   </a>`;
    html += `   <div class="media-body">`;
    html += `       <div class="well well-lg">`;
    html += `           <h4 class="media-heading text-uppercase reviews">${name}</h4>`;
    html += `           <ul class="media-date text-uppercase reviews list-inline">`;
    html += `               <li class="aaaa">${year}</li>`;
    html += `               <li class="mm">${month}</li>`;
    html += `               <li class="dd">${day}</li>`;
    html += `           </ul>`;
    html += `           <p class="media-title">`;
    html += `               ${title}`;
    html += `           </p>`;
    html += `           <a class="btn btn-info btn-circle text-uppercase show-letter">`;
    html += `               <span class="glyphicon glyphicon-ok"></span> 확인</a>`;
    html += `           <a class="btn btn-warning btn-circle text-uppercase show-letter-reply" attr="${letterNo}">`;
    html += `               <span class="glyphicon glyphicon-share-alt"></span> 답장</a>`;
    html += `       </div>`;
    html += `   </div>`;
    html += `</li>`;
    return html;
}