<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html>

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

		<!-- Sidebar -->
			<c:choose>
					<c:when test="${param.team == 1 }">
					<ul class="sidebar navbar-nav" style="background-color:#007bff">
						<li class="nav-item active"><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=1">
								<strong><i class="fa fa-paint-brush"></i> <span>&nbsp;&nbsp;&nbsp;DISIGN [${DesignCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=2">
								<strong><i class="fa fa-mobile"></i> <span>&nbsp;&nbsp;&nbsp;MOBILE [${MobileCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=3">
								<strong><i class="fa fa-map"></i> <span>&nbsp;&nbsp;&nbsp;PLAN [${PlanCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=4">
								<strong><i class="fa fa-at"></i> <span>&nbsp;&nbsp;&nbsp;WEB [${WebCountPosts}]</span></strong>
						</a></li>
					</ul>
					</c:when>
				
					<c:when test="${param.team == 2 }">
					<ul class="sidebar navbar-nav" style="background-color:#ffc107">
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=1">
								<strong><i class="fa fa-paint-brush"></i> <span>&nbsp;&nbsp;&nbsp;DISIGN [${DesignCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=2">
								<strong><i class="fa fa-mobile"></i> <span>&nbsp;&nbsp;&nbsp;MOBILE [${MobileCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=3">
								<strong><i class="fa fa-map"></i> <span>&nbsp;&nbsp;&nbsp;PLAN [${PlanCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=4">
								<strong><i class="fa fa-at"></i> <span>&nbsp;&nbsp;&nbsp;WEB [${WebCountPosts}]</span></strong>
						</a></li>
					</ul>
					</c:when>
					
					<c:when test="${param.team == 3 }">
					<ul class="sidebar navbar-nav" style="background-color:#28a745">
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=1">
								<strong><i class="fa fa-paint-brush"></i> <span>&nbsp;&nbsp;&nbsp;DISIGN [${DesignCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=2">
								<strong><i class="fa fa-mobile"></i> <span>&nbsp;&nbsp;&nbsp;MOBILE [${MobileCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=3">
								<strong><i class="fa fa-map"></i> <span>&nbsp;&nbsp;&nbsp;PLAN [${PlanCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=4">
								<strong><i class="fa fa-at"></i> <span>&nbsp;&nbsp;&nbsp;WEB [${WebCountPosts}]</span></strong>
						</a></li>
					</ul>
					</c:when>
				
					<c:when test="${param.team == 4 }">
					<ul class="sidebar navbar-nav" style="background-color:#dc3545">
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=1">
								<strong><i class="fa fa-paint-brush"></i> <span>&nbsp;&nbsp;&nbsp;DISIGN [${DesignCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=2">
								<strong><i class="fa fa-mobile"></i> <span>&nbsp;&nbsp;&nbsp;MOBILE [${MobileCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item "><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=3">
								<strong><i class="fa fa-map"></i> <span>&nbsp;&nbsp;&nbsp;PLAN [${PlanCountPosts}]</span></strong>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="../community/main?page=1&perPageNum=10&keyword=&team=4">
								<strong><i class="fa fa-at"></i> <span>&nbsp;&nbsp;&nbsp;WEB [${WebCountPosts}]</span></strong>
						</a></li>
					</ul>
					</c:when>
			</c:choose>
		

		<div id="content-wrapper">

			<div class="container-fluid">

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

						<form action="../community/modifyAction" method="post">
							<input name="team" type="hidden" value="${param.team}" /> 
							<input name="seq" type="hidden" value="${param.seq}" /> 
							<input name="page" type="hidden" value="${searchCriteria.page}" /> 
							<input name="perPageNum" type="hidden" value="${searchCriteria.perPageNum}" /> 
							<input name="keyword" type="hidden" value="${searchCriteria.keyword}" />
							
							<!-- jsp에서 컨트롤러는 input, 컨트롤러에서 jsp 는 model -->
							<div>
								<div class="form-group">
									<label for="title">제목</label> <input type="text"
										class="form-control" id="title" name="title"
										value="${vo.title }">
								</div>

								<div class="form-group">
									<label for="description">내용</label>

									<textarea class="form-control" id="description"
										name="description" rows="10">${vo.description }</textarea>
								</div>

								<button type="submit" class="btn btn-info">수정하기</button>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='../community/detail?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&team=${param.team}&seq=${param.seq }'">이전으로</button>
							</div>
						</form>
						
					



					</div>
					<div class="card-footer small text-muted"></div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © 2018. itsuda All rights reserved</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

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

</body>

</html>
