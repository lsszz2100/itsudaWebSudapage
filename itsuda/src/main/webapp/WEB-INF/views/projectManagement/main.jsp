<!-- 프로젝트 관리 -->
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

<title>SB Admin - Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body id="page-top" style="margin-top: 50px">

	<div id="wrapper">
		<div>
			<button type='button' class='btn btn-success'
				data-toggle='modal' data-target='#projectCreateModal'
				style="margin-top: 10px; width: 100%; border-radius: 0; ">프로젝트 등록</button>
				
			<ul class="sidebar navbar-nav" style="height:100%;">
				<c:choose>
					<c:when test="${!empty year}">
						<c:forEach var="year" varStatus="i" items="${year }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>${year.proYear}</span>
							</a>
								<div class="dropdown-menu" aria-labelledby="pagesDropdown">
								<c:if test="${year.pcount > 0 }">
									<a class="dropdown-item"
										href="../projectManagement/main?proYear=${year.proYear}&proStatus=P">진행중</a>
								</c:if>
								<c:if test="${year.ecount > 0 }">
									<a class="dropdown-item"
										href="../projectManagement/main?proYear=${year.proYear}&proStatus=E">진행
										완료</a>
								</c:if>
								</div></li>
						</c:forEach>
					</c:when>
				</c:choose>

			</ul>
		</div>

		<div id="content-wrapper">

			<div class="container-fluid">
				<!-- 프로젝트 목록 영역 -->
				<div 
					style="height: 1400px; width: 25%; float: left; margin-right: 10px;">

					<!-- 	Breadcrumbs -->
					<c:if test="${status == 'P'}">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><strong>Proceeding Project</strong></li>
						</ul>
					</c:if>
					<c:if test="${status == 'E'}">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><strong>Ended Project</strong></li>
						</ul>
					</c:if>


					<c:forEach items="${proList }" var="item">
						<c:if test="${item.proStatus == 'P'}">
							<!-- Icon Cards -->
							<div>
								<div class="col-xl-12 col-sm-6 mb-3">
									<div class="card text-white bg-primary o-hidden h-100" onclick="location.href='../projectManagement/main?proYear=${item.proYear}&proStatus=${item.proStatus}&seq=${item.seq}&proSeq=${item.seq}'">
										<div class="card-body">
											<div class="card-body-icon">
												<i class="fas fa-fw fa-walking"></i>
											</div>
											<div class="mr-5" >${item.proTitle}</div>
										</div>
										<a class="card-footer text-white clearfix small z-1"
											href="../projectManagement/subMain?seq=${item.seq}&proSeq=${item.seq}"> <span
											class="float-left">View Details</span> <span
											class="float-right"> <i class="fas fa-angle-right"></i>
										</span>
										</a>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${item.proStatus == 'E'}">
							<!-- Icon Cards -->
							<div>
								<div class="col-xl-12 col-sm-6 mb-3">
									<div class="card text-white bg-danger o-hidden h-100" onclick="location.href='../projectManagement/main?proYear=${item.proYear}&proStatus=${item.proStatus}&seq=${item.seq}&proSeq=${item.seq}'">
										<div class="card-body">
											<div class="card-body-icon">
												<i class="fas fa-fw fa-user-graduate"></i>
											</div>
											<div class="mr-5">${item.proTitle}</div>
										</div>
										<a class="card-footer text-white clearfix small z-1"
											href="../projectManagement/subMain?seq=${item.seq}&proSeq=${item.seq}"> <span
											class="float-left">View Details</span> <span
											class="float-right"> <i class="fas fa-angle-right"></i>
										</span>
										</a>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				
				<!-- 프로젝트 이름과 아이콘-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
					<c:if test="${iconVO != null}">
						<img src="/projectIconFile/${iconVO}" width="48">
						</c:if>
						&nbsp;&nbsp;&nbsp;<strong>${proInfo.proTitle }</strong></li>
						
				</ol>
				
				<!-- 프로젝트 설명 영역 -->
				<c:if test="${proInfo.description != null}">
				<ol class="breadcrumb">
					<li class="breadcrumb-item" >
						${proInfo.description }</li>
				</ol>
				</c:if>
				
				<div class="card mb-3">
					<div class="card-header">
						<!--             <i class="fas fa-table"></i> -->
						<strong>TeamMember</strong>
					</div>
					<c:if test="${!empty TeamMember }">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tbody>
									<tr>
										<td>${ TeamMember.teamMember}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
				</div>
				
				<!-- object 영역 -->
				<div class="card mb-3">
					<div class="card-header">
						<!--             <i class="fas fa-table"></i> -->
						<strong>Object</strong>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tbody>
									<tr>
										<td>작업 중 object</td>
										<td>${cntGo }</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>버그 수정 object</td>
										<td>${cntBug }</td>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td>작업 완료 object</td>
										<td>${cntEnd }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- 코멘트 영역 -->
				<div class="card mb-3">
					<div class="card-header">
						<!--             <i class="fas fa-table"></i> -->
						<strong>Comments</strong>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<td><strong>글제목</strong></td>
										<td><strong>개수</strong></td>
									</tr>
								</thead>
								<c:forEach var="commentList" varStatus="i" items="${commentList }">
								<c:if test="${!empty commentList }">
								<tbody>
									<tr>
										<td>${commentList.commentTitle }</td>
										<td>${commentList.commentCnt }</td>
									</tr>
								</tbody>
								</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>

				<!-- 스케쥴러 영역 -->
				<div class="card mb-3">
					<div class="card-header">
						<!-- 						<i class="fas fa-chart-area"></i> -->
						<strong>Schduler</strong>
					</div>

					<!-- 			      스케쥴러 영역입니다      -->
					<div id='calendar'></div>

				</div>


			</div>
		</div>
	</div>

	<section>
		<!-- 프로젝트 등록 영역 -->
		<div class="modal fade" id="projectCreateModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title">프로젝트 등록</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>

					</div>
					<div class="modal-boby" style="padding: 20px;">
						<div class="form-group">
							<label for="ctrProTitle">프로젝트 이름</label> 
							<input type="text"
								class="form-control" id="ctrProTitle"
								name="ctrProTitle" required>
						</div>
						<div class="form-group">
							<label for="ctrProYear">프로젝트 시작 년도</label> 
							<input  type="number"
								class="form-control" id="ctrProYear" min="2015" max="2020"
								name="ctrProYear" required>
						</div>
						<div class="form-group">
							<label for="ctrProRegistrant">프로젝트 등록자</label> 
							<input  type="text"
								class="form-control" id="ctrProRegistrant"
								name="ctrProRegistrant" required>
						</div>
						<div class="form-group">
							<label for="ctrProStatus">프로젝트 상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
							<input type="radio"
								id="ctrProStatus"
								name="ctrProStatus" value="P" >&nbsp;&nbsp;진행중&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio"
								id="ctrProStatus"
								name="ctrProStatus" value="E" >&nbsp;&nbsp;진행 완료
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success modalAdd">등록하기</button>
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal"
							style="background-color: #BDBDBD; color: #ffffff;">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

