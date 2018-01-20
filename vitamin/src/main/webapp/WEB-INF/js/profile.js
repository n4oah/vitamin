$(function() {
	let tags = $('.profile-image');
	var url = getContextPath() + '/mypage/myProfile.do';

	for(let tag of tags) {
		let accountNo = $(tag).attr('attr');

		if(accountNo != '' || accountNo != null || accountNo != undefined) {
			var data = {'accountNo': accountNo};
			
			if($(tag).hasClass('company-logo')) {
				data = {'memberType': 2, 'no': accountNo};
			} else if($(tag).hasClass('member-profile')) {
				data = {'memberType': 1, 'no': accountNo};
			}
				
			$.ajax({
				url: url,
				data: data,
				success: function(fileNo) {
					if(fileNo != -1) {
						url = getContextPath() + '/common/fileDown.do?fileNo=' + fileNo;
						makeProfile(tag, url);
					} else {
						makeProfile(tag);
					}
				},
				fail: function() {
					makeProfile(tag);
				}
			})
		}
	}
});
function makeProfile(tag, url = -1) {
	let type = 1;
	if($(tag).hasClass('company-logo')) {
		type = 2;
	} else if($(tag).hasClass('member-profile')) {
		type = 1;
	}
	
	if(type == 1) {
		src = getContextPath() + '/image/profile/profile-img.png';
	} else if(type == 2) {
		src = getContextPath() + '/image/profile/logo-image.jpg';
	}
	
	if(url == -1) {
		if(tag.tagName == 'IMG') {
			$(tag).attr('src', src);
		} else {
			$(tag).css('background-image', 'url(' + src + ')');
			$(tag).css('background-size', '100% 100%');
		}
	} else {
		if(tag.tagName == 'IMG') {
			$(tag).attr('src', url);
		} else {
			$(tag).css('background-image', 'url(' + url + ')');
			$(tag).css('background-size', '100% 100%');
		}
	}
}