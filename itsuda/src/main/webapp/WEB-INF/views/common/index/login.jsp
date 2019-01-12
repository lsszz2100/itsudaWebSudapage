<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/common/include/directives.jsp"%>
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Pragma","no-cache");
	response.setHeader("ExPires","0");
%>
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
<style type="text/css">
	.login-grid{ width: 100%; height: 100%; }
	.login-grid-img{ width: 30%; height: 100%; min-width: 330px; min-height: 330px;}
	.login-grid-form{ width: 70%; height: 100%; min-width: 330px; min-height: 330px;}
</style>

<div class="container login-grid">
	<div class="row">
		<!-- 추후 아이콘으로 변경 -->
	    <div class="col-4 login-grid-img" style="background-color: red"></div>
	    <div class="col-8 login-grid-form">
			<div class="modal-content">
		<div class="modal-body login-form">
			<form role="form" action="/itsuda/member/login" method="post">
				 <div class="form-group">
				 	<label for="email">이메일</label>
				 	<input type="email" class="form-control" id="email" name="email" placeholder="이메일주소를 입력해주세요" value="hjo0045@naver.com"/>
				 </div>
				 <div class="form-group">
				 	<label for="password">비밀번호</label>
				 	<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" value="3373e@!jy"/>
				 </div>
				 <div class="checkbox">
				 	<label>
				 		<input type="checkbox" id="loginAutoBox" name="loginAutoBox" />로그인 상태 유지
				 	</label>
				 	<input type="hidden" id="loginAuto" name="loginAuto" value="N" />
				 </div>
				 <div class="form-group">
				 	<button type="submit" class="col-md btn btn-success" onclick="login()" style="margin-bottom: 10px;">
				 		로그인&nbsp;
				 		<i class="fa fa-check spaceLeft"></i>
				 	</button>
						</div>
					</form>
	    		</div>
			</div>
		</div>
	</div>
</div>