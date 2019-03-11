<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>

<!-- calender event처리 script -->
<!-- src='/static/js/fullcalendar/locale/ko.js' 한글 패치 소스코드 입니다. -->


<script type="text/javascript">
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();
var day = y + '-' + m+1 + '-' + d;
var id;
var once=0;
$(document).ready(function() {
	
	// 달력
	$('#calendar').fullCalendar({
	      defaultDate: day,
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      header: {
          left: 'title',
          right: 'prev,next today'
	        },	  
	      dayClick: function() {//날짜 클릭시 반응하는 Event Handler
		      $('#calender-input-form').dialog({
		    	  title : '추가할 일정을 입력해주세요.',
		    	  width	: 300,
		    	  height : 335,
		    	  modal : true,
		      })
	        },
	      eventClick: function(event,element){
	    	  $('#modify-words').text(event.title);
	    	  $('#schedule-id1').val(event.id);
	    	  $('#schedule-id2').val(event.id);
	    	  $('#calender-remove-form').dialog({
		    	  title : '일정을 수정하거나 삭제 할 수 있습니다.',
		    	  width	: 500,
		    	  height : 420,
		    	  modal : true,
		      })
	      },
	   	  events: "../calendar/ajaxLoad.json"    
	   	  });
		
		/*function(start,end,callback){
		console.log("ajax 작동");
			$.ajax({ //AJAX 소스코드. Asynchronous Javascript And Xml.
				type: "GET",
				url: '../calendar/ajaxLoad.json',
				contentType:'application/json',
				dataType: 'json',
				//data:'CalendarInfo',
				success : function(data,text,request){//it is a function that processes the json data received from the Server
					var events=[];
					events=eval(data);
					callback(events);
				}
				
			});
		  }*/
		
	
		// 달력(리스트)
		$('#calendar-list').fullCalendar({
			header: {
		        left: 'title', 
		        center: '',
		        right: 'prev,next today'
		      },
			defaultView: 'listDay',
			defaultDate: day,//'2018-03-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: "../calendar/ajaxLoad.json"//데이터 증가 많아지면 AJAX 필요.
		});
		
  });
  

$(function() {
    //$.datepicker.setDefaults($.datepicker.regional['ko']); //datepicker 한국어로 사용하기 위한 언어설정
    $('#add-start-day').datetimepicker({
    	format:'Y-m-d H:i',
    	lang:'kr'
    });
    $('#add-end-day').datetimepicker({
    	format:'Y-m-d H:i',
    	lang:'kr'
    });
    $('#modify-start-day').datetimepicker({
    	format:'Y-m-d H:i',
    	lang:'kr'
    });
    $('#modify-end-day').datetimepicker({
    	format:'Y-m-d H:i',
    	lang:'kr'
    });
  });

