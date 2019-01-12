<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<script>
$(document).ready(function(){
    $("#logout").click(function(){
        $("#logout_Modal").modal();
    });
    
    // by ym. 2018-07-06 라이브러리 링크 삭제 클릭 시 모달로 띄우도록 수정
    $(".del_link").click(function(){
    	var seq = $(this).find(".seq").val();
    	var team = $(this).find(".team").val();
    	console.log("seq:"+seq+",team:"+team);
    	$("#del_lib_Modal #delLibraryForm")
    	.append("<input type='hidden' name='seq' value='" + seq + "'/>")
    	.append("<input type='hidden' name='team' value='" + team + "'/>");
    	$("#del_lib_Modal").modal();
    });
});
</script>

<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
</div>
<div id="navbar" class="navbar-collapse collapse">
  <ul class="nav navbar-nav">
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>프로젝트 관리</b></a>
      <ul class="dropdown-menu" role="menu">
        <li><a class="dropdown-item" href="/itsuda/project/main?project=namguro">남구로 시장</a></li>
        <%-- <c:forEach items="${menuList }" var="item">
        	<li><a class="dropdown-item" href="/itsuda/project/main?project=${item.menuNm}">${item.menuNm}</a></li>
        </c:forEach> --%>
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


<!--
	작성자 : 황유미
	작성일 : 2018-07-06
	최종수정일 : 2018-07-06
	기능 : Modal 정의
-->
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
<!-- 로그아웃 모달 끝 -->
<!-- 라이브러리 삭제 확인 모달 -->
<div class="modal fade" id="del_lib_Modal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" style="z-index:99; position:absolute; top:10px; right:20px;">&times;</button>
			<div class="modal-body custom-modal-body">
				<form id="delLibraryForm" role="form" action="/itsuda/library/deleteLink" method="post">
					 <p style="text-align:center;">삭제하시겠습니까?</p>
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
<!-- 라이브러리 삭제 확인 모달 끝 -->

