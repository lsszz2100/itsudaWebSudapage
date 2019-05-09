<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 글 상세 목록 세부 사항 -->
<div class="container col-md-6" style="padding-top: 100px;">
    <div class="card">
        <div class="card-body" >
            <h4 class="card-title mb-3">${vo.title }</h4>
            <h6 class="card-subtitle text-muted mb-4">
                <i class="far fa-user"></i> ${vo.writer }
                ·
                <i class="far fa-clock"></i> ${vo.crtDt }
                ·
                <i class="fas fa-align-justify"></i> ${vo.viewCnt }
            </h6>
            <p class="card-text">${vo.description }</p>
        </div>
        <div class="card-body">
            <button type="button"class="btn btn-info" onclick="location.href='../community/modify?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq}&team=${param.team}'">수정</button>
            <button type="button"class="btn btn-info" onclick="location.href='../community/delete?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq}&team=${param.team}'">삭제</button>
        </div>
        <div class="card-body">
	           <button type="button"class="btn btn-info" onclick="location.href='../community/main?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&team=${param.team}'">목록으로 </button>

        </div>
    </div>
</div>

 <section class="content container-fluid" style="margin-top:40px;"> 
<!-- <!-- 댓글 등록 영역 --> 


<!--                 <div class="box box-warning"> -->
<!--                     <div class="box-header with-border"> -->
<!--                         <a class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글작성</a> -->
<!--                     </div> -->
<!--                     <div class="box-body"> -->
<!--                         <form class="form-horizontal"> -->
<!--                             <div class="form-group margin"> -->
<!--                                 <div class="col-sm-10" style="float:left; padding : 10px"> -->
<!--                                     <textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글을 입력해주세요..." style="resize: nonel"></textarea> -->
<!--                                 </div>	 -->
<!--                                 <div class="col-sm-2" style="float:left; padding : 10px"> -->
<!--                                     <input class="form-control" id="newReplyWriter" type="text" placeholder="작성자"> -->
<!--                                 </div> -->
<!--                                 <hr/> -->
<!--                                 <div class="col-sm-2" style="float:left"> -->
<!--                                     <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
	
<%-- 	<%--댓글 목록 영역--%> 
<!--                 <div class="box box-success collapsed-box"> -->
<%--                     댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기 --%>
<!--                     <div class="box-header with-border"> -->
<!--                         <a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i> </a> -->
<!--                         <div class="box-tools"> -->
<!--                             <button type="button" class="btn btn-box-tool" data-widget="collapse"> -->
<!--                                 <i class="fa fa-plus"></i> -->
<!--                             </button> -->
<!--                         </div> -->
<!--                     </div> -->
<%--                     댓글 목록 --%>
<!--                     <div class="box-body repliesDiv"> -->

<!--                     </div> -->
<%--                     댓글 페이징 --%>
<!--                     <div class="box-footer"> -->
<!--                         <div class="text-center"> -->
<!--                             <ul class="pagination pagination-sm no-margin"> -->

<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
                
                
                <%--                 댓글 수정을 위한 modal 영역 --%>
