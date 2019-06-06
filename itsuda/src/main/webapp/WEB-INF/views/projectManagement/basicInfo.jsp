<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ include file="/WEB-INF/views/common/include/directives.jsp"%> --%>
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
<%--  <link href="${pageContext.request.contextPath}/projectManagementResource/test/css/style.css" rel="stylesheet"> --%>


</head>

<body id="page-top" style="margin-top: 50px">

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="../projectManagement/basicInfo?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/document?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/source?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/library?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/dbOject?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/issueManage?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/projectManage?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>프로젝트 관리</span>
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
<!-- 						<i class="fas fa-chart-area"></i>  -->
					기본정보 수정
					</div>
					<div class="card-body">
                        <div class="card"style="border-top:none;border-right:none;border-left:none;border-bottom:none;">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="../projectManagement/basicInfoModity" id="infoForm" method="post" enctype="multipart/form-data">
                                    <input name="seq" type="hidden" value="${info.seq}" /> 
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="proTitle"><strong>프로젝트 이름</strong>
                                            </label>
                                            <br>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="proTitle" name="proTitle" value="${info.proTitle }" autocomplete=off required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-10 col-form-label" for="description"><strong>프로젝트 설명</strong>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="description" name="description" value="${info.description }" autocomplete=off>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-10 col-form-label" for="term"><strong>프로젝트 기간 </strong>
                                            </label>
                                            <div class="col-lg-5">
                                            	<p style="float:left; margin-top:5px;">시작 날짜</p>
                                                <input type="text" class="form-control" id="startDt" name="startDt" 
                                                value="${info.startDt }" autocomplete=off style="float:right; width:80%;">
                                            </div>
                                            <div class="col-lg-5">
                                                <p style="float:left; margin-top:5px;">마감 날짜</p>
                                                <input type="text" class="form-control" id="endDt" name="endDt" 
                                                value="${info.endDt }" autocomplete=off style="float:right; width:80%;">
                                            </div>
                                        </div>
                                        
<!--                                         아이콘 등록 영역 -->

										<div class="form-group row">
											<label class="col-lg-10 col-form-label" for="description"><strong>프로젝트 아이콘 변경 </strong></label>
											<div id="fileDiv">
												<div class="form-group">
													<input type="file" name="file"  id="file" class="form-control-file" style="margin-left:15px;">
												</div>
											</div>
										</div>
											<button type="button" class="btn btn-success infoModify" style="float: right;">수정하기</button>
									</form>
                                </div>
                            </div>
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


	<script src="<c:url value='/projectManagementResource/test/common/common.min.js'/>"></script>
	<script src="<c:url value='/projectManagementResource/test/js/custom.min.js'/>"></script>
	<script src="<c:url value='/projectManagementResource/test/js/settings.js'/>"></script>
	<script src="<c:url value='/projectManagementResource/test/js/gleek.js'/>"></script>
	<script src="<c:url value='/projectManagementResource/test/js/styleSwitcher.js'/>"></script>
	
	<script src="<c:url value='/projectManagementResource/test/validation/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/projectManagementResource/test/validation/jquery.validate.min.js'/>"></script>
  
    
    <script type="text/javascript">
		//프로젝트 등록 버튼 클릭시 이벤트
		$('.infoModify').on("click", function() {
			 var fileNm = $("#file").val();
			 
			        var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
			     
			        if(fileNm == ""){
			        	$("#infoForm").submit();
			        }else {
			        	if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
				            alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
				        }else{
				        	$("#infoForm").submit();
				        }
			        }
		});
	</script>
	
	
</body>

</html>
