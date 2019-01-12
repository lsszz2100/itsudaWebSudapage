<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp" %>
<%@ page session="false" %>
<%
	String path = request.getSession().getServletContext().getRealPath("/")+"resources/upload/";
	pageContext.setAttribute("path", path);	
	System.out.println("######path:"+path);
%>
<!-- <script src="https://unpkg.com/masonry-layout@4.2.1/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/infinite-scroll@3/dist/infinite-scroll.pkgd.js"></script> -->
<script>
var lastScrollTop = 0;
$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	if(currentScrollTop - lastScrollTop > 0){
		if(currentScrollTop >= $(document).height() - $(window).height()){
			var lastId = $(".col-md-4:last").data("id");
			var team = $("#team").val();
			console.log("team:"+team);
			var newId;
			console.log("lastId:"+lastId);
			
			$.ajax({
				type:'POST',
				url:'scrollDownLinks',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					id : lastId,
					team : team
				}),
				success:function(data){
					if(data != ""){
						var str = "";
						$(data).each(function(){
							str += "<div class='col-md-4' data-id='"+this.id+"'>";
							str += "<div class='panel panel-success'>";
							str += "<div class='panel-body'>";
							str += "<img class='card-img-top' data-src='holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail' alt='Thumbnail [100%x225]' style='height: 225px; width: 100%; display: block;' src='data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22288%22%20height%3D%22225%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20288%20225%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1631c37f561%20text%20%7B%20fill%3A%23eceeef%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A14pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1631c37f561%22%3E%3Crect%20width%3D%22288%22%20height%3D%22225%22%20fill%3D%22%2355595c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2296.8359375%22%20y%3D%22118.8%22%3EThumbnail%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E' data-holder-rendered='true'>";
							str += "<p class='title'><b>"+this.title+"</b></p><p>id = "+ this.id +"</p><p>"+this.url+"</p><p>"+this.description+"</p><p>"+this.rank+"</p><p>"+this.author+"</p>";
							str += "</div>";
							str += "<div class='panel-footer'>";
							str += "<p>"+this.hashlink+"</p>";
							str += "</div></div></div>";
							
							/* $('.innerContainer').append(
								    $('<div>').attr('class','col-md-4')
								    		  .attr('data-id',this.id)
								    		  .append(
								        $('<div>').attr('class','panel panel-success').append(
								        	$('<div>').attr('class','panel-body').append(
								        		
								        		$('<img>').attr('class','panel-body').append(
								            $('<span>').attr('class', 'tab').append("Message center")
								)) ); */
						});
						
						$(".innerContainer").append(str);
						newId = newId - 5;
					}
				}
			});
			
			var position = $('.col-md-4[data-id=' + newId + ']').offset();
			$('html,body').stop().animate({scrollTop : position}, 1000, 'easeInQuint');				
		}		
		//lastScrollTop = currentScrollTop;
	}
});
</script>

<div class="container">
	<div class="row innerContainer">
		<c:set var="path">${pageScope.path}${team}</c:set>
		<c:forEach var="i" items="${list}">
			<fmt:parseDate var="dateString" value="${i.datetime}" pattern="yyyy-MM-dd HH:mm:ss" />
			<div class="col-md-4" data-id="${i.id}">
				<div class="panel panel-success">	
					<div class="panel-body">
						<a href="${i.url}">
							<img class="card-img-top" data-src="${path}/<fmt:formatDate value="${dateString}" pattern="yyyyMMdd"/>/${i.fname}" 
							alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" data-holder-rendered="true">
						</a>
						<p class="title"><b>${i.id}.${i.title}</b></p>
						<p>${i.description}</p>	
						<p>${i.rank}</p>
						<p>${i.author}</p>		
					</div>
					<div class="panel-footer">
						<p>${i.hashlink}</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<input type="hidden" name="team" id="team" value="${team}"/>
	</div>
</div>