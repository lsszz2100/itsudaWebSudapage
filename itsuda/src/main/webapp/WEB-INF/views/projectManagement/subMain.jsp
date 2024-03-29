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
				href="../projectManagement/basicInfo?seq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>기본정보 수정</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../documentBoard/DoMain?page=1&perPageNum=10&keyword=&proSeq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>산출 문서</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../sourceBoard/SoMain?page=1&perPageNum=10&keyword=&proSeq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>버젼 별 소스</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../libraryBoard/LiMain?page=1&perPageNum=10&keyword=&proSeq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>라이브러리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../dbOjectBoard/DBMain?page=1&perPageNum=10&keyword=&proSeq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>DB Object</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../issueManageBoard/IsMain?page=1&perPageNum=10&keyword=&proSeq=${info.seq }"> <i class="fas fa-fw fa-folder"></i> <span>이슈 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/projectManage?proSeq=${info.seq}"> <i class="fas fa-fw fa-folder"></i> <span>프로젝트 관리</span>
			</a></li>
			<li class="nav-item "><a class="nav-link"
				href="../projectManagement/main?proYear=2019&proStatus=P"> <i class="fas fa-fw fa-undo-alt"></i> <span>프로젝트 목록</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- 프로젝트 이름과 아이콘-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
					<c:if test="${iconVO != null}">
						<img src="/projectIconFile/${iconVO}" width="48">
						</c:if>
						&nbsp;&nbsp;&nbsp;<strong>${info.proTitle }</strong></li>
						
				</ol>
<!-- 				프로젝트 설명 영역 -->
				<c:if test="${info.description != null}">
				<ol class="breadcrumb">
					<li class="breadcrumb-item" >
						${info.description }</li>
				</ol>
				</c:if>
				

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
		
		var quarterArry = new Array();
		var quarterProArry = new Array();
		var quarter0 = 0;
		var quarter1 = ${proQuarterList.quarter1};
		var quarter2 = ${proQuarterList.quarter2};
		var quarter3 = ${proQuarterList.quarter3};
		var quarter4 = ${proQuarterList.quarter4};
		var quarter5 = ${proQuarterList.quarter5};
		var quarter6 = ${proQuarterList.quarter6};
		var quarter7 = ${proQuarterList.quarter7};
		var quarter8 = ${proQuarterList.quarter8};
		var quarter9 = ${proQuarterList.quarter9};
		var quarter10 = ${proQuarterList.quarter10};
		var quarter11 = ${proQuarterList.quarter11};
		var quarter12 = ${proQuarterList.quarter12};
		var quarterPro = "";
		
		
		for(var i=1; i <= ${proQuarterCnt}; i++){
			quarterArry[i] = 'Q'+i;
		}
		
		for(var i=0; i <= ${proQuarterCnt}; i++){
			quarterPro = eval("quarter"+i);
			quarterProArry[i] = quarterPro;
		}
		
		var ctx = document.getElementById("myAreaChart");
		var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: {
			labels: quarterArry,
		    datasets: [{
		      label: "Sessions",
		      lineTension: 0.3,
		      backgroundColor: "rgba(2,117,216,0.2)",
		      borderColor: "rgba(2,117,216,1)",
		      pointRadius: 5,
		      pointBackgroundColor: "rgba(2,117,216,1)",
		      pointBorderColor: "rgba(255,255,255,0.8)",
		      pointHoverRadius: 5,
		      pointHoverBackgroundColor: "rgba(2,117,216,1)",
		      pointHitRadius: 50,
		      pointBorderWidth: 2,
		      data: quarterProArry,
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 100,
		          maxTicksLimit: 5
		        },
		        gridLines: {
		          color: "rgba(0, 0, 0, .125)",
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
		
	</script>

<%-- 	<script src="<c:url value='/projectManagementResource/js/demo/chart-area-demo.js'/>"></script> --%>

</body>

</html>
