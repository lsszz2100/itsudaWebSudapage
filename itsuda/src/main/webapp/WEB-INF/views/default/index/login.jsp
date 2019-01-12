<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
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
<!-- Modal -->
<div class="modal-dialog">
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-body">
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
				 	<button type="submit" class="col-xs-12 btn btn-success" onclick="login()">
				 		로그인&nbsp;
				 		<i class="fa fa-check spaceLeft"></i>
				 	</button>
				 	<p style="text-align:right; margin-top:10px;">
				 		비밀번호를 잊어버리셨나요?
						<a href="/itsuda/member/findPasswd">비밀번호 찾으러 가기</a>
					</p>
				</div>
			</form>
		</div>
	</div>      
</div>