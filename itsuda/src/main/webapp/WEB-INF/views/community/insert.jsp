<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertPage</title>

<!-- <script type="text/javascript">
function check(){
	var title = ${"#title"}.val();
	var writer = ${"#writer"}.val();
	
	 if(title.length == ''){
	        alert("제목을 입력해주세요."); 
	        $("#title").focus();
	        return false;
	    }
	 
	 if(writer.length == ''){
	        alert("작성자를 입력해주세요".); 
	        $("#writer").focus();
	        return false;
	    }
}
	 
	 
</script>  -->
</head>
<body>

    <form action= "<c:url value='/community/insertAction'/>" method="post">
    <input name = "team" type="hidden" value="${param.team}"/>											<!-- jsp에서 컨트롤러는 input, 컨트롤러에서 jsp 는 model -->
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
          
<!--         <button type="submit" class="btn btn-info" onclick="check();" >등록하기</button> -->
        <button type="submit" class="btn btn-info" onclick="#" >등록하기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='../community/main?team='+${param.team}">목록으로</button>
        </div>
    </form>
    


</body>
</html>