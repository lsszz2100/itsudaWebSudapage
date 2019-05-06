<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.fileDrop{
	width: 100%;
	height: 200px;
	border: 2px dotted #0b58a2;
	margin-top: 20px;

}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertPage</title>

</head>
<body>

    <form action= "<c:url value='/community/insertAction'/>" method="post">
    <input name = "team" type="hidden" value="${param.team}"/>				
    <div style="padding-top: 100px;
    padding-right: 150px;
    padding-left: 150px;
    margin-right: auto;
    margin-left: auto;">
        <div class="form-group" >
              <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 작성해주세요." required >
          </div>
<!--         <div class="form-group"> -->
<!--             <label for="writer">작성자</label> -->
<!--             <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자명을 적어주세요." required> -->
<!--           </div> -->
          <div class="form-group">
            <label for="description">내용</label>
            <textarea class="form-control" id="description" name="description" rows="10" ></textarea>
          </div>
          
          	<div class="col-lg-12">
			<div class="form-group">
				<div class="fileDrop">
					<br /> <br /> <br /> <br />
					<p class="text-center">
						<i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.
					</p>
				</div>
			</div>

			<!-- /.box-body -->
			<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			<!-- /.box-footer -->
		</div>
          
<!--         <button type="submit" class="btn btn-info" onclick="check();" >등록하기</button> -->
        <button type="submit" class="btn btn-info" onclick="#" >등록하기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='../community/main?page=${param.page }&perPageNum=10&keyword=&team=${param.team}'">목록으로</button>
        <button type="reset" class="btn btn-warning" onclick="#" >첨부파일 초기화</button>
        </div>

	
<!-- 		<div> -->
<!-- 			<div class="pull-right"> -->
<!-- 				<button type="reset" class="btn btn-warning"> -->
<!-- 					<i class="fa fa-reply"></i> 첨부파일 초기화 -->
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 		</div> -->

	</form>
<script id="fileTemplate" type="text/x-handLebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
 			<img src="{{imgSrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{origincalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>


</body>

</html>