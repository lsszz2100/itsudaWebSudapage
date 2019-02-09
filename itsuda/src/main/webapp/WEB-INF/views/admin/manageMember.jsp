<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#tBody{
		background:#FFF;
	}
	#tBody .ui-selected{
		background:#FFCCCC;
	}
	#tBody .ui-selecting{
		background:#CCCCFF;
	}
</style>

<script>
	$(document).ready(function(){
		$('#tBody').selectable({
			filter:"tr",
			selected:selectedEvent,
			unselected:selectedEvent
		});
	});
	
	function selectedEvent(event,ui){
		var eEmail = "";
		var eName = "";
		/* optional information
		var eTeam = "";
		var eGrade = "";
		*/
		$("#selectedEmail").val("");
		$("#eName").val("");
		
		var selectedObj = $(ui.selected);
		var unselectedObj = $(ui.unselected);
		
		//표에서 선택한 정보 취득
		$(this).find(".ui-selected").each(function(){
			eEmail += $(this).find("#eEmail").text();
			eName += $(this).find("#eName").text();
			
			$("#first-hidden-email").val(eEmail);
			$("#second-hidden-email").val(eEmail);
			
			$("#selectedEmail").text(eEmail);
			$("#selectedName").val(eName);
			$("#dialog-modify").dialog({
				title : "회원 정보 수정",
				width : 450,
				modal : true
			});
		});
		
		//unselected 이벤트 처리를 위한 코드
		//unselected 될 경우 해당 선택 데이터 취소
		if(ui.unselected != undefined){
			modemNum=modemNum.replace(unselectedObj.find("#eEmail").text(), "");
			$("#selectedModemNum").val(eEmail);
		}
		
		//$("#selectedModemNum").val(modemNum);
		
	}
</script>

<div class="container" style="padding-top: 60px;">
	<div>
		<h1>회원 관리</h1>
		
		<table class="table table-hover" id="member-info">
			<tr class="warning">
				<td>이메일</td>
				<td>성명</td>
				<td>소속 팀</td>
				<td>회원 등급</td>
			</tr>
			<tbody id="tBody">
				<c:forEach var="member" items="${members}">
					<tr>
						<td id="eEmail">${member.email}</td>
						<td id="eName">${member.name}</td>
						<td id="eTeam">${member.team}</td>
						<td>
							<c:choose>
								<c:when test="${member.grade == 0}">
									PM
								</c:when>
								<c:when test="${member.grade == 1}">
									PL
								</c:when>
								<c:when test="${member.grade == 2}">
									팀원
								</c:when>
								<c:when test="${member.grade == 3}">
									준회원
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<form class="form-inline" style="margin-left:32%" action="manage" method="GET">
		  <div class="form-group">
		    <select class="form-control" name="dType">
			  <option value="email">이메일</option>
			  <option value="name">성명</option>
			  <option value="team">소속</option>
			  <option value="grade">회원 등급</option>
			</select>
		  </div>
		  <div class="form-group">
		    <input type="text" class="form-control" autocomplete="off" name="search">
		  </div>
		  <button type="submit" class="btn btn-info">검색</button>
		</form>
	</div>
</div>

<div id="dialog-modify" style="display:none;">
	<form class="form-inline" action="initPW" method="POST">
		<pre><b id="selectedEmail"></b>               <input type="submit" class="btn-danger" value="비밀번호 초기화"></pre>
		
		<input id="first-hidden-email" type="hidden" name="selectedEmail">
	</form>
	
	<form action="modifyMemInfo" method="POST">
		<input id="second-hidden-email" type="hidden" name="selectedEmail">
		<table>
			<tr>
				<td><label>성명</label></td>
				<td><input id="selectedName" type="text" name="selectedName"></td>
			</tr>
			<tr>
				<td><label>소속</label></td>
				<td>
				    <select class="form-control" name="selectedTeam">
					  <option value="DESIGN">DESIGN</option>
					  <option value="PLAN">PLAN</option>
					  <option value="APP">APP</option>
					  <option value="WEB">WEB</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>회원등급</label></td>
				<td>
				    <select class="form-control" name="selectedGrade">
					  <option value="0">PM</option>
					  <option value="1">PL</option>
					  <option value="2">팀원</option>
					  <option value="3">준회원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input class="btn-info" type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>
</div>