</script>
<!-- TODO : CSS 통합 -->
<style type="text/css">
	/* 달력,공지사항 그리드 */
	.main-grid-1{ width: 100%; height: 100%; float: left;}
	/* 달력 css */
	#calendar{ width: 30%; min-width : 330px; height: 100%; font-size: 14px; float: left; padding-right: 10px;}
	#calendar > .fc-toolbar > .fc-left > h2, #calendar > .fc-header-toolbar > .fc-left > h2{ font-size: 20px;}
	
	/* 공지사항 css */
	.notice-grid{ width: 70%; min-width:330px; height: 100%; float: left;}
	.nav-notice , .tab-content-notice{ float: left; width: 100%; min-width:330px;}
	.list-notice-front{ float: left; }
	.list-notice-back{ float: right; }
	.list-notice-front:active, .list-notice-front:hover{ text-decoration: none; }
	
	/* 일정 리스트,커뮤니티 그리드 */
	.main-grid-2{ width: 100%; height: 100%; float: left;}
	
	/* 리스트 일정 css */
	#calendar-list{ width: 30%; min-width : 330px; height: 100%; font-size: 14px; float: left; padding-right: 10px;}
	#calendar-list > .fc-toolbar > .fc-left > h2, #calendar-list > .fc-header-toolbar > .fc-left > h2{ font-size: 20px;}
	
	/* 커뮤니티 css */
	.community-grid{ width: 70%; min-width:330px; height: 100%; float: left;}
	.nav-community , .tab-content-community{ float: left; width: 100%; min-width:330px;}
	.list-community-front{ float: left;}
	.list-community-back{ float: right;}
	.list-community-front:active, .list-community-front:hover{ text-decoration: none;}
	
	/* 댓글, 태그 그리드 */
	.main-grid-3{ width: 100%; height: 100%; float: left;}
	
	/* 댓글 css */
	.reply-grid{ width: 70%; min-width:330px; height: 100%; min-width: 330px;}
	.nav-reply , .tab-content-reply{ float: left; width: 100%; min-width:330px;}
	
	.tab-pane-reply{ overflow: scroll; height: 244px;}
	.list-reply-front{ float: left;}
	.list-reply-back{ float: right;}
	.list-reply-front:active, .list-reply-front:hover{ text-decoration: none;}
	
	/* 태그 css*/
	.tab-pane-tag{ overflow: scroll; height: 244px;}
	.list-tag-front{ float: left;}
	.list-tag-back{ float: right;}
	.list-tag-front:active, .list-tag-front:hover{ text-decoration: none;}
	

	
</style>

