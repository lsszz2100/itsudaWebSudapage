<!-- 공지사항 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">

<title>Detail-page</title>
</head>

<body id="page-top">
	<div id="wrapper">
		<div id="content-wrapper">
			<div class="container-fluid" style="margin-top:60px">
				<div class="card mb-3">
				<div class="card-header" style="background-color:black; color:white;">
				<i class="fas fa-table"></i>  공지사항
				</div>
					<div class="card-body" style="background-color:#EDEDED;">
						<!-- 글 상세 목록 세부 사항 -->
						<div class="container col-md-12">
							<div class="card">
								<div class="card-body" >
									<h4 class="card-title mb-3">${vo.title }</h4>
									<h6 class="card-subtitle text-muted mb-4">
										<i class="far fa-user"></i> ${vo.writer } · <i
											class="far fa-clock"></i> ${vo.crtDt } · <i
											class="fas fa-align-justify"></i> ${vo.viewCnt }
									</h6>
									<p class="card-text">${vo.description }</p>
								</div>
								<div class="card-body">
									<button type="button" class="btn btn-info" style="background-color:#FA5858;"
										onclick="location.href='../notice/NoModify?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq}'">수정</button>
									<button type="button" class="btn btn-info" style="background-color:#FA5858;"
										onclick="location.href='../notice/NoDelete?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&seq=${param.seq}'">삭제</button>
									<button type="button" class="btn btn-info"style="background-color:#6c757d;"
										onclick="location.href='../notice/main?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}'">목록으로</button>
								</div>
								
								<c:choose>
								<c:when test="${!empty files}">
								<div class="card-body">
									<div class="form-group">
									<!-- 첨부파일 다운로드 -->
									<label>첨부파일</label>
									<c:forEach var="files" varStatus="i" items="${files }">
									<p>
										<a href="../notice/fileDown/${files.upSeq}/${files.seq}">${files.fileRealName}</a>
									</p>
									</c:forEach>
									</div>
								</div>
								</c:when>
								</c:choose>
							</div>
						</div>
						
						<section class="content container-fluid" style="margin-top: 40px;">

							<!-- 댓글 등록 영역 -->
							<div class="box box-warning">
								<div class="box-header with-border">
									<a class="link-black text-lg"><i class="fa fa-pencil"></i>
										댓글작성</a>
								</div>
								<div class="box-body">
									<form class="form-horizontal">
										<div class="form-group margin">
											<div class="col-sm-10" style="float: left; padding: 10px">
												<textarea class="form-control" id="newReplyText"
													name="replyText" rows="3" placeholder="댓글을 입력해주세요..."
													style="resize: nonel"></textarea>
											</div>
											<div class="col-sm-2" style="float: left; padding: 10px">
												<input class="form-control" id="newReplyWriter"
													name="replyWriter" placeholder="작성자">
											</div>
											<hr />
											<div class="col-sm-2" style="float: left">
												<button type="button"
													class="btn btn-primary btn-block replyAddBtn">
													<i class="fa fa-save"></i> 저장
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>

							<!-- 댓글 목록 출력 영역 -->
							<div class="box-footer" style="margin-top: 70px;">
								<ul id="replies"
									style='padding-top: 50px; padding-left: 50px; padding-right: 50px'>


								</ul>
							</div>
							<div class="box-footer">
								<div class="text-center">
									<ul class="pagination pagination-sm no-margin"
										style="justify-content: center;">

									</ul>
								</div>
							</div>

							<!-- 댓글 수정창 -->
							<div class="modal fade" id="modifyModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">댓글 수정</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>

										</div>
										<div class="modal-boby" style="padding: 20px;">

											<input class="form-control" id="replyNo" name="replyNo"
												type="hidden">

											<div class="form-group">
												<textarea class="form-control" id="replyText"
													name="replyText" rows="7" placeholder="댓글을 입력해주세요."
													style="resize: nonel"></textarea>
											</div>

											<div class="form-group">
												<input class="form-control" id="replyWriter"
													name="replyWriter" readonly>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success modalModBtn">수정</button>
											<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
											<button type="button" class="btn btn-default pull-left"
												data-dismiss="modal" style="background-color: #BDBDBD; color:#ffffff;">닫기</button>
										</div>
									</div>
								</div>
							</div>

							<!-- 대댓글 창 -->
							<div class="modal fade" id="CommentsModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">대댓글</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>

										</div>
										<div class="modal-boby" style="padding: 20px;">
											<input type="hidden" id="tempPReplyNo" value=""> <input
												type="hidden" id="tempPSeq" value="">
											<div class="form-group">
												<textarea class="form-control" id="tempPReplyText"
													name="tempPReplyText" rows="7" placeholder="대댓글을 입력해주세요."
													style="resize: nonel"></textarea>
											</div>

											<div class="form-group">
												<label for="replyWriter">댓글 작성자</label> <input
													class="form-control" id="tempPReplyWriter"
													name="tempPReplyWriter">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success modalAdd">작성</button>
											<button type="button" class="btn btn-default pull-left"
												data-dismiss="modal" style="background-color: #BDBDBD; color:#ffffff;">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
					<div class="card-footer small text-muted" style="background-color:black;"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>




