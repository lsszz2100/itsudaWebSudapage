<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Charts</title>
</head>

<body id="page-top" style="margin-top: 50px">

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/basicInfo?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="../documentBoard/DoMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../sourceBoard/SoMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../libraryBoard/LiMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../dbOjectBoard/DBMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../issueManageBoard/IsMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../documentBoard/DoMain?page=1&perPageNum=10&keyword="> <i class="fas fa-fw fa-folder"></i> <span>프로젝트 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/main?proYear=2019&proStatus=P"> <i class="fas fa-fw fa-undo-alt"></i> <span>프로젝트 목록</span>
			</a></li>
			<li class="nav-item "><a class="nav-link" 
				href="../projectManagement/subMain?seq=${info.seq}"> <i class="fas fa-fw fa-undo-alt"></i> <span>프로젝트 세부 목록</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 산출 문서
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">

								<!-- 통합 검색 영역 -->
								<div class="input-group input-group-sm mb-3" >
									<input type="text" class="form-control" placeholder="검색" autocomplete=off
										name="keyword" id="keywordInput"
										value="${searchCriteria.keyword}"
										aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" style="background-color: #007bff; color:white;"
											id="searchBtn">검색</button>
									</div>
								</div>
								


								<thead style="background-color: #ffffff; color: #000000;">
									<tr>
										<th><strong>POSTS NO.</strong></th>
										<th><strong>TITLE</strong></th>
										<th><strong>WRITER</strong></th>
										<th><strong>DATE</strong></th>
										<th><strong>VIEWS</strong></th>
									</tr>
								</thead>

								<tbody style="background-color:white;">
									<c:forEach items="${list }" var="item">
										<tr
											onclick="location.href='../documentBoard/DoDetail${pageMaker.makeSearch(searchCriteria.page) }&seq='+${item.seq }">
											<th scope="row">${item.no }</th>
											<td>${item.title}</td>
											<td>${item.writer }</td>
											<td>${item.crtDt }</td>
											<td>${item.viewCnt }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 페이징 영역 -->
							<nav aria-label="...">
								<ul class="pagination" style="float:left">
									<c:if test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link"
											href="../documentBoard/DoMain${pageMaker.makeSearch(1)}"><<</a>
										</li>
										<li class="page-item"><a class="page-link"
											href="../documentBoard/DoMain${pageMaker.makeSearch(pageMaker.startPage - 1)}"><</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<c:choose>
											<c:when test="${searchCriteria.page == idx }">
												<li class="page-item active"><a
													href="../documentBoard/DoMain${pageMaker.makeSearch(idx)}">
														<span class="page-link"> ${idx} </span>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="../documentBoard/DoMain${pageMaker.makeSearch(idx)}">
														<span class="page-link"> ${idx} </span>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											href="../documentBoard/DoMain${pageMaker.makeSearch(pageMaker.endPage + 1)}">></a>
										</li>
										<li class="page-item"><a class="page-link"
											href="../documentBoard/DoMain${pageMaker.makeSearch(pageMaker.end)}">>></a>
										</li>
									</c:if>
								</ul>
							</nav>
								<!-- 글쓰기 버튼 -->
							<button type="button" class="btn btn-outline-secondary" 
								style="float: right; text-align: right; background-color: #007bff; color: white;"
								onclick="location.href='../documentBoard/DoInsert${pageMaker.makeSearch(searchCriteria.page) }'">글쓰기</button>
						</div>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
<!-- 검색 버튼 클릭시 이벤트 -->
<script>
$(document).ready(function(){
$("#searchBtn").on("click", function (event) {
 self.location = 
 "../documentBoard/DoMain${pageMaker.makeQuery(1)}" + "&keyword=" + encodeURIComponent($("#keywordInput").val());
 });
 });
</script>

    
</body>

</html>
