<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>

<%
	String path = request.getSession().getServletContext().getRealPath("/")+"resources/upload/";
	pageContext.setAttribute("path", path);	
//	System.out.println("######path:"+path);
%>

<script>
/*
 * 작성자 : 황유미
 * 작성일 : 2018-07-06 
 * 기능 : 스크롤 시 컨트롤러에 선언한 갯수만큼 불러온 데이터를 view에 append (ajax)
 */
var lastScrollTop = 0;
var date;
$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	if(currentScrollTop - lastScrollTop > 0){
		if(currentScrollTop >= $(document).height() - $(window).height()){
			var lastId = $(".col-md-4:last").data("id");
			var team = $("#team").val();
			console.log("team:"+team+", lastId:"+lastId);
			var newId;
			
			$.ajax({
				type:'POST',
				url:'selectLinkAjax',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					"seq" : lastId,
					"team" : team
				}),
				success:function(data){
					if(data != ""){
						var str = "";
						$(data).each(function(){
							date = formatData(this.last_dt);
							str += "<div class='col-md-4' data-id='" + this.seq + "'>";
							str += "<div class='panel panel-success'>";
							str += "<a class='library_edit_common detail_link' onclick='detail_link('"
									+ this.seq +"','"+ team +"','detail')'><i class='fas fa-stream'></i></a>";
							str += "<a class='library_edit_common del_link'>";
							str += "<input type='hidden' class='seq' value='" + this.seq + "'/>";
							str += "<input type='hidden' class='team' value='" + team + "'/>";
							str += "<i class='fas fa-trash-alt'></i>";
							str += "</a>";						
							str += "<div class='panel-body'>";
							str += "<p class='title'><b>" + this.title + "</b></p>";
							str += "<div class='library_info'>";
							str += "<a href='" + this.url + "'>";
							str += "<img class='card-img-top' data-src='" + this.path + "/" + date + "/" 
									+ this.f_name +"' alt='" + this.f_name + "' data-holder-rendered='true'/>";
							str += "</a>";
							str += "<span>" + this.description + "</span>";
							str += "</div>";						
							str += "<div class='library_rank'>";
							str += "<span>"+ this.author +"</span>";
							str += "<div>";
							for(var i=1; i<=5; i++)
							{
								if(i <= this.rank)
								{
									str += "<img src='../image/star_on.png' alt='star_on'/>";
								}
								else
								{
									str += "<img src='../image/star_off.png' alt='star_off'/>";
								}
							}
							str += "</div>";
							str += "</div>";
							str += "</div>";
							str += "<div class='panel-footer'>";
							str += "<p>" + this.hash_link + "</p>";
							str += "</div></div></div>";
						});
						$(".innerContainer").append(str);
						newId = newId - 5;
					}
				}
			});
			
			function formatData(date){
				//yyyy-MM-dd HH:mm:ss -> yyyyMMdd
			    var year = date.substring(0,4);
			    var month = date.substring(5,7);
			    var day = date.substring(8,10);
				return year + month + day;
			}			
			var position = $('.col-md-4[data-id=' + newId + ']').offset();
			$('html,body').stop().animate({scrollTop : position}, 1000, 'easeInQuint');				
		}		
	}
});
</script>
<div class="container">
	<div class="row innerContainer">
	
	${list.size()}
		<c:set var="path">${pageScope.path}${team}</c:set>
		<c:forEach var="i" items="${list}">
			<fmt:parseDate var="dateString" value="${i.last_dt}" pattern="yyyy-MM-dd HH:mm:ss" />
			<div class="col-md-4" data-id="${i.seq}">
				<div class="panel panel-success">
					<a class="library_edit_common detail_link" onclick="detail_link('${i.seq}','${team}','detail')">
						<i class="fas fa-stream"></i>
					</a>
					<a class="library_edit_common del_link">
						<input type="hidden" class="seq" value="${i.seq}"/>
						<input type="hidden" class="team" value="${team}"/>
						<i class="fas fa-trash-alt"></i>
					</a>	
					<div class="panel-body">
						<p class="title"><b>${i.title}</b></p>
						<div class="library_info">
							<a href="${i.url}">
								<img class="card-img-top" data-src="${path}/<fmt:formatDate value="${dateString}" pattern="yyyyMMdd"/>/${i.f_name}" 
								alt="${i.f_name}" data-holder-rendered="true">
							</a>
							<span>${i.description}</span>
						</div>
						<div class="library_rank">
							<span>${i.author}</span>
							<div>
								<c:forEach var="rank_star_on" begin="1" end="${i.rank}" step="1">
									<img src="../image/star_on.png" alt="star_on"/>
								</c:forEach>
								<c:forEach var="rank_star_off" begin="${i.rank+1}" end="5" step="1">
									<img src="../image/star_off.png" alt="star_off"/>
								</c:forEach>
							</div>
						</div>	
					</div>
					<div class="panel-footer">
						<div class="library_rank">
							<span>${i.hash_link}</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<input type="hidden" id="team" name="team" value="${team}"/>
	</div>
</div>
<script>
/*
 * 작성자 : 황유미
 * 작성일 : 2018-07-06
 * 최종수정일 : 2018-07-06 
 * 기능 : 아이콘들(절대 폭 값 : 120)과 겹치지 않도록 반응형으로 변경된 감지하여 타이틀 영역 width 설정
 * p.s. document 로딩 후 리사이징해야 하는 스크립트이기 때문에 페이지 하단에 작성
 */ 
var panelWidth = document.getElementsByClassName("panel-body").item(0)

if(panelWidth != null && panelWidth != undefined)
{
	panelWidth = panelWidth.offsetWidth - 120;
	var title = document.getElementsByClassName("title");
	for(var i=0; i<title.length; i++){
		title.item(i).style.width = panelWidth + "px";
	}
}
</script>