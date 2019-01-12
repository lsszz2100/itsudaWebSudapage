<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<c:if test="${login eq 'FAIL'}">
	<script>
		alert("로그인 실패하였습니다.");
		$("#loginModal").modal();
	</script>
</c:if>
<c:if test="${login eq 'SUCCESS'}">
	<script>
		alert("로그인 성공하였습니다.");
	</script>
</c:if>
<c:if test="${registered eq 'TRUE'}">
	<script>
	alert("회원가입이 완료되었습니다.");
	</script>
</c:if>
<script>
	function login(){
		// checkBox 값 전달 (hidden tag 이용)
		var checked = $('#loginAutoBox').is(":checked");
		if(checked == true){
			$("#loginAuto").value = 'Y';
		}
		else{
			$("#loginAuto").value = 'N';
		}
	}
</script>
<!-- Modal -->

	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<!-- <button type="button" class="close" data-dismiss="modal" style="z-index:99; position:absolute; top:10px; right:20px;">&times;</button> -->
			<div class="modal-body" style="padding:40px 50px;">
				<form role="form" action="/itsuda/member/login" method="post">
					 <div class="form-group">
					 	<label for="email">이메일</label>
					 	<input type="email" class="form-control" id="email" name="email" placeholder="이메일주소를 입력해주세요" value="hjo0045@naver.com">
					 </div>
					 <div class="form-group">
					 	<label for="password">비밀번호</label>
					 	<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="ItSuda2018@!">
					 </div>
					 <div class="checkbox">
					 	<label><input type="checkbox" id="loginAutoBox" name="loginAutoBox" >로그인 상태 유지</label>
					 	<input type="hidden" id="loginAuto" name="loginAuto" value="N">
					 </div>
					 <div class="form-group row" style="margin-left:0; margin-right:0;">
					 	<button type="submit" class="col-xs-12 btn btn-success" onclick="login()">로그인&nbsp;<i class="fa fa-check spaceLeft"></i></button>
					</div>
					<p>회원가입이 되어 있지 않으신가요? <a href="/itsuda/member/registerForm">회원가입 하러가기</a></p>
					<p>비밀번호를 잊어버리셨나요? <a href="/itsuda/member/findPasswd">비밀번호 찾기</a></p>
				</form>
			</div>
		</div>      
</div>