<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="fr"%>

<div class="container">
<c:if test="${registered eq 'TRUE'}">
	<script>
		alert("가입 완료되었습니다.");
	</script>
</c:if>
<fr:form action="registerForm" method="post" commandName="vo">
<div class="form-group row">
  	<label class="col-md-2 control-label" for="email">이메일</label>
	<div class="col-md-10">
		<fr:input class="form-control" path="email" id="email" placeholder="이메일"/>
		<fr:errors path="email" />
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="password">비밀번호</label>
	<div class="col-md-10">
		<fr:input type="password" class="form-control" path="password" id="password" placeholder="비밀번호"/>
		<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
		<fr:errors path="password" />
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="chkPassword">비밀번호 확인</label>
	<div class="col-md-10">
		<fr:input type="password" class="form-control" path="chkPassword" id="chkPassword" placeholder="비밀번호 확인"/>
		<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
		<fr:errors path="chkPassword" />
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="name">이름</label>
	<div class="col-md-10">
	  <fr:input class="form-control" path="name" id="name" placeholder="이름"/>
	  <fr:errors path="name"/>
	</div>
</div>
<div class="form-group row" style="margin-left:0; margin-right:0;">
   <button type="submit" class="col-xs-6 btn btn-success">회원가입&nbsp;<i class="fa fa-check spaceLeft"></i></button>
   <button onclick="javascript:history.go(-1);" class="col-xs-6 btn btn-default">가입취소&nbsp;<i class="fa fa-times spaceLeft"></i></button>
</div>
</fr:form>
</div>