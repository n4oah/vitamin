$(function () {
	var html = "";
	html += '  <div class="calendar-nav">'; 
	html += '    <div class="calendar-nav-left">'; 

	html += '    </div>'; 
	html += '    <div class="data-header"></div>'; 
	html += '    <div class="calendar-nav-right">'; 
	html += '    </div>'; 
	html += '  </div>'; 
	html += '  <div class="calendar-container">'; 
	html += '    <div class="calendar-header"></div>'; 
	html += '    <div class="calendar-body"></div>'; 	
	/*
	html += '    <div class="calendar-body">'; 
	html += '      <div class="calendar-date is-disabled"><button class="date-item">26</button></div>'; 
	html += '      <div class="calendar-date is-disabled"><button class="date-item">27</button></div>'; 
	html += '      <div class="calendar-date is-disabled"><button class="date-item">28</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">1</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">2</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">3</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item is-today">4</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item" disabled="">5</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">6</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">7</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item badge">8</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">9</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">10</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">11</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">12</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">13</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">14</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">15</button></div>'; 
	html += '      <div class="calendar-date calendar-range range-start"><button class="date-item is-active">16</button></div>'; 
	html += '      <div class="calendar-date calendar-range"><button class="date-item">17</button></div>'; 
	html += '      <div class="calendar-date calendar-range"><button class="date-item">18</button></div>'; 
	html += '      <div class="calendar-date calendar-range"><button class="date-item">19</button></div>'; 
	html += '      <div class="calendar-date calendar-range range-end"><button class="date-item is-active">20</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">21</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">22</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">23</button></div>';
	html += '      <div class="calendar-date"><button class="date-item">24</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">25</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">26</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">27</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">28</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">29</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">30</button></div>'; 
	html += '      <div class="calendar-date"><button class="date-item">31</button></div>'; 
	html += '      <div class="calendar-date is-disabled"><button class="date-item">1</button></div>'; 
	html += '    </div>'; 
	*/
	html += '  </div>'; 
	
	var d = new Date();
	var today = d.getDate();
	
	
	var recruitDateStart = $('span.recruit_date_start').text();
	var recruitDateEnd = $('span.recruit_date_end').text();
	
	console.log(recruitDateStart);
	console.log(recruitDateEnd);
	
	var recruitDateStartYear = parseInt(recruitDateStart.split("-")[0]);
	var recruitDateStartMonth = parseInt(recruitDateStart.split("-")[1]);
	var recruitDateStartDay = parseInt(recruitDateStart.split("-")[2]);
	
	
	var recruitDateEndYear = parseInt(recruitDateEnd.split("-")[0]);
	var recruitDateEndMonth = parseInt(recruitDateEnd.split("-")[1]);
	var recruitDateEndDay = parseInt(recruitDateEnd.split("-")[2]);
	
	
	$('div.calendar').html(html);
	$('.data-header').text(d.getFullYear()+"년 " + (d.getMonth() + 1) + "월 ");
	
	var dayArr=["일","월","화","수","목","금","토"];
	var dayHtml = "";
	for(var i = 0; i<dayArr.length; i++) {
		dayHtml+='<div class="calendar-date">'+dayArr[i]+'</div>'
	}
	$('.calendar-header').html(dayHtml);
	
	var d = new Date(d.getFullYear(), d.getMonth(), 1);
	console.log(d.getDay())
	var lastDay = new Date(d.getFullYear(), d.getMonth(), 0).getDate();
	console.log(lastDay);
	var dateHtml = "";
	var arr = [];
	for (var i = 0; i < 42; i++) {
		if (i >= d.getDay() && i <= lastDay) arr.push(i);
		else arr.push("");
		if (today == i ) {
			dateHtml += '      <div class="calendar-date"><button class="date-item is-today">'+arr[i]+'</button></div>'
		}
		else if (recruitDateStartDay == i ) {
			dateHtml += '      <div class="calendar-date calendar-range range-start"><button class="date-item is-active">'+arr[i]+'</button></div>';
		}
		else if (recruitDateEndDay == i ) {
			dateHtml += '      <div class="calendar-date calendar-range range-end"><button class="date-item is-active">'+arr[i]+'</button></div>';
		}
		else if (recruitDateStartDay < i && recruitDateEndDay > i) {
			dateHtml += '      <div class="calendar-date calendar-range"><button class="date-item">'+arr[i]+'</button></div>'; 
		}
		else {
			dateHtml += '      <div class="calendar-date"><button class="date-item">'+arr[i]+'</button></div>'
		}
	}
	
	$('.calendar-body').html(dateHtml);
	
	
	//-------------- apply -------------//
	var checked = false;

	$('.apply_btn').click(function(event) {
		let recruitNo = $(this).attr('attr');
		let modal = $('#apply-modal');

		waitingDialog.show();

		if(checked == false) {
			let url = getContextPath() + '/recruitApply/getData.do';
			$.ajax({
				url: url,
				success: function(data) {
					waitingDialog.hide();

					data = JSON.parse(data);

					let introList = data['introductionList'];
					let resumeList = data['resumeBaseInfoList'];

					if(introList.length <= 0 || resumeList <= 0) {
						alert('자기소개서나 이력서는 최소 한 개 이상씩 등록되 있어야 합니다. (공개설정)');
					} else {
						let introOpt = modal.find('select[name="introductionNo"]');
						let resumeOpt = modal.find('select[name="resumeNo"]');
						let recruitInp = modal.find('input[name="recruitNo"]');

						for(let resume of resumeList)
							resumeOpt.append(`<option value="${resume['resumeNo']}">${resume['resumeTitle']}</option>`);
						for(let intro of introList) {
							introOpt.append(`<option value="${intro['introductionNo']}">${intro['introductionTitle']}</option>`);
						}
						console.log(recruitInp, recruitNo);
						recruitInp.val(recruitNo);

						$(".selectpicker").selectpicker('refresh');

						showModal(modal);
					}
					checked = true;
				}
			});
		}
		event.preventDefault();
	});

	$('#apply-modal-form').submit(function(event) {
		let data = $(this).serialize();
		let url = getContextPath() + '/recruitApply/apply.do';

		let modal = $('#apply-modal');

		waitingDialog.show();

		$.ajax({
			data: data,
			url: url,
			success: function(chk) {
				waitingDialog.hide();

				chk = (chk == 'true');
				
				if(chk == false) {
					alert('이미 지원한 공고입니다.');
				} else {
					alert('공고 지원이 완료되었습니다.');
				}
				
				hideModal(modal);
				
				if (chk)
					location.href = "http://192.168.0.146:3030/?memberNo="+no+"&password="+pwd+"&mno="+mno;
			}
		});

		event.preventDefault();
	});
	/*
	$('#apply-modal').on('hidden.bs.modal', function (event) {
		hideModal($(this));
		console.log('baab')
	});*/
});