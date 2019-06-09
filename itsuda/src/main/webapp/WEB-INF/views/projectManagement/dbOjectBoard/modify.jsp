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
				href="../projectManagement/basicInfo?seq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../documentBoard/DoMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../sourceBoard/SoMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../libraryBoard/LiMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="../dbOjectBoard/DBMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../issueManageBoard/IsMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/projectManage?proSeq=${proSeq}"> <i class="fas fa-fw fa-folder"></i> <span>프로젝트 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/main?proYear=2019&proStatus=P"> <i class="fas fa-fw fa-undo-alt"></i> <span>프로젝트 목록</span>
			</a></li>
			<li class="nav-item "><a class="nav-link" 
				href="../projectManagement/subMain?seq=${proSeq}"> <i class="fas fa-fw fa-undo-alt"></i> <span>프로젝트 세부 목록</span>
			</a></li>
		</ul>

		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="card mb-3">
				<div class="card-header">
						<i class="fas fa-table"></i> DB Object 수정
					</div>
					<div class="card-body">

						<form action="../dbOjectBoard/DBModifyAction" method="post" enctype="multipart/form-data">
							<input name="proSeq" type="hidden" value="${proSeq}" /> 
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
										<div class="card-body">
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
																				<button type="button" class="btn btn-danger btn-sm" id="modifyBtn" onclick="modifyBtn_click(${files.upSeq},${files.seq},${proSeq});">
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
									onclick="location.href='../dbOjectBoard/DBDetail?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq }&proSeq=${proSeq }'">이전으로</button>
							</div>
						</form>
					</div>
					<div class="card-footer small text-muted"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	
<script>
$(document).ready(function() {
	
	var description = '${vo.description }';
	result = description.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $('#description').val(result);
    });
    
function modifyBtn_click(upSeq, seq, proSeq) {
	if(confirm("첨부파일을 삭제하겠습니까?")){
		location.href='../dbOjectBoard/fileDelete/'+ upSeq + '/' +seq + '/' +proSeq;
	}
}
</script>

    
</body>

</html>
