<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>
	

<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SB Admin - Dashboard</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/projectManagementResource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath}/projectManagementResource/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/projectManagementResource/css/sb-admin.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
		</ul>

	</nav>

	<div id="wrapper">

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
<!-- 					<li class="breadcrumb-item"><a href="#">Dashboard</a></li> -->
					<li class="breadcrumb-item active">Recent Massages</li>
				</ol>

				<!-- Icon Cards-->
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-primary o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fa fa-paint-brush"></i>
								</div> 
								<div class="mr-5">[${newDesign}] NEW DISIGN Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="<c:url value='/community/main?page=1&perPageNum=10&keyword=&team=1'/>">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-warning o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fa fa-mobile"></i>
								</div>
								<div class="mr-5">[${newMobile}] NEW MOBILE Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="<c:url value='/community/main?page=1&perPageNum=10&keyword=&team=2'/>">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fa fa-map"></i>
								</div>
								<div class="mr-5">[${newPlan}] New PLAN Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="<c:url value='/community/main?page=1&perPageNum=10&keyword=&team=3'/>">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-danger o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fa fa-at"></i>
								</div>
								<div class="mr-5">[${newWeb}] New WEB Messages!</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="<c:url value='/community/main?page=1&perPageNum=10&keyword=&team=4'/>">
								<span class="float-left">View Details</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
				</div>

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<c:choose>
							<c:when test="${param.team == 1}">
								<i class="fas fa-table"></i>  DISIGN POSTS
							</c:when>
							<c:when test="${param.team == 2}">
								<i class="fas fa-table"></i>  MOBILE POSTS
							</c:when>
							<c:when test="${param.team == 3}">
								<i class="fas fa-table"></i>  PLAN POSTS
							</c:when>
							<c:when test="${param.team == 4}">
								<i class="fas fa-table"></i>  WEB POSTS
							</c:when>
						</c:choose>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">

								<!-- 통합 검색 영역 -->
								<div class="input-group input-group-sm mb-3">
									<input type="text" class="form-control" placeholder="검색"
										name="keyword" id="keywordInput"
										value="${searchCriteria.keyword}"
										aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" style="background-color: #007bff; color:white;"
											id="searchBtn">검색</button>
									</div>
								</div>


								<thead style="background-color: #D8D8D8; color: #000000;">
									<tr>
										<th><strong>POSTS NO.</strong></th>
										<th><strong>TITLE</strong></th>
										<th><strong>WRITER</strong></th>
										<th><strong>DATE</strong></th>
										<th><strong>VIEWS</strong></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${list }" var="item">
										<tr
											onclick="location.href='../community/detail${pageMaker.makeSearch(searchCriteria.page) }&seq='+${item.seq }+'&team='+${param.team}">
											<th scope="row">${item.no }</th>
											<td>${item.title}</td>
											<td>${item.writer }</td>
											<td>${item.crtDt }</td>
											<td>${item.viewCnt }</td>
										</tr>
									</c:forEach>
<%-- 									<c:forEach items="${recentList }" var="item"> --%>
<!-- 										<tr -->
<%-- 											onclick="location.href='../community/detail${pageMaker.makeSearch(searchCriteria.page) }&seq='+${item.seq }+'&team='+${param.team}"> --%>
<%-- 											<th scope="row">${item.no }</th> --%>
<%-- 											<td>${item.title}</td> --%>
<%-- 											<td>${item.writer }</td> --%>
<%-- 											<td>${item.crtDt }</td> --%>
<%-- 											<td>${item.viewCnt }</td> --%>
<!-- 										</tr> -->
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
							<!-- 페이징 영역 -->
							<nav aria-label="...">
								<ul class="pagination" style="float:left">
									<c:if test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link"
											href="../community/main${pageMaker.makeSearch(1)}&team=${param.team}"><<</a>
										</li>
										<li class="page-item"><a class="page-link"
											href="../community/main${pageMaker.makeSearch(pageMaker.startPage - 1)}&team=${param.team}"><</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<c:choose>
											<c:when test="${searchCriteria.page == idx }">
												<li class="page-item active"><a
													href="../community/main${pageMaker.makeSearch(idx)}&team=${param.team}">
														<span class="page-link"> ${idx} </span>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="../community/main${pageMaker.makeSearch(idx)}&team=${param.team}">
														<span class="page-link"> ${idx} </span>
												</a></li>
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
			style="float: right; text-align: right; background-color: #007bff; color:white;"
			onclick="location.href='../community/insert${pageMaker.makeSearch(searchCriteria.page) }&team=${param.team}'">글쓰기</button>
						</div>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>

			</div>
		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!--     Bootstrap core JavaScript   -->
	<script
		src="<c:url value='/projectManagementResource/vendor/jquery/jquery.min.js' />"></script>
	<script
		src="<c:url value='/projectManagementResource/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

	<!--    Core plugin JavaScript   -->
	<script
		src="<c:url value='/projectManagementResource/vendor/jquery-easing/jquery.easing.min.js' />"></script>

	<!--    Page level plugin JavaScript   -->
	<script
		src="<c:url value='/projectManagementResource/vendor/chart.js/Chart.min.js'/>"></script>
<!-- 	<script -->
<!-- 엔티티, 검색, 페이징 부트 스트랩 -->
<%-- 		src="<c:url value='/projectManagementResource/vendor/datatables/jquery.dataTables.js'/>"></script> --%>
	<script
		src="<c:url value='/projectManagementResource/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

	<!--    Custom scripts for all pages   -->
	<script
		src="<c:url value='/projectManagementResource/js/sb-admin.min.js'/>"></script>

	<!--    Demo scripts for this page   -->
	<script
		src="<c:url value='/projectManagementResource/js/demo/datatables-demo.js'/>"></script>
	<script
		src="<c:url value='/projectManagementResource/js/demo/chart-area-demo.js'/>"></script>

<!-- 검색 버튼 클릭시 이벤트 -->
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
