<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>modifyPage</title>
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

								<div class="col-lg-13" style="margin-bottom: 1rem;">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">첨부파일 추가</h4>
											<div class="basic-form">
												<div id="fileDiv">
													<div class="form-group">
														<input type="file" name="files" class="form-control-file">
													</div>
												</div>
											</div>
										</div>
									</div>
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
		</div>
	</div>
</body>

</html>
