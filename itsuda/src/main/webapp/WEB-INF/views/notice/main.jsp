<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp"%>



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
			<c:forEach items ="${list }" var = "list">
				<tr onclick="detailView('${list.boardNo}')">
					<th scope="row">${list.no }</th>
					<td>${list.boardTitle } </td>
					<td>${list.boardWriter }</td>
					<td>${list.boardInsertd } </td>
					<td>${list.boardViewcnt } </td>
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
		<button type="button" class="btn btn-outline-secondary" style="float: right; text-align: right;"
			onclick="insert()">글쓰기</button>
	</div>
</div>


<script type="text/javascript">
	function detailView(boardNo) {
		alert('글 상세 페이지 이동' + boardNo);
		location.href = "../notice/detail?boardNo="+boardNo;
	}
	
	function insert(){
		location.href = "../notice/insert";
	}
</script>
