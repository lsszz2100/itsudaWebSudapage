<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="http://getbootstrap.com/docs/4.1/examples/jumbotron/#"><b>남구로시장</b></a>
</div>
<div id="navbar" class="navbar-collapse collapse">
  <ul class="nav navbar-nav">
    <li class="dropdown active">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>라이브러리 관리</b></a>
      <ul class="dropdown-menu" role="menu">
        <li><a class="dropdown-item" href="/namguro/planLinks">기획팀</a></li>
        <li><a class="dropdown-item" href="/namguro/deLinks">디자인팀</a></li>
        <li><a class="dropdown-item" href="/namguro/mobLinks">앱개발팀</a></li>
        <li><a class="dropdown-item" href="/namguro/webLinks">웹개발팀</a></li>
      </ul>
    </li>
    <c:choose>
    <c:when test="${not empty sessionScope.loginCheck}">
    <li>
      <a href="/namguro/addLink"><b>라이브러리 추가</b></a>
    </li>
    </c:when>
    </c:choose>
  </ul>
  <c:choose>
  <c:when test="${not empty sessionScope.loginCheck}">
  <ul class="nav navbar-nav navbar-right">
  	<li><a id="logout" href="#"><b>로그아웃</b></a></li>
  	<li><a href="/namguro/modifyForm"><b>회원정보수정</b></a></li>
  </ul>
  </c:when>
  <c:otherwise>
   <ul class="nav navbar-nav navbar-right">
  	<li><a id="login"><b>로그인</b></a></li>
  </ul>
  </c:otherwise>
  </c:choose>
</div>


<!-- Modal -->
<div class="modal fade" id="loginModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" style="z-index:99; position:absolute; top:10px; right:20px;">&times;</button>
			<div class="modal-body" style="padding:40px 50px;">
				<form role="form" action="/namguro/login" method="post">
					 <div class="form-group">
					 	<label for="email">이메일</label>
					 	<input type="text" class="form-control" id="email" name="email" placeholder="이메일주소를 입력해주세요">
					 </div>
					 <div class="form-group">
					 	<label for="password">비밀번호</label>
					 	<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
					 </div>
					 <div class="checkbox">
					 	<label><input type="checkbox" id="loginAuto" name="loginAuto" checked>로그인 상태 유지</label>
					 </div>
					 <div class="form-group row" style="margin-left:0; margin-right:0;">
					 	<button type="submit" class="col-xs-6 btn btn-success" >로그인&nbsp;<i class="fa fa-check spaceLeft"></i></button>
					 	<button type="button" class="col-xs-6 btn btn-default" data-dismiss="modal">취소&nbsp;<i class="fa fa-times spaceLeft"></i></button>
					</div>
					<p>회원가입이 되어 있지 않으신가요? <a href="/namguro/registerForm">회원가입 하러가기</a></p>
					<p>비밀번호를 잊어버리셨나요? <a href="/namguro/modifyPasswd">비밀번호 찾기</a></p>
				</form>
			</div>
		</div>      
	</div>
</div>
<div class="modal fade" id="logoutModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" style="z-index:99; position:absolute; top:10px; right:20px;">&times;</button>
			<div class="modal-body" style="padding:40px 50px;">
				<form id="logoutForm" role="form" action="/namguro/logout" method="post">
					 <p style="text-align:center;">로그아웃하시겠습니까?</p>
					 <div class="form-group row" style="margin-left:0; margin-right:0;">
					 	<button type="submit" class="col-xs-6 btn btn-success">네&nbsp;<i class="fa fa-check spaceLeft"></i></button>
					 	<button type="submit" class="col-xs-6 btn btn-default" data-dismiss="modal">아니요&nbsp;<i class="fa fa-times spaceLeft"></i></button>
					</div>
				</form>
			</div>
		</div>      
	</div>
</div>
<script>
$(document).ready(function(){
    $("#login").click(function(){
        $("#loginModal").modal();
    });
 
    $("#logout").click(function(){
        $("#logoutModal").modal();
    });
    
});
</script>
