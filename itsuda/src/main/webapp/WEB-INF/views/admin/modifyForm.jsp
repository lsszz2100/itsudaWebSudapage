<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
<form>
<div class="form-group row">
  	<label class="col-md-2 control-label" for="inputEmail">이메일</label>
	<div class="col-md-10">
	  <input class="form-control" id="inputEmail" type="email" placeholder="이메일">
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputPassword">비밀번호</label>
	<div class="col-md-10">
		<input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
		<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputPasswordCheck">비밀번호 확인</label>
	<div class="col-md-10">
	 <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
	   <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
	</div>
</div>
<div class="form-group row">
	<label class="col-md-2 control-label" for="inputName">이름</label>
	<div class="col-md-10">
	  <input class="form-control" id="inputName" type="text" placeholder="이름">
	</div>
</div>
<div class="form-group row" style="margin-left:0; margin-right:0;">
   <button type="submit" class="col-xs-6 btn btn-success">수정완료&nbsp;<i class="fa fa-check spaceLeft"></i></button>
   <button type="submit" class="col-xs-6 btn btn-default" data-dismiss="modal">수정취소&nbsp;<i class="fa fa-times spaceLeft"></i></button>
</div>
</form>
</div>