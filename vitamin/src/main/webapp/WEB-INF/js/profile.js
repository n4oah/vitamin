
$(function() {
	let tags = $('.profile-image');
	var url = getContextPath() + '/mypage/myProfile.do';

	for(let tag of tags) {
		let accountNo = $(tag).attr('attr');
		console.log('accountNo' + accountNo);

		if(accountNo != '' || accountNo != null || accountNo != undefined) {
			let data = {'accountNo': accountNo};

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
	if(url == -1) {
		$(tag).attr('class', 'glyphicon glyphicon-user icon-size ' + $(tag).attr('class'));
	} else {
		if(tag.tagName == 'IMG') {
			$(tag).attr('src', url);
		} else {
			let clzs = ['glyphicon', 'glyphicon-user', 'icon-size'];

			$(tag).css('background-image', 'url(' + url + ')');
			$(tag).css('background-size', '100% 100%');

			for(let clz of clzs) {
				$(tag).removeClass(clz);
			}
		}
	}
}