<div class="container" style="padding-top: 60px;">
	<div class="main-grid-1">
		<!-- 달력 -->
		<div id="calendar"></div>
		<!-- 달력 일정 입력 -->
		<div id="calender-input-form" style="display:none;">
			<form method="POST" action="/itsuda/calendar/insertInd">
			  <div class="form-group">
			    <input type="text" class="form-control" id="title" name="title" placeholder="일정을 입력하세요." autocomplete="off">
			  </div>
			  <div class="form-group">
			  	<input type="text" class="form-control" id="add-start-day" name="add-start-day" placeholder="시작하는 날을 입력하세요." autocomplete="off">
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" id="add-end-day" name="add-end-day" placeholder="끝나는 날을 입력하세요." autocomplete="off">
			  </div>
			  <div class="checkbox">    
			    <label>
			      <input type="checkbox" name="schAllDay" value="true"> 하루종일 
			    </label>
			   </div>
			   <div class="radiobox">
			    <label>
			      <input checked="checked" type="radio" name="type" value="private"> Private 
			    </label>
			    <label>
			      <input type="radio" name="type" value="public"> Public 
			    </label>
			  </div>
			  <button type="submit" class="btn btn-warning">일정 추가하기</button>
			</form>
		</div>
		<!-- 달력 일정 컨트롤-->
		<div id="calender-remove-form" style="display:none;">
			<nav class="nav-notice">
			  <div class="nav nav-tabs nav-tabs-notice" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-modify-tab" data-toggle="tab" href="#nav-modify" role="tab" aria-controls="nav-modify" aria-selected="true">일정 수정</a>
			    <a class="nav-item nav-link" onclick="AppendID()" id="nav-remove-tab" data-toggle="tab" href="#nav-remove" role="tab" aria-controls="nav-remove" aria-selected="false">일정 삭제</a>
			  </div>
			</nav>
			<!-- 일정 수정 란 -->
			<div class="tab-content tab-content-notice" id="nav-tabContent">
			  <div class="tab-pane fade show active" id="nav-modify" role="tabpanel" aria-labelledby="nav-home-tab">
			    <p><b id="modify-words"></b>일정에 대한 수정사항을 입력해주세요.</p>
			  	<form method="POST" action="/itsuda/calendar/modifyInd">
				  <input type="hidden" id="schedule-id1" name="scheduleID" value="null">
				  <div class="form-group">
				    <input type="text" class="form-control" id="title" name="title" placeholder="일정을 입력하세요." autocomplete="off">
				  </div>
				  <div class="form-group">
				  	<input type="text" class="form-control" id="modify-start-day" name="modify-start-day" placeholder="시작하는 날을 입력하세요." autocomplete="off">
				  </div>
				  <div class="form-group">
				    <input type="text" class="form-control" id="modify-end-day" name="modify-end-day" placeholder="끝나는 날을 입력하세요." autocomplete="off">
				  </div>
				  <div class="checkbox">
				  	<label>
				      <input type="checkbox" name="schAllDay" value="true"> 하루종일 
				    </label>
				  </div>
				  <div class="radiobox">
				    <label>
				      <input type="radio" checked="checked" name="type" value="private"> Private 
				    </label>
				    <label>
				      <input type="radio" name="type" value="public"> Public 
				    </label>
				    
				  </div>
				  <button type="submit" class="btn btn-warning">일정 수정하기</button>
				</form>
			  </div>
			  
			  <!-- 일정 삭제 란 -->
			  <div class="tab-pane fade" id="nav-remove" role="tabpanel" aria-labelledby="nav-profile-tab">
			  	<form action="../calendar/deleteInd" method="POST">
				  	<input type="hidden" id="schedule-id2" name="scheduleID" value="null">
				  	<div>
					 <p>삭제한 일정은 복구할 수 없습니다.</p>
					 <p>정말 삭제하시겠습니까?</p>
					 </div>
				  	 <input type="submit" class="btn btn-warning" value="삭제하기">
			  	 </form>
			  </div>
			</div>
		</div>
		<!-- 공지사항 시작 -->
		<div class="notice-grid">
			<nav class="nav-notice">
			  <div class="nav nav-tabs nav-tabs-notice" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">공통공지</a>
			    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">추가공지</a>
		
			  </div>
			</nav>
			<div class="tab-content tab-content-notice" id="nav-tabContent">
			  <div class="tab-pane fade show active tab-pane-notice" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-notice-front">최근 공지</a><span class="list-notice-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-notice-front">2번 공지</a><span class="list-notice-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-notice-front">3번 공지</a><span class="list-notice-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-notice-front">4번 공지</a><span class="list-notice-back">2018-12-25</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-notice-front">길이테스트테스트테스트테...</a><span class="list-notice-back">2019-01-10</span></li>		  
				</ul>
			  </div>
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">추가 내용</div>
			</div>
		</div>
		<!-- 공지사항 끝 -->
	</div>

	
	
	<div class="main-grid-2">
		<!-- 달력(리스트) -->
		<div id="calendar-list"></div>
		<!-- 커뮤니티 시작 -->
		<div class="community-grid">
			<nav class="nav-community">
			  <div class="nav nav-tabs nav-tabs-community" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-design-tab" data-toggle="tab" href="#nav-design" role="tab" aria-controls="nav-design" aria-selected="true">DESIGN</a>
			    <a class="nav-item nav-link" id="nav-mobile-tab" data-toggle="tab" href="#nav-mobile" role="tab" aria-controls="nav-mobile" aria-selected="false">MOBILE</a>
			    <a class="nav-item nav-link" id="nav-plan-tab" data-toggle="tab" href="#nav-plan" role="tab" aria-controls="nav-plan" aria-selected="false">PLAN</a>
			    <a class="nav-item nav-link" id="nav-web-tab" data-toggle="tab" href="#nav-web" role="tab" aria-controls="nav-web" aria-selected="false">WEB</a>
			  </div>
			</nav>
			
			<div class="tab-content tab-content-community" id="nav-tabContent">
			  <div class="tab-pane fade show active tab-pane-community" id="nav-design" role="tabpanel" aria-labelledby="nav-design-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-community-front">디자인 1</a><span class="list-community-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">디자인 2</a><span class="list-community-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">디자인 3</a><span class="list-community-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-community-front">디자인 4</a><span class="list-community-back">2018-12-25</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-community-front">디자인 5</a><span class="list-community-back">2018-12-25</span></li>		  
				</ul>
			  </div>
			  <div class="tab-pane fade show tab-pane-community" id="nav-mobile" role="tabpanel" aria-labelledby="nav-mobile-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-community-front">모바일 1</a><span class="list-community-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">모바일 2</a><span class="list-community-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">모바일 3</a><span class="list-community-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-community-front">모바일 4</a><span class="list-community-back">2018-12-25</span></li> 		  
				  <li class="list-group-item"><a href="#" class="list-community-front">&nbsp</a><span class="list-community-back">&nbsp</span></li> 		  
				</ul>
			  </div>
			  <div class="tab-pane fade show tab-pane-community" id="nav-plan" role="tabpanel" aria-labelledby="nav-plan-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-community-front">기획 1</a><span class="list-community-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">기획 2</a><span class="list-community-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">기획 3</a><span class="list-community-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-community-front">기획 4</a><span class="list-community-back">2018-12-25</span></li> 		  
				  <li class="list-group-item"><a href="#" class="list-community-front">&nbsp</a><span class="list-community-back">&nbsp</span></li> 		  
				</ul>
			  </div>
			  <div class="tab-pane fade show tab-pane-community" id="nav-web" role="tabpanel" aria-labelledby="nav-web-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-community-front">웹 1</a><span class="list-community-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">웹 2</a><span class="list-community-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-community-front">웹 3</a><span class="list-community-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-community-front">웹 4</a><span class="list-community-back">2018-12-25</span></li> 		  
				  <li class="list-group-item"><a href="#" class="list-community-front">&nbsp</a><span class="list-community-back">&nbsp</span></li> 		  
				</ul>
			  </div>
			</div>
		</div>
		<!-- 커뮤니티 끝 -->
	</div>
	
	<div class="main-grid-3">
		<div class="reply-grid">
			<nav class="nav-reply">
			  <div class="nav nav-tabs nav-tabs-reply" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-reply-tab" data-toggle="tab" href="#nav-reply" role="tab" aria-controls="nav-reply" aria-selected="true">게시물 댓글</a>
			    <a class="nav-item nav-link" id="nav-tag-tab" data-toggle="tab" href="#nav-tag" role="tab" aria-controls="nav-tag" aria-selected="false">태그</a>
			  </div>
			</nav>
			<div class="tab-content tab-content-reply" id="nav-tabContent">
			  <div class="tab-pane fade show active tab-pane-reply" id="nav-reply" role="tabpanel" aria-labelledby="nav-reply-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-reply-front">최근 공지</a><span class="list-reply-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-reply-front">2번 공지</a><span class="list-reply-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-reply-front">3번 공지</a><span class="list-reply-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-reply-front">4번 공지</a><span class="list-reply-back">2018-12-25</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-reply-front">길이테스트테스트테스트테...</a><span class="list-reply-back">2019-01-10</span></li>		  
				</ul>
			  </div>
			  <div class="tab-pane fade show tab-pane-tag" id="nav-tag" role="tabpanel" aria-labelledby="nav-tag-tab">
			  	<ul class="list-group list-group-flush">
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 안녕하세요</a><span class="list-tag-back">2019-01-10</span></li>
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 질문입니다1. 어쩌고저쩌고... </a><span class="list-tag-back">2019-01-09</span></li>
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 질문입니다2. 어쩌고저쩌고... </a><span class="list-tag-back">2019-01-08</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 질문입니다3. 어쩌고저쩌고... </a><span class="list-tag-back">2018-12-25</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 질문입니다4. 어쩌고저쩌고... </a><span class="list-tag-back">2019-01-10</span></li>		  
				  <li class="list-group-item"><a href="#" class="list-tag-front">황준영 : 질문입니다5. 어쩌고저쩌고... </a><span class="list-tag-back">2019-01-10</span></li>		  
				</ul>
			  </div>
			</div>
		</div>
	</div>
	
	
</div>
	