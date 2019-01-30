<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp"%>

<script type="text/javascript">
	function detailView(seq) {
		alert('글 상세 페이지 이동'+seq);
	}
</script>

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
			<tr onclick="detailView('5')">
				<th scope="row">5</th>
				<td>테스트 글 제목5</td>
				<td>테스트</td>
				<td>2019-01-31</td>
				<td>400</td>
			</tr>
			<tr onclick="detailView('4')">
				<th scope="row">4</th>
				<td>테스트 글 제목4</td>
				<td>테스트</td>
				<td>2019-01-31</td>
				<td>400</td>
			</tr>
			<tr onclick="detailView('3')">
				<th scope="row">3</th>
				<td>테스트 글 제목3</td>
				<td>테스트</td>
				<td>2019-01-31</td>
				<td>400</td>
			</tr>
			<tr onclick="detailView('2')">
				<th scope="row">2</th>
				<td>테스트 글 제목2</td>
				<td>테스트</td>
				<td>2019-01-31</td>
				<td>+999</td>
			</tr>
			<tr onclick="detailView('1')">
				<th scope="row">1</th>
				<td>테스트 글 제목1</td>
				<td>테스트</td>
				<td>2019-01-31</td>
				<td>50</td>
			</tr>
		</tbody>
	</table>
	
	<div class="input-group input-group-sm mb-3">
		<input type="text" class="form-control" placeholder="검색" aria-label="Recipient's username" aria-describedby="button-addon2">
		<div class="input-group-append">
    		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
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
		<button type="button" class="btn btn-outline-secondary" style="float:right; text-align: right;">글쓰기</button>
	</div>
</div>