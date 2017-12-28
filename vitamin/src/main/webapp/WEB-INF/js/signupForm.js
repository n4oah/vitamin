$(function() {
	var ptn = [];
	
	let privatePtn = [];
	privatePtn.push(new Pattern($("#signup_id"), /^[a-z0-9]{4,12}$/, "아이디는 4~12자 소문자 영문과 숫자를 조합해서만 사용 가능합니다."));
	privatePtn.push(new Pattern($("#signup_pwd"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", 1));
	privatePtn.push(new Pattern($("#signup_pwd_chk"), /^[A-Za-z0-9]{6,12}$/, "비밀번호는 6~12자 영문과 숫자를 조합해서만 사용 가능합니다.", 1));
	privatePtn.push(new Pattern($("#signup_name"), /^[a-z0-9가-힣]{1,10}$/, "이름은 1~10자 까지 가능합니다."));
	privatePtn.push(new Pattern($("#signup_email1"), /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i, "이메일 주소를 확인하세요."));
	privatePtn.push(new Pattern($("#signup_email2"), /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i, "도메인 주소를 확인하세요."));
	privatePtn.push(new Pattern($("#signup_phoneNumber"), /^[+82]{3} [(0-9)]{5} [0-9]{4}-[0-9]{4}$/, "핸드폰 번호를 입력해주세요."));
	privatePtn.push(new Pattern($("#birthDate"), /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/, "생일을 입력해주세요."));
	privatePtn.push(new Pattern($("#sample6_postcode"), /^[0-9]{1,}$/, "우편 번호를 확인해주세요."));
	privatePtn.push(new Pattern($("#sample6_address"), /^().+$/, "주소를 확인해주세요."));
	privatePtn.push(new Pattern($("#sample6_address2"),  /^().+$/, "상세주소를 확인해주세요."));
	
	let companyPtn = [];
	// companyPtn.push();
	
	ptn = privatePtn;
	
    $('#private-form-link').click(function(e) {
		$("#private-form").delay(100).fadeIn(100);
 		$("#company-form").fadeOut(100);
		$('#company-form-link').removeClass('active');
		$(this).addClass('active');
		ptn = privatePtn;
		e.preventDefault();
	});
	$('#company-form-link').click(function(e) {
		$("#company-form").delay(100).fadeIn(100);
 		$("#private-form").fadeOut(100);
		$('#private-form-link').removeClass('active');
		$(this).addClass('active');
		ptn = companyPtn;
		e.preventDefault();
	});
	
	let $signForm = $('form.sign-form .submit');
	for(let i = 0; i < $signForm.length; i++) {
		$($signForm[i]).click({form: $signForm.closest('form')}, signClick);
	}
	
	$("company-form").submit((e) => {
		let ptn = [];
		
		
		try {
			bool = matches(ptn);
		} catch (err) {
			e.preventDefault();
			return;
		}
		
		
	});

	$("#private-form").submit((e) => {
		try {
			bool = matches(ptn);
		} catch (err) {
			err['ptn'].id.focus();
			alert(err['msg']);
			e.preventDefault();
			return;
		}
		
		if($('#terms-check').is(':checked') == false) {
			alert('약관을 동의해주세요.');
			e.preventDefault();
		}
	});
	
	$('input.form-control').on('input', function() {
		for(let i = 0; i < ptn.length; i++) {
			if(ptn[i].id[0] == $(this)[0]) {
				if(ptn[i].matches() == false) {
					createLabel(ptn[i].id, ptn[i].msg, {'color': 'red'});
				} else {
					deleteLabel(ptn[i].id);
				}
				break;
			}
		}
	});
});

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

function matches(ptn) {
	let overlap = new Set();
	
	for(let i = 0; i < ptn.length; i ++) {
		if(ptn[i].matches() == false) {
			throw {'ptn':ptn[i], 'code': 1, 'msg': ptn[i].msg};
		}
	}
	for(let i = 0; i < ptn.length; i ++) {
		if(ptn[i].sameNo != -1) {
			if(overlap.has(ptn[i].sameNo) == false) {
				for(let l = 0; l < ptn.length; l++) {
					if(ptn[i].sameNo == ptn[l].sameNo) {
						ptn[l].id.focus();
						throw {'ptn':ptn[l], 'code': 2, 'msg': '비밀번호가 서로 같지 않습니다.'};
					}
				}
			}
		}
	}
}

function Pattern(id, pettern, msg, sameNo = -1) {
	this.id = id;
	this.pettern = pettern;
	this.msg = msg;
	this.sameNo = sameNo;
	
	this.matches = function() {
		return this.pettern.test(this.id.val());
	};
};

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