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

<script type="text/javascript">

$(document).ready(function() {
	
	var description = '${vo.description }';
	result = description.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $('#description').val(result);
    });
</script>

	<div id="wrapper">
		<div id="content-wrapper">
			<div class="container-fluid" style="margin-top:50px">
				<div class="card mb-3">
					<div class="card-header" style="background-color:black; color:white;">
						<i class="fas fa-table"></i>   공지사항
					</div>
					
					<div class="card-body" style="background-color:#EDEDED;>

						<form action="../notice/NoModifyAction" method="post" enctype="multipart/form-data">
							<input name="team" type="hidden" value="${param.team}" /> 
							<input name="seq" type="hidden" value="${param.seq}" /> 
							<input name="page" type="hidden" value="${searchCriteria.page}" /> 
							<input name="perPageNum" type="hidden" value="${searchCriteria.perPageNum}" /> 
							<input name="keyword" type="hidden" value="${searchCriteria.keyword}" />
							
							<div>
								<div class="form-group">
									<label for="title">제목</label> <input type="text"
										class="form-control" id="title" name="title"
										value="${vo.title }">
								</div>

								<div class="form-group">
									<label for="description">내용</label>

									<textarea class="form-control" id="description"
										name="description" rows="10"></textarea>
								</div>

								<div class="col-lg-13" style="margin-bottom: 1rem;">
									<div class="card" >
										<div class="card-body" ">
											<h4 class="card-title">첨부파일 수정</h4>
											<div class="basic-form">
												<div id="fileDiv" >
													<div class="form-group">
														<input type="file" multiple="multiple" name="files" class="form-control-file">
													</div>
													<c:choose>
														<c:when test="${!empty files}">
															<div class="card-body">
															<div class="card" style="padding:1rem;">
																<div class="form-group">
																	<!-- 첨부파일 다운로드 -->
																	<label>첨부파일 삭제 </label>
																	<c:forEach var="files" varStatus="i" items="${files }">
																		<p>
																				${files.fileRealName}&nbsp;&nbsp;&nbsp;&nbsp;
																				<button type="button" class="btn btn-danger btn-sm" id="modigyBtn" onclick="modifyBtn_click(${files.upSeq},${files.seq});">
																				 x
																				</button>
																		</p> 
																		
																	</c:forEach>
																</div>
															</div>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>

								<button type="submit" class="btn btn-danger">수정하기</button>
								<button type="button" class="btn btn-secondary"
									onclick="location.href='../notice/NoDetail?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq }'">이전으로</button>
							</div>
						</form>

					</div>
					<div class="card-footer small text-muted"  style="background-color:black;"></div>
				</div>

			</div>
		</div>
	</div>
	
<script>
function modifyBtn_click(upSeq, seq) {
	if(confirm("첨부파일을 삭제하겠습니까?")){
		location.href='../notice/fileDelete/'+ upSeq + '/' +seq;
	}else{
	}
}
</script>


</body>

</html>
