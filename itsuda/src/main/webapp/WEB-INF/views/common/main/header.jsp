<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<style type="text/css">
	.nav-header > a{
		margin-right: 10px;
		height: 32px;
	}
	
	.header-logout-list{ display: none;}
	@media(max-width: 767px){
		.header-logout-icon{ display: none; }
		.header-logout-list{ display: block;}
	}
	
</style>

<div class="container">
<nav class="navbar navbar-expand-md navbar-light bg-light nav-header fixed-top">
  <!-- 메인페이지 이동 -->
  <a class="navbar-brand" href="<c:url value='/index'/>">
  	<!-- TODO : 아이콘 변경 필요 -->
  	<img  class="d-inline-block align-top" alt="" src="<c:url value='/image/ci.png'/>" style="height: 32px; width: 32px;">
  	ITsuda
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
  	<ul class="nav navbar-nav">
	  <li class="dropdown">
	      <a class="nav-link dropdown" href="#" id="navbarNavDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>프로젝트 관리</b></a>
	      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        <a class="dropdown-item" href="#">프로젝트1번</a>
	        <a class="dropdown-item" href="#">프로젝트2번</a>
	      </div>
	  </li>
	  <li class="dropdown">
	      <a class="nav-link dropdown" href="#" id=navbarDropdownMenuLink role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>커뮤니티</b></a>
	      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	        <a class="dropdown-item" href="<c:url value='/community/main?team=1'/>"><img  class="d-inline-block align-top" alt="" src="<c:url value='/image/icon_design.png'/>" style="height: 32px; width: 32px;">DESIGN</a>
	        <a class="dropdown-item" href="<c:url value='/community/main?team=2'/>"><img  class="d-inline-block align-top" alt="" src="<c:url value='/image/icon_mobile.png'/>" style="height: 32px; width: 32px;">MOBILE</a>
	        <a class="dropdown-item" href="<c:url value='/community/main?team=3'/>"><img  class="d-inline-block align-top" alt="" src="<c:url value='/image/icon_plan.png'/>" style="height: 32px; width: 32px;">PLAN</a>
	        <a class="dropdown-item" href="<c:url value='/community/main?team=4'/>"><img  class="d-inline-block align-top" alt="" src="<c:url value='/image/icon_web.png'/>" style="height: 32px; width: 32px;">WEB</a>
	      </div>
	    </li>
	  <li class="dropdown">
	      <a class="nav-link" href="<c:url value='/notice/main'/>"><b>공지사항</b></a>
	  </li>
	  <li class="nav-item header-logout-list">
	  	  <a class="nav-link" href="<c:url value ='/member/logout'/>"><b>로그아웃</b></a>
	  </li>
	</ul>
	</div>
	<a class="navbar-brand header-logout-icon" href="<c:url value ='/member/logout'/>" id=#navbarNavDropdown role="button" aria-haspopup="true" aria-expanded="false">
  		<img alt="" src="<c:url value='/image/logout.png'/>">
  	</a>
	
	
</nav>
</div>


<!-- <div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
</div> -->
<%-- <div id="navbar" class="navbar-collapse collapse">
  <ul class="nav navbar-nav">
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>프로젝트 관리</b></a>
      <ul class="dropdown-menu" role="menu">
        <li><a class="dropdown-item" href="/itsuda/project/main?project=namguro">남구로 시장</a></li>
        <c:forEach items="${menuList }" var="item">
        	<li><a class="dropdown-item" href="/itsuda/project/main?project=${item.menuNm}">${item.menuNm}</a></li>
        </c:forEach>
      </ul>
    </li>
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>라이브러리 관리</b></a>
      <ul class="dropdown-menu" role="menu">
        <li><a class="dropdown-item" href="/itsuda/library/main?mode=plan">기획팀</a></li>
        <li><a class="dropdown-item" href="/itsuda/library/main?mode=design">디자인팀</a></li>
        <li><a class="dropdown-item" href="/itsuda/library/main?mode=mobile">앱개발팀</a></li>
        <li><a class="dropdown-item" href="/itsuda/library/main?mode=web">웹개발팀</a></li>
      </ul>
    </li>
    <li>
      <a href="/itsuda/library/addLink"><b>라이브러리 추가</b></a>
    </li>
    <c:if test="${userInfo.grade eq 'ADMIN'}">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>관리자 페이지</b></a>
			<ul class="dropdown-menu" role="menu">
		        <li><a class="dropdown-item" href="/itsuda/admin/registerMember">팀원 등록</a></li>
		        <li><a class="dropdown-item" href="/itsuda/admin/modifyMember">팀원 관리</a></li>
		        <li><a class="dropdown-item" href="/itsuda/admin/modifyLink">링크 관리</a></li>
	      	</ul>
		</li>
    </c:if>
  </ul>
  <ul class="nav navbar-nav navbar-right">
  	<li><a id="logout" href="#"><b>로그아웃</b></a></li>
  	<li><a href="/itsuda/member/modifyMember"><b>회원정보수정</b></a></li>
  </ul>
</div>


<!-- 로그아웃 모달 시작 -->
<div class="modal fade" id="logout_Modal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" style="z-index:99; position:absolute; top:10px; right:20px;">&times;</button>
			<div class="modal-body custom-modal-body">
				<form id="logoutForm" role="form" action="/itsuda/member/logout" method="post">
					 <p style="text-align:center;">로그아웃하시겠습니까?</p>
					 <div class="form-group row">
					 	<button type="submit" class="col-xs-6 btn btn-success">
					 		네&nbsp;
					 		<i class="fa fa-check spaceLeft"></i>
					 	</button>
					 	<button type="button" class="col-xs-6 btn btn-default" data-dismiss="modal">
					 		아니요&nbsp;
					 		<i class="fa fa-times spaceLeft"></i>
					 	</button>
					</div>
				</form>
			</div>
		</div>      
	</div>
</div>
--%>
<!-- 로그아웃 모달 끝 -->
