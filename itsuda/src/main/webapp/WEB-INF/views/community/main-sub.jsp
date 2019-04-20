<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!-- <script type="text/javascript">
	function detailView(seq) {
 		location.href = "../community/detail?seq=" + seq;
	}
</script> -->

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
				<%-- <tr onclick="detailView('${item.seq }')" id="${item.seq }"> --%>
				<tr onclick="location.href='../community/detail?seq='+${item.seq }">
					<th scope="row">${item.teamSeq }</th>
					<td>${item.title}</td>
					<td>${item.writer }</td>
					<td>${item.crtDt }</td>
					<td>${item.viewCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="input-group input-group-sm mb-3">
		<input type="text" class="form-control" placeholder="검색"
			aria-label="Recipient's username" aria-describedby="button-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-secondary" type="button"
				id="button-addon2">검색</button>
		</div>
	</div>

	<!-- 페이지 이동  -->
	<div style="width: 100%; height: 150px;">
		<div style="text-align: center; float: left;">
			<button type="button" class="btn btn-outline-secondary">&#60;&#60;</button>
			<button type="button" class="btn btn-outline-secondary">&#60;</button>
			<button type="button" class="btn btn-outline-secondary">1</button>
			<button type="button" class="btn btn-outline-secondary">2</button>
			<button type="button" class="btn btn-outline-secondary">3</button>
			<button type="button" class="btn btn-outline-secondary">4</button>
			<button type="button" class="btn btn-outline-secondary">5</button>
			<button type="button" class="btn btn-outline-secondary">&#62;</button>
			<button type="button" class="btn btn-outline-secondary">&#62;&#62;</button>
		</div>
		<button type="button" class="btn btn-outline-secondary"
			style="float: right; text-align: right;">글쓰기</button>
	</div>
</div>