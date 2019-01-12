<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<c:if test="${status eq 'SUCCESS'}">
<script>
alert("비밀번호 변경이 완료되었습니다.");
</script>
</c:if>
<c:if test="${status eq 'FAIL'}">
<script>
alert("비밀번호 변경이 실패하였습니다. 입력하신 정보를 다시 확인해주시기 바랍니다.");
</script>
</c:if>
<div class="container">
<form action="modifyMember" method="post" onsubmit="return newPwdCheck()">
<div class="form-group row">
  	<label class="col-md-2 control-label" for="inputEmail">이메일</label>
	<div class="col-md-10">
	  <input class="form-control" id="inputEmail" name="email" type="email" placeholder="${info.email}" disabled>
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputPassword">현재 비밀번호</label>
	<div class="col-md-10">
		<input class="form-control" id="oldPassword" name="oldPassword" type="password" placeholder="비밀번호">
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputPassword">새로운 비밀번호</label>
	<div class="col-md-10">
		<input class="form-control" id="newPassword" name="newPassword" type="password" 
		placeholder="새로운 비밀번호" onchange="pwdCheck()" value="">
		<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputPasswordCheck">새로운 비밀번호 확인</label>
	<div class="col-md-10">
	 <input class="form-control" id="newPasswordCheck" name="newPasswordCheck" type="password" 
	 placeholder="새로운 비밀번호 확인" onchange="pwdCheck()" value="">
	 <span id="passwordCheck">&nbsp;</span>
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputName">이름</label>
	<div class="col-md-10">
	  <input class="form-control" id="inputName" type="text" placeholder="${info.name}" disabled>
	</div>
</div>
<div class="form-group row" style="margin-left:0; margin-right:0;">
   <button type="submit" class="col-xs-6 btn btn-success">
   	적용&nbsp;<i class="fa fa-check spaceLeft"></i>
   </button>
   <button type="button" class="col-xs-6 btn btn-default">
   	취소&nbsp;<i class="fa fa-times spaceLeft"></i>
   </button>
</div>
</form>
</div>