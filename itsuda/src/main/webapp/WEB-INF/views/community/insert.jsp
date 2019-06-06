<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>insertPage</title>


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
							method="post" enctype="multipart/form-data">
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
										name="description" rows="10" required></textarea>
								</div>

								<div class="col-lg-13">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">첨부파일 추가</h4>
											<div class="basic-form">
												<div id="fileDiv">
													<div class="form-group">
														<input type="file" multiple="multiple" name="files" class="form-control-file">
													</div>
												</div>
											</div>
										</div>
									</div>


								</div>
								
								
								<button type="button" class="btn btn-secondary" style="margin-top:15px; float:right;"
									onclick="location.href='../community/main?page=${param.page }&perPageNum=10&keyword=&team=${param.team}'">목록으로</button>
								<button type="submit" class="btn btn-info" onclick="#" style="margin:15px; float:right;">등록하기</button>
	
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
