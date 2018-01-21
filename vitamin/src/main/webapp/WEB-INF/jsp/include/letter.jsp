<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	$(function() {
		$('#letter-submit').on('click', function(event) {
			waitingDialog.show();

			var param = $('#letter-form').serialize();

			$.ajax({
				url : $('#letter-form').attr('action'),
				dataType : "json",
				data : param,
				success : function(chk) {
					if (chk == true) {
						swal("SUCCESS", '쪽지를 성공적으로 보냈습니다.', "success")
						.then((value) => {
							location.reload();							
						});
					} else if (chk == false) {
						swal("error", '존재하지 않는 아이디 입니다.', "error");
					}
					waitingDialog.hide();
					$('#largeModal').modal('hide');
				},
				fail : function() {
					//alert('서버 에러');
					waitingDialog.hide();
					$('#largeModal').modal('hide');
				}
			});

			event.preventDefault();
		});
	});
	
	$(document).ready(function() {
		var max = 500;
	    $('#characterLeft').text(max + '자 남음');
	    $('#content').keydown(function () {
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
</script>

<div class="modal fade" id="largeModal" tabindex="-1" role="dialog"
	aria-labelledby="largeModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">쪽지</h4>
			</div>
			<div class="modal-body">
				<form id="letter-form" role="form" method="post"
					action="${pageContext.request.contextPath}/letter/send.do">
					<h3 style="text-align: center; font-weight: bold;">쪽지 쓰기</h3>
					<div class="form-group">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="상대방 아이디">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="제목">
					</div>
					<div class="form-group">
						<textarea class="form-control" type="textarea" id="content"
							name="content" placeholder="보낼 쪽지 내용" maxlength="500" rows="7"></textarea>
						<span class="help-block">
							<p id="characterLeft" class="help-block "></p>
						</span>
					</div>
					<!-- <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button> -->
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" id="letter-submit" class="btn btn-primary">쪽지
					보내기</button>
			</div>
		</div>
	</div>
</div>