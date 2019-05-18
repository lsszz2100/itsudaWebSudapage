<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>insertPage</title>

<!-- <!-- Custom fonts for this template--> 
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/projectManagementResource/vendor/fontawesome-free/css/all.min.css" --%>
<!-- 	rel="stylesheet" type="text/css"> -->

<!-- <!-- Page level plugin CSS--> 
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/projectManagementResource/vendor/datatables/dataTables.bootstrap4.css" --%>
<!-- 	rel="stylesheet"> -->

<!-- <!-- Custom styles for this template--> 
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/projectManagementResource/css/sb-admin.css" --%>
<!-- 	rel="stylesheet"> -->

</head>

<body id="page-top">
	<div id="wrapper">
		<div id="content-wrapper">
			<div class="container-fluid" style="margin-top:50px">
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
						</form>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>

			</div>
		</div>
	</div>
</body>

</html>
