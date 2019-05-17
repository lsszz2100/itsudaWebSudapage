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

						<form action="<c:url value='/community/insertAction'/>"
							method="post">
							<input name="team" type="hidden" value="${param.team}" />
							<div>
								<div class="form-group">
									<label for="title">제목</label> <input type="text"
										class="form-control" id="title" name="title"
										placeholder="제목을 작성해주세요." required>
								</div>
								<!--         <div class="form-group"> -->
								<!--             <label for="writer">작성자</label> -->
								<!--             <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자명을 적어주세요." required> -->
								<!--           </div> -->
								<div class="form-group">
									<label for="description">내용</label>
									<textarea class="form-control" id="description"
										name="description" rows="10"></textarea>
								</div>

								<div class="col-lg-12">
									<div class="form-group">
										<div class="fileDrop">
											<br /> <br /> <br /> <br />
											<p class="text-center">
												<i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.
											</p>
										</div>
									</div>

									<!-- /.box-body -->
									<div class="box-footer">
										<div>
											<hr>
										</div>
										<ul class="mailbox-attachments clearfix uploadedList"></ul>
									</div>
									<!-- /.box-footer -->
								</div>


								<button type="submit" class="btn btn-info" onclick="#">등록하기</button>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='../community/main?page=${param.page }&perPageNum=10&keyword=&team=${param.team}'">목록으로</button>
								<button type="reset" class="btn btn-warning" onclick="#">첨부파일
									초기화</button>
							</div>


							<!-- 		<div> -->
							<!-- 			<div class="pull-right"> -->
							<!-- 				<button type="reset" class="btn btn-warning"> -->
							<!-- 					<i class="fa fa-reply"></i> 첨부파일 초기화 -->
							<!-- 				</button> -->
							<!-- 			</div> -->
							<!-- 		</div> -->

						</form>



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

	<!--     Demo scripts for this page    -->
	<script>
 		src="<c:url value='/projectManagementResource/js/demo/datatables-demo.js'/>"></script>
	<script>
 		src="<c:url value='/projectManagementResource/js/demo/chart-area-demo.js'/>"></script>

	<script id="fileTemplate" type="text/x-handLebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
 			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{origincalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
	</script>





</body>

</html>
