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

<!-- 스케쥴러 영역입니다. -->
<link
	href='${pageContext.request.contextPath}/projectManagementResource/scheduler/css/fullcalendar.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/projectManagementResource/scheduler/css/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='${pageContext.request.contextPath}/projectManagementResource/scheduler/js/jquery-1.10.2.js'
	type="text/javascript"></script>
<script
	src='${pageContext.request.contextPath}/projectManagementResource/scheduler/js/jquery-ui.custom.min.js'
	type="text/javascript"></script>
<script
	src='${pageContext.request.contextPath}/projectManagementResource/scheduler/js/fullcalendar.js'
	type="text/javascript"></script>

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
			<li class="nav-item "><a class="nav-link"
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

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<i class="fas fa-fw fa-folder fa-3x"></i>
					<li class="breadcrumb-item" style="margin-top: 10px">
						&nbsp;&nbsp;&nbsp;SUDA PAGE</li>
				</ol>

				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-chart-area"></i> 프로젝트 진행률
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="30"></canvas>
					</div>
				</div>

				<!--   스케쥴러 영역입니다      -->
				<div class="card mb-3">
					<div class="card-header">
						<strong>Schduler</strong>
					</div>
					<div id='calendar'></div>
				</div>

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
										<th>issue tracker</th>
									</tr>
								</thead>
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



	<script
		src="<c:url value='/projectManagementResource/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- Page level plugin JavaScript-->
	<script
		src="<c:url value='/projectManagementResource/vendor/chart.js/Chart.min.js'/>"></script>

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

	<script src="<c:url value='/projectManagementResource/js/demo/chart-area-demo.js'/>"></script>

</body>

</html>
