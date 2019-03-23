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
		<input type="text" class="form-control" name="keyword" id="keywordInput" value="${criteria.keyword}" placeholder="검색어" >
	 	<span class="input-group-appendn">
			<button class="btn btn-outline-secondary" type="button" id="searchBtn"><i class="fa fa-search"></i>검색</button>
		</span>				
	</div>

	<!-- 페이지 이동  -->
	<div style="width: 100%; height: 150px;">
		<div style="text-align: center; float: left;">
			<ul class="pagination">
        <c:if test="${pageMaker.prev}">
            <li>
                <a href="../notice/main${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
            </li>
        </c:if>
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                <a href="../notice/main${pageMaker.makeSearch(idx)}">${idx}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li>
                <a href="../notice/main${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a>
            </li>
        </c:if>
    </ul>
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
	
// 	 $(document).ready(function () {
// 	        /*=================================== 게시글 페이지 이동 관련 / 등록,삭제 알림 ===================================*/
// 	        let result = "${msg}";
	        
// 	        // 검색 버튼 클릭시
// 	        $("#searchBtn").on("click", function () {
// 	            self.location = "boardList${pageMaker.makeQuery(1)}"
// 	                            + "&searchType=" + $("select option:selected").val()
// 	                            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
// 	        });
// 	    });
	
	
</script>
