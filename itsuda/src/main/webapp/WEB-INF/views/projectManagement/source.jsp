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
</head>

<body id="page-top" style="margin-top: 50px">

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/basicInfo"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/document"> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="../projectManagement/source"> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/library"> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/dbOject"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/issueManage"> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/projectManage"> <i class="fas fa-fw fa-folder"></i> <span>프로젝트 관리</span>
			</a></li>
		</ul>

				<div id="content-wrapper">

			<div class="container-fluid">

				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 버전 별 소스
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<tr>
										<td>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
										<td>2011/07/25</td>
										<td>$170,750</td>
									</tr>
									<tr>
										<td>Ashton Cox</td>
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>66</td>
										<td>2009/01/12</td>
										<td>$86,000</td>
									</tr>
								</tbody>
							</table>
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