<script>
 var seq = ${param.seq};
//목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
 var replyPageNum = 1;

//  $.getJSON("../NoReplies/all/" + seq, function(data) {
//  	console.log(data);
//  });

//댓글 목록 호출
  getRepliesPaging(replyPageNum);
  
  



//댓글 목록 호출 함수
function getRepliesPaging(page) {
	
	$.getJSON("../NoReplies/" + seq + "/" + page, function (data) {
		console.log(data);
		var str = "";

		$(data.replies).each(function (){	
			console.log(data.replies);
			      if(this.pdelflag == 'N' ){
			    	  if(this.reorder == 1 || this.reorder == null){
			         // 댓글 그리기
			           str += "<li data-replyNo='" + this.preplyNo + "' class='replyLi'>"
						   + 	"<h3><p class='replyWriter' style='color:#28A745; font-size:20px;'>☺" + this.preplyWriter + "</p></h3>"
						   + 	"<p class='replyText'>" + this.preplyText + "</p>"
				 		   + 	"<p class='updateDate' style='float:left; font-size:15px;'>" + this.pupdateDate + "</p>"
						   + 	"<button type='button' class = 'btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal' style='float:right'>댓글 수정</button>"
						   +    "<button type='button' class = 'btn btn-sm btn-success' data-toggle='modal' data-target='#CommentsModal' onclick='rereplyBtn("+this.preplyNo+","+this.pseq+")' style='float:left; margin-left:10px; background-color:#007BE1'>댓글</button>"
						   + 	"</li>"
						   + 	"</p>"
						   + 	"</p>"
						   + 	"<hr style='margin-top: 70px; margin-bottom: 20px;'/>"
						   
						   $("#reply").append(str);
			    	  
			         // 대댓글 그리기
// 			       if(this.cseq != null && this.cdelflag == 'N'){
// 			           str += "<li data-replyNo='" + this.creplyNo + "' class='replyLi' style='margin-left:50px'>"
// 			  				+	"<h3 class='replyWriter' style='color:#28A745; font-size:15px;'>☺" + this.creplyWriter + "</h3>"
// 			  				+	"<p class='replyText' style='font-size:15px'>" + this.creplyText + "</p>"
// 			   				+	"<p class='updateDate' style='float:left; font-size:13px; margin-bottom:40px;'>" + this.cupdateDate + "</p>"
// 			  				+	"<button type='button' class = 'btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal' style='float:right; background-color:#007BE1; weight:50; height:30; font-size:15px;'>수정</button>"
// 			  				+	"</li>"
// 			  				+	"</p>"
// 			  				+	"</p>"
// 			  				+	"<hr style='margin-top: 70px; margin-bottom: 20px;'/>"
			  				
// 			  				$("#reply").append(str);
// 			       		}
			    	  }
			      } if(this.pdelflag == 'N' && this.cdelflag == 'N'){
			         // 대댓글 그리기
			           str += "<li data-replyNo='" + this.creplyNo + "' class='replyLi' style='margin-left:50px'>"
			  				+	"<h3 class='replyWriter' style='color:#28A745; font-size:15px;'>☺" + this.creplyWriter + "</h3>"
			  				+	"<p class='replyText' style='font-size:15px'>" + this.creplyText + "</p>"
			   				+	"<p class='updateDate' style='float:left; font-size:13px; margin-bottom:40px;'>" + this.cupdateDate + "</p>"
			  				+	"<button type='button' class = 'btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal' style='float:right; background-color:#007BE1; weight:50; height:30; font-size:15px;'>수정</button>"
			  				+	"</li>"
			  				+	"</p>"
			  				+	"</p>"
			  				+	"<hr style='margin-top: 70px; margin-bottom: 20px;'/>"
			  				
			  				$("#reply").append(str);
			      }
			      console.log(data.replies);
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
		str += "<li ><a href='" + (pageMaker.startPage - 1)+ "' class='page-link'><</a></li>";
	}

	for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		if(pageMaker.criteria.page == i)
			str += "<li class='page-item active' ><a href='" +i+ "' class='page-link'>" +i+ "</a><li>";
		else
			str += "<li class='page-item' ><a href='" +i+ "' class='page-link'>" +i+ "</a><li>";
		
		}

	// 다음 버튼 활성화
	if(pageMaker.next){
		str += "<li><a href='" +(pageMaker.endPage + 1)+ "' class='page-link'>></a></li>";
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
	
	replyTextVal = replyTextVal.replace(/(\n|\r\n)/g,"<br>");
		
	// AJAX 통신 :POST
	if(replyTextVal == '' || replyWriterVal == '')
		alert("내용 및 작성자를 작성해주세요.");
	
	else{
	$.ajax({
		type : "post",
		url : "../NoReplies",
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
			replyPageNum = 1;				//댓글 페이지 초기화;
			getRepliesPaging(replyPageNum); //댓글 목록 출력 함수 호출
			replyText.val(""); // 댓글 내용 초기화
			replyWriter.val(""); // 댓글 작성자 초기화
		}
	});
	}
});

// 댓글 수정 클릭시 
$("#replies").on("click", ".replyLi button", function() {
	var reply = $(this).parent();
	console.log(reply);
	var replyNo = reply.attr("data-replyNo");				//attr : 데이터 변경
	var replyText = reply.find(".replyText").html();
	var replyWriter = reply.find(".replyWriter").text(); 
	replyText = replyText.replace(/<br>/gi,"\n");
	$("#replyNo").val(replyNo);
	$("#replyText").val(replyText);
	$("#replyWriter").val(replyWriter);
	console.log(replyText);
	console.log(replyWriter);
});



// 댓글 삭제 버튼 클릭시 이벤트
$('.modalDelBtn').on("click", function() {
	//댓글 번호
	var replyNo = $(this).parent().parent().find("#replyNo").val();
	
	//AJAX 통신 : DELETE
	$.ajax({
		type : "get",
		url : "../NoReplies/" + replyNo,
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
			$(".modal-backdrop").remove();
			getRepliesPaging(replyPageNum);  // 댓글 목록 갱신
			}
		}
	});
});

