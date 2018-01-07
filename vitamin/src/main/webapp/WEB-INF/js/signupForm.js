var idOverlapChk = false;
var signupFormChk = true;

$(function() {
	var ptn = [];
	
	let privatePtn = [];
	privatePtn.push(new Pattern($("#private-input-id"), /^[a-z0-9]{4,12}$/, "아이디는 4~12자 소문자 영문과 숫자를 조합해서만 사용 가능합니다."));
	privatePtn.push(new Pattern($("#private-input-pwd"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", {'code':1, 'target':true, 'msg': '비밀번호가 서로 같지 않습니다.'}));
	privatePtn.push(new Pattern($("#private-input-pwd_chk"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", {"code":1, "target":false}));
	privatePtn.push(new Pattern($("#private-input-name"), /^[a-z0-9가-힣]{1,10}$/, "이름은 1~10자 까지 가능합니다."));
	privatePtn.push(new Pattern($("#private-input-email1"), /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i, "이메일 주소를 확인하세요."));
	privatePtn.push(new Pattern($("#private-input-email2"), /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i, "도메인 주소를 확인하세요."));
	privatePtn.push(new Pattern($("#private-input-phoneNumber"), /^[+82]{3} [(0-9)]{5} [0-9]{4}-[0-9]{4}$/, "핸드폰 번호를 입력해주세요."));
	privatePtn.push(new Pattern($("#birthDate"), /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/, "생일을 입력해주세요."));
	privatePtn.push(new Pattern($("#private-form input[name='address.postCode']"), /^[0-9]{1,}$/, "우편 번호를 확인해주세요."));
	privatePtn.push(new Pattern($("#private-form input[name='address.address1']"), /^().+$/, "주소를 확인해주세요."));
	privatePtn.push(new Pattern($("#private-form input[name='address.address2']"),  /^().+$/, "상세주소를 확인해주세요."));
	privatePtn.push(new Pattern($("#private-form input[name='address.sigunguCode']"),  /^().+$/, "주소를 확인해주세요."));
	
	let companyPtn = [];
	companyPtn.push(new Pattern($("#company-input-id"), /^[a-z0-9]{4,12}$/, "아이디는 4~12자 소문자 영문과 숫자를 조합해서만 사용 가능합니다."));
	companyPtn.push(new Pattern($("#company-input-pwd"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", {'code':1, 'target':true, 'msg': '비밀번호가 서로 같지 않습니다.'}));
	companyPtn.push(new Pattern($("#company-input-pwd_chk"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", {"code":1, "target":false}));
	companyPtn.push(new Pattern($("#company-input-companyName"), /^[a-z0-9가-힣]{1,20}$/, "기업 이름은 1~20자 까지 가능합니다."));
	companyPtn.push(new Pattern($("#company-input-bossName"), /^[a-z0-9가-힣]{1,10}$/, "대표자 이름은 1~20자 까지 가능합니다."));
	companyPtn.push(new Pattern($("#company-input-licenseNumber"), /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/, "사업자 등록 번호를 확인해주세요."));
	companyPtn.push(new Pattern($("#company-input-employeeCount"), /^[0-9]{1,6}$/, "사원수를 확인해 주세요."));
	companyPtn.push(new Pattern($("#company-input-buildupDate"), /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/, "설립일을 확인해주세요."));
	companyPtn.push(new Pattern($("#company-input-businessContent"), /^().+$/, "사업 내용을 확인해주세요."));
	companyPtn.push(new Pattern($("#company-input-phoneNumber"), /^[+82]{3} [(0-9)]{5} [0-9]{4}-[0-9]{4}$/, "대표 전화를 확인해주세요."));
	companyPtn.push(new Pattern($("#company-form input[name='address.postCode']"), /^[0-9]{1,}$/, "우편 번호를 확인해주세요."));
	companyPtn.push(new Pattern($("#company-form input[name='address.address1']"), /^().+$/, "주소를 확인해주세요."));
	companyPtn.push(new Pattern($("#company-form input[name='address.address2']"),  /^().+$/, "상세주소를 확인해주세요."));
	companyPtn.push(new Pattern($("#company-form input[name='address.sigunguCode']"),  /^().+$/, "주소를 확인해주세요."));

	ptn = privatePtn;
	
    $('#private-form-link').click(function(e) {
    	$("#private-form").delay(100).fadeIn(100);
 		$("#company-form").fadeOut(100);
		$('#company-form-link').removeClass('active');
		$(this).addClass('active');
		ptn = privatePtn;
		signupFormChk = true;
		e.preventDefault();
	});
	$('#company-form-link').click(function(e) {
		$("#company-form").delay(100).fadeIn(100);
 		$("#private-form").fadeOut(100);
		$('#private-form-link').removeClass('active');
		$(this).addClass('active');
		ptn = companyPtn;
		signupFormChk = false;
		e.preventDefault();
	});
	
	let $signForm = $('form.sign-form .submit');
	for(let i = 0; i < $signForm.length; i++) {
		console.log($($signForm[i]).closest('form.sign-form'));
		$($signForm[i]).click({form: $($signForm[i]).closest('form.sign-form')}, signClick);
	}
	
	$("#company-form").submit(signupSubmit);
	$("#private-form").submit(signupSubmit);
	
	$('input.form-control').on('input', function(e) {
		for(let i = 0; i < ptn.length; i++) {
			if(ptn[i].id[0] == $(this)[0]) {
				try {
					matches(ptn, ptn[i]);
					deleteLabel(ptn[i].id);
				} catch (err) {
					err['ptn'].id.focus();
					createLabel(err.ptn.id, err.msg, {'color': 'red'});
					e.preventDefault();
				}
				break;
			}
		}
	});
	
	function signupSubmit(e) {
		try {
			if(idOverlapChk == true)
				return;
			
			matches(ptn);
			
			let $terms = $('.terms-check');
			for(let i = 0; i < $terms.length; i++) {
				if($($terms[i]).is(':checked') == false) {
					alert('약관을 동의해주세요.');
					e.preventDefault();
					break;
				}
			}
		} catch (err) {
			console.log(err);
			err['ptn'].id.focus();
			alert(err['msg']);
			e.preventDefault();
			return;
		}
	}
	
	//=====================================================================================//
	/*
	const MAX_COUNT = 1;
	
	let array = new Array();
	
	$('#hope_bussiness').click(function(event){
		$("#myModal").modal("show");
	});

	$('div#myModal input.selectedBusiness').change(function(event) {
		if($(this).is(':checked') == true) {
            if(array.length >= MAX_COUNT) {
                $(this).attr('checked', false);
                alert(`직종은 ${MAX_COUNT}개 까지만 선택 가능합니다.`);
                event.preventDefault();
                return;
            }

            let no = $(this).val();
            let content = $(this).parent('label').find('span.content').text();
            //let category = $(this).closest('tr').find('th').text();

            let map = new Map();
            map.set('no', no);
            map.set('content', content);
            //map.set('category', category);
            
			array.push(map);
		} else if($(this).is(':checked') == false) {
            let no = $(this).val();
            let content = $(this).parent('label').find('span.content').text();
            //let category = $(this).parent('tr').find('th').text();

            for(let i = 0; i < array.length; i++) {
                if(array[i].get('no') == no) {
                    array.splice(i, 1);
                }
            }
		}
	});
	
	$('#myModal').on('hide.bs.modal', function (event) {
        let str = '',
            strNo = '';

        for(let map of array) {
            str += `${map.get('content')}`;
            strNo += `${map.get('no')}`;
        }

        $('#hope_bussiness').val(str);
        $('#hope_bussiness_no').val(strNo)
	});
	*/
	//=====================================================================================//
	$('#private-input-id').blur(function() {
		idOverlapChk = false;
		idOverlapCheck(this);
	});
	$('#company-input-id').blur(function() {
		idOverlapChk = false;
		idOverlapCheck(this);
	});
});

function setIdOverlapChk(chk) {
	idOverlapChk = chk;
}

function matches(ptn, tPtn) {
	let overlap = new Set();
	let tempPtn = ptn;
	if(tPtn != undefined) {
		ptn = new Array(tPtn);
	}
	
	for(let i = 0; i < ptn.length; i ++) {
		if(ptn[i].matches() == false) {
			throw {'ptn':ptn[i], 'code': 1, 'msg': ptn[i].msg};
		}
	}
	
	try {
		Pattern.searchTarget(tempPtn, tPtn);
	} catch (e) {
		throw e;
	}
}

class Pattern {
	constructor(id, pettern, msg, sameCheck = -1)
	{
		this.id = id;
		this.pettern = pettern;
		this.msg = msg;
		this.sameCheck = sameCheck;
	}
	
	matches() {
		return this.pettern.test(this.id.val());
	};
	
	static searchTarget(ptns, iPtn) {
		let ptnEx = new Array();
		let cPtnEx = new Array();
		
		if(iPtn != undefined) {
			cPtnEx.push(iPtn);
		}
		
		for(let i = 0; i < ptns.length; i++) {
			if(ptns[i].sameCheck != -1) {
				ptnEx.push(ptns[i]);
			}
		}
		if(cPtnEx.length == 0) { cPtnEx = ptnEx; }
		
		for(let tPtn of ptnEx) {
			if(tPtn.sameCheck.target == true) {
				let code = tPtn.sameCheck.code;
				
				for(let cPtn of cPtnEx) {
					if(cPtn.sameCheck.code == tPtn.sameCheck.code) {
						if(cPtn.sameCheck.target == false) {
							if(cPtn.id.val() != tPtn.id.val()) {
								throw {'ptn':cPtn, 'code': 2, 'msg': tPtn.sameCheck.msg};
							}
						}
					}
				}
			}
		}
	};
};

function createLabel(formInput, str, css) {
	let $label = $(formInput).parent().find('label.hint');
	
	if($label.length > 0) {
		$($label).text(str);
		$($label).css(css);
	} else {
		$(formInput).after('<label for=\'id\' class=\'hint\'>' + str + '</label>');
		$(formInput).next().css(css);
	}
}

function deleteLabel(formInput) {
	let $label = $(formInput).parent().find('label.hint');
	
	if($label.length > 0) {
		$label.remove();
	}
}

function signClick(e) {
	let url = $(e.data.form).attr('action');
	console.log(url);
	parm = url.split('?', 2);
	switch(parm[1]) {
		case 'memberType=1': {
			$("#private-form").submit();
			break;
		}
		case 'memberType=2': {
			$("#company-form").submit();
			break;
		}
	}
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullAddr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;

            } else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            
            let formId;
            if(signupFormChk == true) {
            	formId = 'private-form';
            } else if(signupFormChk == false) {
            	formId = 'company-form';            	
            }
            $("#" + formId + " input[name='address.postCode']").val(data.zonecode);
        	$("#" + formId + " input[name='address.address1']").val(fullAddr);
        	$("#" + formId + " input[name='address.address2']").focus();
        	$("#" + formId + " input[name='address.sigunguCode']").val(data.sigunguCode);
        }
    }).open();
}

(function (root, factory) {
    if (typeof define === "function" && define.amd) {
        define(factory);
    } else if (typeof exports === "object") {
        module.exports = factory();
    } else {
        root.ResizeSensor = factory();
    }
}(typeof window !== 'undefined' ? window : this, function () {

    // Make sure it does not throw in a SSR (Server Side Rendering) situation
    if (typeof window === "undefined") {
        return null;
    }
    // Only used for the dirty checking, so the event callback count is limited to max 1 call per fps per sensor.
    // In combination with the event based resize sensor this saves cpu time, because the sensor is too fast and
    // would generate too many unnecessary events.
    var requestAnimationFrame = window.requestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        function (fn) {
            return window.setTimeout(fn, 20);
        };

    /**
     * Iterate over each of the provided element(s).
     *
     * @param {HTMLElement|HTMLElement[]} elements
     * @param {Function}                  callback
     */
    function forEachElement(elements, callback){
        var elementsType = Object.prototype.toString.call(elements);
        var isCollectionTyped = ('[object Array]' === elementsType
            || ('[object NodeList]' === elementsType)
            || ('[object HTMLCollection]' === elementsType)
            || ('[object Object]' === elementsType)
            || ('undefined' !== typeof jQuery && elements instanceof jQuery) //jquery
            || ('undefined' !== typeof Elements && elements instanceof Elements) //mootools
        );
        var i = 0, j = elements.length;
        if (isCollectionTyped) {
            for (; i < j; i++) {
                callback(elements[i]);
            }
        } else {
            callback(elements);
        }
    }

    /**
     * Class for dimension change detection.
     *
     * @param {Element|Element[]|Elements|jQuery} element
     * @param {Function} callback
     *
     * @constructor
     */
    var ResizeSensor = function(element, callback) {
        /**
         *
         * @constructor
         */
        function EventQueue() {
            var q = [];
            this.add = function(ev) {
                q.push(ev);
            };

            var i, j;
            this.call = function() {
                for (i = 0, j = q.length; i < j; i++) {
                    q[i].call();
                }
            };

            this.remove = function(ev) {
                var newQueue = [];
                for(i = 0, j = q.length; i < j; i++) {
                    if(q[i] !== ev) newQueue.push(q[i]);
                }
                q = newQueue;
            }

            this.length = function() {
                return q.length;
            }
        }

        /**
         *
         * @param {HTMLElement} element
         * @param {Function}    resized
         */
        function attachResizeEvent(element, resized) {
            if (!element) return;
            if (element.resizedAttached) {
                element.resizedAttached.add(resized);
                return;
            }

            element.resizedAttached = new EventQueue();
            element.resizedAttached.add(resized);

            element.resizeSensor = document.createElement('div');
            element.resizeSensor.className = 'resize-sensor';
            var style = 'position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;';
            var styleChild = 'position: absolute; left: 0; top: 0; transition: 0s;';

            element.resizeSensor.style.cssText = style;
            element.resizeSensor.innerHTML =
                '<div class="resize-sensor-expand" style="' + style + '">' +
                    '<div style="' + styleChild + '"></div>' +
                '</div>' +
                '<div class="resize-sensor-shrink" style="' + style + '">' +
                    '<div style="' + styleChild + ' width: 200%; height: 200%"></div>' +
                '</div>';
            element.appendChild(element.resizeSensor);

            if (element.resizeSensor.offsetParent !== element) {
                element.style.position = 'relative';
            }

            var expand = element.resizeSensor.childNodes[0];
            var expandChild = expand.childNodes[0];
            var shrink = element.resizeSensor.childNodes[1];
            var dirty, rafId, newWidth, newHeight;
            var lastWidth = element.offsetWidth;
            var lastHeight = element.offsetHeight;

            var reset = function() {
                expandChild.style.width = '100000px';
                expandChild.style.height = '100000px';

                expand.scrollLeft = 100000;
                expand.scrollTop = 100000;

                shrink.scrollLeft = 100000;
                shrink.scrollTop = 100000;
            };

            reset();

            var onResized = function() {
                rafId = 0;

                if (!dirty) return;

                lastWidth = newWidth;
                lastHeight = newHeight;

                if (element.resizedAttached) {
                    element.resizedAttached.call();
                }
            };

            var onScroll = function() {
                newWidth = element.offsetWidth;
                newHeight = element.offsetHeight;
                dirty = newWidth != lastWidth || newHeight != lastHeight;

                if (dirty && !rafId) {
                    rafId = requestAnimationFrame(onResized);
                }

                reset();
            };

            var addEvent = function(el, name, cb) {
                if (el.attachEvent) {
                    el.attachEvent('on' + name, cb);
                } else {
                    el.addEventListener(name, cb);
                }
            };

            addEvent(expand, 'scroll', onScroll);
            addEvent(shrink, 'scroll', onScroll);
        }

        forEachElement(element, function(elem){
            attachResizeEvent(elem, callback);
        });

        this.detach = function(ev) {
            ResizeSensor.detach(element, ev);
        };
    };

    ResizeSensor.detach = function(element, ev) {
        forEachElement(element, function(elem){
            if (!elem) return
            if(elem.resizedAttached && typeof ev == "function"){
                elem.resizedAttached.remove(ev);
                if(elem.resizedAttached.length()) return;
            }
            if (elem.resizeSensor) {
                if (elem.contains(elem.resizeSensor)) {
                    elem.removeChild(elem.resizeSensor);
                }
                delete elem.resizeSensor;
                delete elem.resizedAttached;
            }
        });
    };

    return ResizeSensor;
}));