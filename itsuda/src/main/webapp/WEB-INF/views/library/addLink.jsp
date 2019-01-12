<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<c:if test="${status eq 'SUCCESS'}">
<script>
alert("등록되었습니다.");
</script>
</c:if>
<c:if test="${status eq 'FAIL'}">
<script>
alert("등록이 실패였습니다.");
</script>
</c:if>
<div class="container">
<div class="formContainer">
<form action="addLink" name="addLink" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	<div class="form-group row">
		<label for="team" class="col-md-2 control-label">팀 선택</label>
		<div class="col-md-10">
		<select class="form-control" name="team">
			<option value="plan">기획팀</option>
			<option value="design">디자인팀</option>
			<option value="mobile">앱개발팀</option>
			<option value="web">웹개발팀</option>
		</select>
		</div>
	</div>
	<div class="form-group row">
		<label for="title" class="col-md-2 control-label">제목</label>
		<div class="col-md-10">
			<input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요">
		</div>
	</div>
	<div class="form-group row">
		<label for="description" class="col-md-2 control-label">설명</label>
		<div class="col-md-10">
			<textarea class="form-control" id="description" name="description" rows="4" onKeyup="len_chk()"></textarea>
		</div>
	</div>
	<div class="form-group row">
		<label for="url" class="col-md-2 control-label">주소</label>
		<div class="col-md-10">
			<input class="form-control" type="text" name="url" placeholder="라이브러리 주소(url)를 입력해주세요">
		</div>
	</div>
	<div class="form-group row">
		<label for="hashlink" class="col-md-2 control-label">검색 값</label>
		<div class="col-md-10">
			<input class="form-control" type="text" name="hashlink" placeholder="검색값을 입력해주세요">
		</div>
	</div>
	<div class="form-group row">
		<label for="image" class="col-md-2 control-label">썸네일</label>
		<div class="col-md-10">
			<input class="form-control" type="file" name="image" placeholder="이미지를 첨부해주세요">
		</div>
	</div>
	<div class="form-group row">
		<label for="rank" class="col-md-2 control-label">중요도</label>
		<div class="col-md-10">
		<select class="form-control" name="rank">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		</div>
	</div>
	<div class="form-group row">
		<label for="author" class="col-md-2 control-label">글쓴이</label>
		<div class="col-md-10">
			<input class="form-control" type="text" name="author" value="${author}" disabled>
		</div>
	</div>
	<button type="submit" class="form-control btn btn-success btn-block">
		제출&nbsp;
		<i class="fa fa-check spaceLeft"></i>
	</button>
</form>
</div>
</div>