<!--                 <div class="modal fade" id="modModal"> -->
<!--                     <div class="modal-dialog"> -->
<!--                         <div class="modal-content"> -->
<!--                             <div class="modal-header"> -->
<!--                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                                     <span aria-hidden="true">&times;</span></button> -->
<!--                                 <h4 class="modal-title">댓글수정</h4> -->
<!--                             </div> -->
<!--                             <div class="modal-body" data-rno> -->
<!--                                 <input type="hidden" class="seq"/> -->
<%--                                 <input type="text" id="replytext" class="form-control"/> --%>
<!--                                 <textarea class="form-control" id="replyText" rows="3" style="resize: none"></textarea> -->
<!--                             </div> -->
<!--                             <div class="modal-footer"> -->
<!--                                 <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button> -->
<!--                                 <button type="button" class="btn btn-primary modalModBtn">수정</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<%--                 댓글 삭제를 위한 modal 영역 --%>
<!--                 <div class="modal fade" id="delModal"> -->
<!--                     <div class="modal-dialog"> -->
<!--                         <div class="modal-content"> -->
<!--                             <div class="modal-header"> -->
<!--                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                                     <span aria-hidden="true">&times;</span></button> -->
<!--                                 <h4 class="modal-title">댓글 삭제</h4> -->
<!--                                 <input type="hidden" class="rno"/> -->
<!--                             </div> -->
<!--                             <div class="modal-body" data-rno> -->
<!--                                 <p>댓글을 삭제하시겠습니까?</p> -->
<!--                                 <input type="hidden" class="rno"/> -->
<!--                             </div> -->
<!--                             <div class="modal-footer"> -->
<!--                                 <button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니요.</button> -->
<!--                                 <button type="button" class="btn btn-primary modalDelBtn">네. 삭제합니다.</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!-- 댓글 처리 -->

	<div class="col-lg-12">	
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">댓글 작성</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label for="newReplyText">댓글 내용</label> <input class="form-control"
						id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="newReplyWriter">댓글 작성자</label> <input
						class="form-control" id="newReplyWriter" name="replyWriter"
						placeholder="댓글 작성자를 입력해주세요" required>
				</div>
				<hr/>
				<div class="col-sm-3" style="margin:10px; float:right;">
                    <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i>  댓글 저장</button>
                </div>
			</div>
			
			<div class="box-footer" style="margin-top:70px;">
				<ul id="replies" >


				</ul>
			</div>
			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination pagination-sm no-margin">

					</ul>
				</div>
			</div>
		</div>
	</div>
<!--                 <div class="box box-warning"> -->
<!--                     <div class="box-header with-border"> -->
<!--                         <a class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글작성</a> -->
<!--                     </div> -->
<!--                     <div class="box-body"> -->
<!--                         <form class="form-horizontal"> -->
<!--                             <div class="form-group margin"> -->
<!--                                 <div class="col-sm-10" style="float:left; padding : 10px"> -->
<!--                                     <textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글을 입력해주세요..." style="resize: nonel"></textarea> -->
<!--                                 </div>	 -->
<!--                                 <div class="col-sm-2" style="float:left; padding : 10px"> -->
<!--                                     <input class="form-control" id="newReplyWriter" type="text" placeholder="작성자"> -->
<!--                                 </div> -->
<!--                                 <hr/> -->
<!--                                 <div class="col-sm-2" style="float:left"> -->
<!--                                     <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->

	<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">댓글 수정창</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
				<div class="modal-boby" style="padding:20px;">
					<div class="form-group">
						<label for="replyNo">댓글 번호</label> <input class="form-control"
							id="replyNo" name="replyNo" readonly>
					</div>

					<div class="form-group">
						<label for="replyText">댓글 내용</label> <input class="form-control"
							id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
					</div>

					<div class="form-group">
							<label for="replyWriter">댓글 작성자</label> <input
							class="form-control" id="replyWriter" name="replyWriter" readonly>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success modalModBtn">수정</button>
					<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
   </section>
   
   
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>   -->
   
