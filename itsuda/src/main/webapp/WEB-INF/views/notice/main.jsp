<!-- 커뮤니티 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>
	

<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>mainPage</title>

</head>

<body id="page-top">
	<div id="wrapper">
		<div id="content-wrapper">
			<div class="container-fluid" style="margin-top:60px">
			
			<div class="card-header" style="background-color:black; color:white;">
				<i class="fas fa-table"></i>  공지사항
					</div>
					
					<div class="card-body" style="background-color:#EDEDED; ">
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
											onclick="location.href='../notice/NoDetail${pageMaker.makeSearch(searchCriteria.page) }&seq='+${item.seq }">
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
											href="../notice/main${pageMaker.makeSearch(1)}"><<</a>
										</li>
										<li class="page-item"><a class="page-link"
											href="../notice/main${pageMaker.makeSearch(pageMaker.startPage - 1)}"><</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<c:choose>
											<c:when test="${searchCriteria.page == idx }">
												<li class="page-item active"><a
													href="../notice/main${pageMaker.makeSearch(idx)}">
														<span class="page-link"> ${idx} </span>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a
													href="../notice/main${pageMaker.makeSearch(idx)}">
														<span class="page-link"> ${idx} </span>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li class="page-item"><a class="page-link"
											href="../notice/main${pageMaker.makeSearch(pageMaker.endPage + 1)}">></a>
										</li>
										<li class="page-item"><a class="page-link"
											href="../notice/main${pageMaker.makeSearch(pageMaker.end)}">>></a>
										</li>
									</c:if>
								</ul>
							</nav>
								<!-- 글쓰기 버튼 -->
							<button type="button" class="btn btn-outline-secondary" 
								style="float: right; text-align: right; background-color: #007bff; color: white;"
								onclick="location.href='../notice/NoInsert${pageMaker.makeSearch(searchCriteria.page) }'">글쓰기</button>
						</div>
					</div>
					<div class="card-footer small text-muted" style="background-color:black; color:white;"></div>
				</div>
			</div>
		</div>
	</div>

<!-- 검색 버튼 클릭시 이벤트 -->
<script>
$(document).ready(function(){
$("#searchBtn").on("click", function (event) {
 self.location = 
 "../notice/main${pageMaker.makeQuery(1)}" + "&keyword=" + encodeURIComponent($("#keywordInput").val());
 });
 });
</script>

</body>

</html>
