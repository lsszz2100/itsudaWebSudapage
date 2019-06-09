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
			<li class="nav-item "><a class="nav-link"
				href="../dbOjectBoard/DBMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../issueManageBoard/IsMain?page=1&perPageNum=10&keyword=&proSeq=${proSeq }"> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
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
						<i class="fas fa-chart-area"></i> 프로젝트 관리
					</div>
					<div class="card-body">
						<ol class="breadcrumb">
							<li class="breadcrumb-item active"><strong>프로젝트 기간  </strong></li>
							<li class="breadcrumb-item"><a href="../projectManagement/basicInfo?seq=${proSeq }"><strong>${projectTerm.startDt } ~ ${projectTerm.endDt }</strong></a></li>
						</ol>
					</div>
					
					<div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="../projectManagement/projectManageAction" id="infoForm" method="post" enctype="multipart/form-data">
                                    <input name="proSeq" type="hidden" value="${proSeq}" /> 
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label" for="quarter"><strong>분기별 진행률</strong>
                                            </label>
                                            <c:forEach var="i" begin="1" end="${proQuarterCnt }" step="1" >
                                            <c:set var="tempName">quarter${i}</c:set>
                                            <div class="col-lg-2">${i }-Quarter<input type="number" class="form-control" id="quarter${i }" name="quarter${i }" value="${proQuarterList[tempName]}" autocomplete=off min="0" max="100" required="required">
                                            </div>
                                            </c:forEach>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="teamMember"><strong>팀원 등록 </strong>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="teamMember" name="teamMember" 
                                                value="${ TeamMember}" autocomplete=off >
                                            </div>
                                        </div>
										<button type="submit" class="btn btn-success infoModify" style="float: right;">저장하기</button>
									</form>
                                </div>
                            </div>
				</div>




			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

    
</body>

</html>