//수정창의 수정 버튼 클릭시 이벤트
$('.modalModBtn').on("click", function() {
	
	// 댓글 선택자
	var reply = $(this).parent().parent();
	// 댓글 번호
	var replyNo = reply.find("#replyNo").val();
	// 수정한 댓글 내용
	var replyText = reply.find("#replyText").val();
	
	replyText = replyText.replace(/(\n|\r\n)/g,"<br>");
	
	
	
	//AJAX 통신 : PUT
	$.ajax({
		type : "put",
		url : "../NoReplies/" + replyNo,
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
			$(".modal-backdrop").remove();
			getRepliesPaging(replyPageNum);  // 댓글 목록 갱신
			}
		}
	});                                                                                                   
});                                                                                                       
                                                                                                          
//대댓글 작성 버튼 클릭시
$('.modalAdd').on("click", function() {

	// data 셋팅
	var ReplyNo	= $("#tempPReplyNo").val();
	var Seq		= $("#tempPSeq").val();
	var Text		= $("#tempPReplyText").val();
	var Writer		= $("#tempPReplyWriter").val();
	
	Text = Text.replace(/(\n|\r\n)/g,"<br>");
	
	//AJAX 통신 : PUT
	$.ajax({
		type : "POST",
		url : "../NoReplies/insertSubReply",
		data : {pReplyNo : ReplyNo
				, pSeq : Seq
				, cText : Text
				, cWriter : Writer
			},
		dateType : "text",
		
		
		success : function (result) {
			
			if(result == "CommentsSuccess"){
				alert("대댓글 등록 완료!");
			}
			$("#CommentsModal").modal("hide");  //modal 닫기
			$(".modal-backdrop").remove();
			getRepliesPaging(replyPageNum);  // 대댓글 목록 갱신
			$("#tempPReplyText").val("");					// 대댓글 내용 초기화
			$("#tempPReplyWriter").val("");			// 대댓글 작성자 초기화
			
		}
	});
});
function rereplyBtn(replyNo, seq){
	$("#tempPReplyNo").attr("value",replyNo);
	$("#tempPSeq").attr("value",seq);
}
</script>
</body>
</html>
