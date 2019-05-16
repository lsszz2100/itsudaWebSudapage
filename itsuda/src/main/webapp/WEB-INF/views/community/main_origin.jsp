<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/style/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/style/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/style/css/sb-admin.css" rel="stylesheet" type="text/css">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

<!--     <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#"> -->
<!--       <i class="fas fa-bars"></i> -->
<!--     </button> -->


    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

	<div id="wrapper">

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Icon Cards-->
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-primary o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-comments"></i>
								</div>
								<div class="mr-5">${newDesign}NEW DISIGN Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1"
								href="../community/main?page=1&perPageNum=10&keyword=&team=1">
								<span class="float-left">DISIGN BOARD</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>

					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-warning o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="mr-5">${newMobile}NEW MOBILE Messages!</div>
								<!-- MOBILE 새로운 글목록 수 기능 구현 예정 -->
							</div>
							<a class="card-footer text-white clearfix small z-1"
								href="../community/main?page=1&perPageNum=10&keyword=&team=2">
								<span class="float-left">MOBILE BOARD</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>

					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="mr-5">${newPlan}New PLAN Messages!</div>
								<!-- PLAN 새로운 글목록 수 기능 구현 예정 -->
							</div>
							<a class="card-footer text-white clearfix small z-1"
								href="../community/main?page=1&perPageNum=10&keyword=&team=3">
								<span class="float-left">PLAN BOARD</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>

					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-danger o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-life-ring"></i>
								</div>
								<div class="mr-5">${newWeb}New WEB Messages!</div>
								<!-- WEB 새로운 글목록 수 기능 구현 예정 -->
							</div>
							<a class="card-footer text-white clearfix small z-1"
								href="../community/main?page=1&perPageNum=10&keyword=&team=4">
								<span class="float-left">WEB BOARD</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="container" style="padding-top: 60px;">
	<table class="table table-striped table-hover">
		<!-- 커스텀 필요 -->
		<thead class="thead-dark">
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="item">
				<tr onclick="location.href='../community/detail${pageMaker.makeSearch(searchCriteria.page) }&seq='+${item.seq }+'&team='+${param.team}">
					<th scope="row">${item.no }</th>
					<td>${item.title}</td>
					<td>${item.writer }</td>
					<td>${item.crtDt }</td>
					<td>${item.viewCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="input-group input-group-sm mb-3">
		<input type="text" class="form-control" placeholder="검색" name="keyword" id="keywordInput" value="${searchCriteria.keyword}"
			aria-label="Recipient's username" aria-describedby="button-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary" type="button" 
				id="searchBtn">검색</button>
		</div>
	</div>

	<!-- 페이지 이동  -->
					<nav aria-label="...">
						<ul class="pagination" style="justify-content: center;">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="../community/main${pageMaker.makeSearch(1)}&team=${param.team}"><<</a>
								</li>
								<li class="page-item"><a class="page-link"
									href="../community/main${pageMaker.makeSearch(pageMaker.startPage - 1)}&team=${param.team}"><</a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<c:choose>
									<c:when test="${searchCriteria.page == idx }">
										<li class="page-item active" >
										<a href="../community/main${pageMaker.makeSearch(idx)}&team=${param.team}">
											<span class="page-link"> ${idx} </span>
										</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
										<a href="../community/main${pageMaker.makeSearch(idx)}&team=${param.team}">
											<span class="page-link"> ${idx} </span>
										</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link"
									href="../community/main${pageMaker.makeSearch(pageMaker.endPage + 1)}&team=${param.team}">></a>
								</li>
									<li class="page-item"><a class="page-link"
									href="../community/main${pageMaker.makeSearch(pageMaker.end)}&team=${param.team}">>></a>
								</li>
							</c:if>
						</ul>
					</nav>



					<!-- 글쓰기 버튼 -->
		<button type="button" class="btn btn-outline-secondary" 
			style="float: right; text-align: right;" onclick="location.href='../community/insert${pageMaker.makeSearch(searchCriteria.page) }&team=${param.team}'" >글쓰기</button>
	</div>
         

<script>
$(document).ready(function(){
$("#searchBtn").on("click", function (event) {
 self.location = 
 "../community/main${pageMaker.makeQuery(1)}" + "&keyword=" + encodeURIComponent($("#keywordInput").val()) + "&team=" + ${param.team};
 });
 });
</script>

</body>



</html>