<!-- 체크박스 하나만 걸어주기 -->
	<script type="text/javascript">
		function oneCheckbox(a) {
			var obj = document.getElementsByName("ctrProStatus");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != a) {
					obj[i].checked = false;
				}
			}
		}
	</script>


	<script type="text/javascript">
		//프로젝트 등록 버튼 클릭시 이벤트
		$('.modalAdd').on("click", function() {

			// data 셋팅
			var title = $("#ctrProTitle").val();
			var year = $("#ctrProYear").val();
			var registrant = $("#ctrProRegistrant").val();
			var status = $('input[name="ctrProStatus"]:checked').val();
// 			alert(title);
 			if(title == null || title == ""){
 				alert("프로젝트 이름을 입력해주세요.");
 			}else if(year == null || year == "" || 2015 > year || 2020 < year){
 				alert("프로젝트 시작 년도를 입력해주세요.(범위 : 2015년 ~2020년)");
 			}else if(registrant == null || registrant == ""){
 				alert("프로젝트 등록자를 입력해주세요.");
 			}else if(status == null || status == ""){
 				alert("프로젝트 상태를 체크해주세요.");
 			}else{
 				self.location = 
 					 "../projectManagement/addProject?proYear=" +year+ "&proTitle=" +title+ "&registrant=" +registrant+ "&proStatus=" +status;
 			}
		});
	</script>
	<!--         스케쥴러 영역입니다 -->
	<script>
		$(document).ready(
				function() {
					var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();

					/*  className colors

					className: default(transparent), important(red), chill(pink), success(green), info(blue)

					 */

					/* initialize the external events
					-----------------------------------------------------------------*/

					$('#external-events div.external-event').each(function() {

						// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
						// it doesn't need to have a start or end
						var eventObject = {
							title : $.trim($(this).text())
						// use the element's text as the event title
						};

						// store the Event Object in the DOM element so we can get to it later
						$(this).data('eventObject', eventObject);

						// make the event draggable using jQuery UI
						$(this).draggable({
							zIndex : 999,
							revert : true, // will cause the event to go back to its
							revertDuration : 0
						//  original position after the drag
						});

					});

					/* initialize the calendar
					-----------------------------------------------------------------*/

					var calendar = $('#calendar').fullCalendar(
							{
								header : {
									left : 'title',
									center : 'agendaDay,agendaWeek,month',
									right : 'prev,next today'
								},
								editable : true,
								firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
								selectable : true,
								defaultView : 'month',

								axisFormat : 'h:mm',
								columnFormat : {
									month : 'ddd', // Mon
									week : 'ddd d', // Mon 7
									day : 'dddd M/d', // Monday 9/7
									agendaDay : 'dddd d'
								},
								titleFormat : {
									month : 'MMMM yyyy', // September 2009
									week : "MMMM yyyy", // September 2009
									day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
								},
								allDaySlot : false,
								selectHelper : true,
								select : function(start, end, allDay) {
									var title = prompt('Event Title:');
									if (title) {
										calendar.fullCalendar('renderEvent', {
											title : title,
											start : start,
											end : end,
											allDay : allDay
										}, true // make the event "stick"
										);
									}
									calendar.fullCalendar('unselect');
								},
								droppable : true, // this allows things to be dropped onto the calendar !!!
								drop : function(date, allDay) { // this function is called when something is dropped

									// retrieve the dropped element's stored Event Object
									var originalEventObject = $(this).data(
											'eventObject');

									// we need to copy it, so that multiple events don't have a reference to the same object
									var copiedEventObject = $.extend({},
											originalEventObject);

									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = allDay;

									// render the event on the calendar
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									$('#calendar').fullCalendar('renderEvent',
											copiedEventObject, true);

									// is the "remove after drop" checkbox checked?
									if ($('#drop-remove').is(':checked')) {
										// if so, remove the element from the "Draggable Events" list
										$(this).remove();
									}

								},

								events : [ {
									title : 'All Day Event',
									start : new Date(y, m, 1)
								}, {
									id : 999,
									title : 'Repeating Event',
									start : new Date(y, m, d - 3, 16, 0),
									allDay : false,
									className : 'info'
								}, {
									id : 999,
									title : 'Repeating Event',
									start : new Date(y, m, d + 4, 16, 0),
									allDay : false,
									className : 'info'
								}, {
									title : 'Meeting',
									start : new Date(y, m, d, 10, 30),
									allDay : false,
									className : 'important'
								}, {
									title : 'Lunch',
									start : new Date(y, m, d, 12, 0),
									end : new Date(y, m, d, 14, 0),
									allDay : false,
									className : 'important'
								}, {
									title : 'Birthday Party',
									start : new Date(y, m, d + 1, 19, 0),
									end : new Date(y, m, d + 1, 22, 30),
									allDay : false,
								}, {
									title : 'Click for Google',
									start : new Date(y, m, 28),
									end : new Date(y, m, 29),
									url : 'http://google.com/',
									className : 'success'
								} ],
							});

				});
	</script>
</body>

</html>
