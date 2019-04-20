<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<div class="container">
	<c:if test="${registered eq 'TRUE'}">
		<script>
			alert("가입 완료되었습니다.");
		</script>
	</c:if>
	<!-- 스타일 변경 필요 -->
	<form:form action="/itsuda/admin/registerMember" method="post" commandName="memberVo">
		<div class="form-group row">
		  	<label class="col-md-2 control-label" for="email">이메일</label>
			<div class="col-md-10">
				<form:input class="form-control" path="email" id="email" placeholder="이메일"/>
				<form:errors path="email" />
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-md-2 control-label" for="name">이름</label>
			<div class="col-md-10">
			  <form:input class="form-control" path="name" id="name" placeholder="이름"/>
			  <form:errors path="name"/>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-md-2 control-label" for="grade">권한</label>
			<div class="col-md-10">
				<form:select class="form-control" path="grade" id="grade">
					<form:option value="MEMBER"/>
					<form:option value="ADMIN"/>
				</form:select>
				<form:errors path="grade"/>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-md-2 control-label" for="mode">팀</label>
			<div class="col-md-10">
				<form:select class="form-control" path="mode" id="mode">
					<%-- <c:forEach items="${teamList}" var="item">
						<form:option value="${item.teamNm }"/>
					</c:forEach> --%>
					<form:option value="WEB"/>
					<form:option value="MOBILE"/>
					<form:option value="DEGINE"/>
					<form:option value="PLAN"/>
				</form:select>
				<form:errors path="mode"/>
			</div>
		</div>
		
		<div class="form-group row" style="margin-left:0; margin-right:0;">
		   <button type="submit" class="col-xs-6 btn btn-success">회원가입&nbsp;<i class="fa fa-check spaceLeft"></i></button>
		   <button onclick="javascript:history.go(-1);" class="col-xs-6 btn btn-default">가입취소&nbsp;<i class="fa fa-times spaceLeft"></i></button>
		</div>
		
		
		<%-- <div class="form-group row">
			<label class="col-md-2 control-label" for="password">비밀번호</label>
			<div class="col-md-10">
				<form:input type="password" class="form-control" path="password" id="password" placeholder="비밀번호"/>
				<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				<form:errors path="password" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-md-2 control-label" for="chkPassword">비밀번호 확인</label>
			<div class="col-md-10">
				<form:input type="password" class="form-control" path="chkPassword" id="chkPassword" placeholder="비밀번호 확인"/>
				<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				<form:errors path="chkPassword" />
			</div>
		</div> --%>
	</form:form>
</div>