<!-- <!--    <script id="replyTemplate" type="text/x-handlebars-template"> --> 
<!--     {{#each.}} -->
<!--     <div class="post replyDiv" data-replyNo={{replyNo}}> -->
<!--         <div class="user-block"> -->
<%-- <%--             댓글 작성자 프로필사진 : 추후 이미지 업로드기능 구현 예정 --%> 
<!--             <img class="img-circle img-bordered-sm" src="/dist/img/user1-128x128.jpg" alt="user image"> -->
<%-- <%--             댓글 작성자 --%> 
<!--             <span class="username"> -->
<%-- <%--                 작성자 이름 --%> -
<!--                 <a href="#">{{replyWriter}}</a> -->
<%-- <%--                 댓글 삭제 버튼 --%> 
<!--                 <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal"> -->
<!--                     <i class="fa fa-times"> 삭제</i> -->
<!--                 </a> -->
<%-- <%--                 댓글 수정 버튼 --%> 
<!--                 <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal"> -->
<!--                     <i class="fa fa-edit"> 수정</i> -->
<!--                 </a> -->
<!--             </span> -->
<%-- <%--             댓글 작성일자 --%> 
<!--             <span class="description">{{prettifyDate regDate}}</span> -->
<!--         </div> -->
<%-- <%--         댓글 내용 --%> 
<!--         <div class="oldReplytext">{{{escape replyText}}}</div> -->
<!--         <br/> -->
<%-- <%--         댓글 추천 버튼 --%> 
<!--         <ul class="list-inline"> -->
<!--             <li> -->
<!--                 <a href="#" class="link-black text-sm"> -->
<!--                     <i class="fa fa-thumbs-o-up margin-r-5"></i> 댓글 추천(0) -->
<!--                 </a> -->
<!--             </li> -->
<!--         </ul> -->
<!--     </div> -->
<!--     {{/each}} -->

<!-- </script> -->

<!-- <script> -->

<!-- //    $(document).ready(function () { -->
<%-- //         var seq = ${param.seq}; // 현재 게시글 번호 --%>
<!-- //         // 댓글 페이지 초기화 -->
<!-- //         var replyPageNum = 1; -->
<!-- //         // 댓글 내용 줄바꿈, 공백 처리를 위한 문자열 처리 -->
<!-- //         Handlebars.registerHelper("escape", function(replyText) { -->
<!-- //             var text = Handlebars.Utils.escapeExpression(replyText); -->
<!-- //             text = text.replace(/(\r\n|\n|\r)/gm, "<br/>"); -->
<!-- //             text = text.replace(/( )/gm, "&nbsp;"); -->
<!-- //             return new Handlebars.SafeString(text); -->
<!-- //         }); -->
        
<!-- //         // 댓글 등록일자 출력을 위한 날짜/시간 문자열 처리 -->
<!-- //         Handlebars.registerHelper("prettifyDate", function (timeValue) { -->
<!-- //             var dateObj = new Date(timeValue); -->
<!-- //             var year = dateObj.getFullYear(); -->
<!-- //             var month = dateObj.getMonth() + 1; -->
<!-- //             var date = dateObj.getDate(); -->
<!-- //             var hours = dateObj.getHours(); -->
<!-- //             var minutes = dateObj.getMinutes(); -->
<!-- //             // 2자리 숫자 맞추기 -->
<!-- //             month < 10 ? month = '0' + month : month; -->
<!-- //             date < 10 ? date = '0' + date : date; -->
<!-- //             hours < 10 ? hours = '0' + hours : hours; -->
<!-- //             minutes < 10 ? minutes = '0' + minutes : minutes; -->
<!-- //             return year + "-" + month + "-" + date + " " + hours + ":" + minutes; -->
<!-- //         }); -->
        
<!-- //         //댓글 목록 함수 호출 -->
<!-- //         getReplies("../replies/" + seq + "/" + replyPageNum); -->
        
<!-- //         // 댓글 갯수, 목록, 하단페이징 출력 호출 함수 -->
<!-- //         function getReplies(repliesUri) { -->
<!-- //             // 댓글 목록 가져오기 -->
<!-- //             $.getJSON(repliesUri, function (data) { -->
<!-- //                 // 1. 댓글 갯수 출력 함수 호출 -->
<!-- //                 printReplyCount(data.pageMaker.totalCount); -->
<!-- //                 // 2. 댓글 목록 출력 함수 호출 -->
<!-- //                 printData(data.replies, $(".repliesDiv"), $("#replyTemplate")); -->
<!-- //                 // 3. 댓글 하단 페이징 출력 함수 호출 -->
<!-- //                 printReplyPaging(data.pageMaker, $(".pagination")); -->
<!-- //             }); -->
<!-- //         } -->
        
<!-- //         // 1. 댓글 갯수 출력, 댓글 보기 버튼 활성/비활성 함수 -->
<!-- //        function printReplyCount(totalCount) { -->
        	
<!-- //         	var replyCount = $(".replyCount"); -->
<!-- //         	var collapsedBox = $(".collapsed-box"); -->
        	
<!-- //         	// 댓글이 없으면 -->
<!-- //         	if(totalCount === 0){ -->
<!-- //         		replyCount.html("댓글이 없습니다. 의견을 남겨주세요."); -->
<!-- //         		collapsedBox.find(".btn-box-tool").remove(); -->
<!-- //         		return; -->
<!-- //         	} -->
        	
<!-- //         	// 댓글이 존재하면 -->
<!-- //         	replyCount.html("댓글 목록(" + totalCount + ")"); -->
<!-- //         	collapsedBox.find(".box-tools").html( -->
<!-- //         		"<button type='button' class='btn btn-box-tool' data-widget='collapse'>" -->
<!-- //         		+ "<i class='fa fa-plus'></i>" -->
<!-- //         		+ "</button>" -->
<!-- //         	); -->
        	
<!-- //         } -->
     
<!-- //         // 2. 댓글 목록 출력 함수 -->
<!-- //         function printReplies (replyArr, targetArea, templateObj) { -->
<!-- //             var replytemplate = Handlebars.compile(templateObj.html()); -->
<!-- //             var html = replyTemplate(replyArr); -->
<!-- //             $(".replyDiv").remove(); -->
<!-- //             targetArea.html(html); -->
<!-- //         } -->
        
<!-- //         // 3. 하단 페이징 출력 함수 -->
<!-- //         function printReplyPaging (pageMaker, targetArea) { -->
<!-- //             var str = ""; -->
<!-- //             if (pageMaker.prev) { -->
<!-- //                 str += "<li><a href='" + (pageMaker.startPage - 1) + "'>이전</a></li>"; -->
<!-- //             } -->
<!-- //             for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) { -->
<!-- //                 var strClass = pageMaker.criteria.page == i ? "class=active" : ""; -->
<!-- //                 str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>"; -->
<!-- //             } -->
<!-- //             if (pageMaker.next) { -->
<!-- //                 str += "<li><a href='" + (pageMaker.endPage + 1) + "'>다음</a></li>" -->
<!-- //             } -->
<!-- //             targetArea.html(str); -->
<!-- //         } -->
        
<!-- //         // 댓글 목록 출력 함수 호출 -->
<!-- //         getPage("/replies/all/" + bno + "/" + replyPage); -->

<!-- //         // 댓글 페이지 번호 클릭 이벤트 -->
<!-- //         $(".pagination").on("click", "li a", function (event) { -->
<!-- //             event.preventDefault(); -->
<!-- //             replyPageNum = $(this).attr("href"); -->
<!-- //             getReplies("../replies/all/"+seq+"/"+replyPageNum); -->
<!-- //         }); -->
<!-- //         }); -->
        
<!-- </script> -->

<!-- <script> -->
<!-- // // ---------------------------------------- 댓글 입력 ---------------------------------------- -->
<!-- //         // 댓글 저장 버튼 클릭 이벤트 -->
<!-- //         $(".replyAddBtn").on("click", function () { -->
<!-- //             // 입력 form 선택자 -->
<!-- //             var replyerObj = $("#newReplyWriter"); -->
<!-- //             var replyTextObj = $("#newReplyText"); -->
<!-- //             var replyWriter = replyWriterObj.val(); -->
<!-- //             var replyText = replyTextObj.val(); -->
            
<!-- //             // 댓글 입력처리 수행 -->
<!-- //             $.ajax({ -->
<!-- //                 type: "post", -->
<!-- //                 url: "../replies/", -->
<!-- //                 headers: { -->
<!-- //                     "Content-Type" : "application/json", -->
<!-- //                     "X-HTTP-Method-Override" : "POST" -->
<!-- //                 }, -->
<!-- //                 dataType: "text", -->
<!-- //                 data: JSON.stringify({ -->
<!-- //                     seq:seq, -->
<!-- //                     replyWriter:replyWriter, -->
<!-- //                     replyText:replyText -->
<!-- //                 }), -->
<!-- //                 success: function (result) { -->
<!-- //                     console.log("result : " + result); -->
<!-- //                     if (result === "regSuccess") { -->
<!-- //                         alert("댓글이 등록되었습니다."); -->
<!-- //                         replyPageNum = 1;  // 페이지 1로 초기화 -->
<!-- //                         getReplies("../replies/" + seq + "/" + replyPageNum); // 댓글 목록 호출 -->
<!-- //                         replyWriterObj.val("");     // 작성자 입력창 공백처리 -->
<!-- //                         replyTextObj.val("");   // 댓글 입력창 공백처리 -->
<!-- //                     } -->
<!-- //                 } -->
<!-- //             }); -->
<!-- //         }); -->
<!-- //         // ---------------------------------------- 댓글 수정 ---------------------------------------- -->
<!-- //         // 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅 -->
<!-- //         $(".repliesDiv").on("click", ".replyDiv", function (event) { -->
<!-- //             var reply = $(this); -->
<!-- //             console.log(reply); -->
<!-- //             $(".replyNo").val(reply.attr("data-replyNo")); -->
<!-- //             $("#replyText").val(reply.find(".oldReplyText").text()); -->
<!-- //         }); -->
        
<!-- //         // modal 창의 댓글 수정버튼 클릭 이벤트 -->
<!-- //         $(".modalModBtn").on("click", function () { -->
<!-- //             var replyNo = $(".replyNo").val(); -->
<!-- //             var replyText = $("#replyText").val(); -->
<!-- //             $.ajax({ -->
<!-- //                 type: "put", -->
<!-- //                 url: "../replies/" + replyNo, -->
<!-- //                 headers: { -->
<!-- //                     "Content-Type" : "application/json", -->
<!-- //                     "X-HTTP-Method-Override" : "PUT" -->
<!-- //                 }, -->
<!-- //                 dataType: "text", -->
<!-- //                 data: JSON.stringify({ -->
<!-- //                 	replyText:replyText -->
<!-- //                 }), -->
<!-- //                 success: function (result) { -->
<!-- //                     console.log("result : " + result); -->
<!-- //                     if (result === "modSuccess") { -->
<!-- //                         alert("댓글이 수정되었습니다."); -->
<!-- //                         getPage("../replies/" + seq + "/" + replyPageNum); // 댓글 목록 호출 -->
<!-- //                         $("#modModal").modal("hide"); // modal 창 닫기 -->
<!-- //                     } -->
<!-- //                 } -->
<!-- //             }) -->
<!-- //         }); -->
        
<!-- //         // ---------------------------------------- 댓글 삭제 ---------------------------------------- -->
<!-- //         $(".modalDelBtn").on("click", function () { -->
<!-- //             var replyNo = $(".replyNo").val(); -->
<!-- //             $.ajax({ -->
<!-- //                 type: "delete", -->
<!-- //                 url: "../replies/" + replyNo, -->
<!-- //                 headers: { -->
<!-- //                     "Content-Type" : "application/json", -->
<!-- //                     "X-HTTP-Method-Override" : "DELETE" -->
<!-- //                 }, -->
<!-- //                 dataType: "text", -->
<!-- //                 success: function (result) { -->
<!-- //                     console.log("result : " + result); -->
<!-- //                     if (result === "delSuccess") { -->
<!-- //                         alert("댓글이 삭제되었습니다."); -->
<!-- //                         getPage("../replies/" + replyNo + "/" + replyPageNum); // 댓글 목록 호출 -->
<!-- //                         $("#delModal").modal("hide"); // modal 창 닫기 -->
<!-- //                     } -->
<!-- //                 } -->
<!-- //             }); -->
<!-- //         }); -->
        
<!--          /*======================================== 게시글 페이지 이동 관련 ========================================*/ -->
<!--          // form 선택자 -->
<!-- //         var formObj = $("form[role='form']"); -->
<!-- //         console.log(formObj); -->
<!-- //         // 수정버튼 클릭시 -->
<!-- //         $(".modBtn").on("click", function () { -->
<!-- //             formObj.attr("action", "/board/modify"); -->
<!-- //             formObj.attr("method", "get"); -->
<!-- //             formObj.submit(); -->
<!-- //         }); -->
<!-- //         // 삭제 버튼 클릭시 -->
<!-- //         $(".delBtn").on("click", function () { -->
<!-- //             formObj.attr("action", "/board/remove"); -->
<!-- //             formObj.submit(); -->
<!-- //         }); -->
<!-- //         // 목록 버튼 클릭시 -->
<!-- //         $(".listBtn").on("click", function () { -->
<!-- //             //self.location = "/board/list"; -->
<!-- //             $("input[name=bno]").remove(); -->
<!-- //             formObj.attr("method", "get"); -->
<!-- //             formObj.attr("action", "/board/list"); -->
<!-- //             formObj.submit(); -->
<!-- //         }); -->
<!-- //         // 수정 완료시 알림 -->
<%-- //         var result = "${msg}"; --%>
<!-- //         if (result == "MODIFIED") { -->
<!-- //             alert("게시글이 수정되었습니다."); -->
<!-- //         } -->
<!-- //     }); -->

<!-- </script> -->

<script>
 var seq = ${param.seq};
//목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
 var replyPageNum = 1;

 $.getJSON("../replies/all/" + seq, function(data) {
 	console.log(data);
 });

//댓글 목록 호출
  getRepliesPaging(replyPageNum);

 // 댓글 목록 출력 함수
function getReplies(){
	$.getJSON("../replies/all/" + seq, function (data) {
		console.log(data+"1");
		
		var str="";
		
		$(data).each(function (){
			str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
				+	"<p class='replyText'>" + this.replyText + "</p>"
				+	"<p class='replyWriter'>" + this.replyWriter + "</p>"
				+	"<button type='button' class = 'btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
				+	"</li>"
				+	"<hr/>";
		});
		
		$("#replies").html(str);
	});
}

//댓글 목록 페이징 함수
function getRepliesPaging(page) {
	
	$.getJSON("../replies/" + seq + "/" + page, function (data) {
		console.log(data);
		
		var str = "";
		
		$(data.replies).each(function (){
			str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
				+	"<p class='replyText'>" + this.replyText + "</p>"
				+	"<p class='replyWriter'>" + this.replyWriter + "</p>"
				+	"<button type='button' class = 'btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
				+	"</li>"
				+	"<hr/>";
	});
		
		$("#replies").html(str);
		
		//페이지 번호 출력 호출
		printPageNumbers(data.pageMaker);
		
});
}

// 댓글 목록 페이지 번호 출력 함수
function printPageNumbers(pageMaker) {
	console.log(pageMaker.criteria.page);
	var str ="";
	
	// 이전 버튼 활성화
	if(pageMaker.prev){
		str += "<li ><a href='" +1+ "' class='page-link'><<</a></li>";
		str += "<li ><a href='" + (pageMaker.startPage - 1)+ "' class='page-link'>이전</a></li>";
	}
	
	//페이지 번호 
// 	for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
// 		var strCalss = (pageMaker.page === i ? "class='page-item active'" : "");
// 		str += "<li " + strCalss + "><a href='" +i+ "' class='page-link'>" +i+ "</a><li>";
// 	}
	
	for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		if(pageMaker.criteria.page == i)
			str += "<li class='page-item active' ><a href='" +i+ "' class='page-link'>" +i+ "</a><li>";
		else
			str += "<li class='page-item' ><a href='" +i+ "' class='page-link'>" +i+ "</a><li>";
		
		}

	// 다음 버튼 활성화
	if(pageMaker.next){
		str += "<li><a href='" +(pageMaker.endPage + 1)+ "' class='page-link'>다음</a></li>";
		str += "<li><a href='" +(pageMaker.end)+ "' class='page-link'>>></a></li>";
	}
	
	$(".pagination-sm").html(str);
}

// 목록페이지 번호 클릭 이벤트
$(".pagination").on("click", "li a", function (event){
	
	event.preventDefault();
	replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
	getRepliesPaging(replyPageNum); // 목록 페이지 호출
});

// 댓글 저장 버튼 클릭 이벤트 발생시
$('.replyAddBtn').on("click", function() {
	
	
	//화면으로부터 입력 받은 변수값의 처리
	var replyText = $('#newReplyText');
	var replyWriter = $('#newReplyWriter');
	
	var replyTextVal = replyText.val();
	var replyWriterVal = replyWriter.val();
	
	// AJAX 통신 :POST
	$.ajax({
		type : "post",
		url : "../replies",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : "text",
		data : JSON.stringify({
			seq : seq,
			replyText : replyTextVal,
			replyWriter : replyWriterVal
		}),
		success : function (result) {
			//성공적인 댓글 등록 처리 알림
			if(result =="regSuccess"){
				alert("댓글 등록 완료!");
			}
			getRepliesPaging(); //댓글 목록 출력 함수 호출
			replyText.val(""); // 댓글 내용 초기화
			replyWriter.val(""); // 댓글 작성자 초기화
		}
	});
});

// 수정 클릭시 이벤트
$("#replies").on("click", ".replyLi button", function() {
	var reply = $(this).parent();
	
	var replyNo = reply.attr("data-replyNo");
	var replyText = reply.find(".replyText").text();
	var replyWriter = reply.find(".replyWriter").text();
	
	$("#replyNo").val(replyNo);
	$("#replyText").val(replyText);
	$("#replyWriter").val(replyWriter);
});

// 댓글 삭제
$('.modalDelBtn').on("click", function() {
	//댓글 번호
	var replyNo = $(this).parent().parent().find("#replyNo").val();
	
	//AJAX 통신 : DELETE
	$.ajax({
		type : "delete",
		url : "../replies/" + replyNo,
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		dateType : "text",
		success : function (result) {
			console.log("result : " + result);
			if(result == "delSuccess"){
				alert("댓글 삭제 완료!");
			$("#modifyModal").modal("hide");  //modal 닫기
			getRepliesPaging(replyPageNum);  // 댓글 목록 갱신
			}
		}
	});
});

// 댓글 수정
$('.modalModBtn').on("click", function() {
	
	// 댓글 선택자
	var reply = $(this).parent().parent();
	// 댓글 번호
	var replyNo = reply.find("#replyNo").val();
	// 수정한 댓글 내용
	var replyText = reply.find("#replyText").val();
	
	//AJAX 통신 : PUT
	$.ajax({
		type : "put",
		url : "../replies/" + replyNo,
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data : JSON.stringify(
				{replyText : replyText}
		),
		dateType : "text",
		success : function (result) {
			console.log("result : " + result);
			if(result == "modSuccess"){
				alert("댓글 수정 완료!");
			$("#modifyModal").modal("hide");  //modal 닫기
			getRepliesPaging(replyPageNum);  // 댓글 목록 갱신
			}
		}
	});
});

</script>

</body>
</html>