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
				href="../projectManagement/basicInfo?seq=${proSeq}"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../documentBoard/DoMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../sourceBoard/SoMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="../libraryBoard/LiMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../LiOjectBoard/LiMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
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
						<i class="fas fa-table"></i> 라이브러리 등록
					</div>
					<div class="card-body">

						<form action="<c:url value='/libraryBoard/LiInsertAction'/>"
							method="post" enctype="multipart/form-data">
							<input name="proSeq" type="hidden" value="${proSeq}" />
							<div>
								<div class="form-group">
									<label for="title">제목</label> <input type="text" autocomplete=off
										class="form-control" id="title" name="title"
										placeholder="제목을 작성해주세요." required>
								</div>
								<div class="form-group">
									<label for="description">내용</label>
									<textarea class="form-control" id="description" autocomplete=off
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
									onclick="location.href='../libraryBoard/LiMain?page=${param.page }&perPageNum=10&keyword=&proSeq=${proSeq }'">목록으로</button>
								<button type="submit" class="btn btn-info" onclick="#" style="margin:15px; float:right;">등록하기</button>
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
	
    
</body>

</html>
