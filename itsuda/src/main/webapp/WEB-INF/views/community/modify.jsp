<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyPage</title>
</head>
<body>

    <form action= "../community/modifyAction" method="post">
    <input name = "team" type="hidden" value="${param.team}"/>	
    <input name = "seq" type="hidden" value="${param.seq}"/>	
    <input name = "page" type="hidden" value="${searchCriteria.page}"/>	
    <input name = "perPageNum" type="hidden" value="${searchCriteria.perPageNum}"/>	
    <input name = "keyword" type="hidden" value="${searchCriteria.keyword}"/>											<!-- jsp에서 컨트롤러는 input, 컨트롤러에서 jsp 는 model -->
    <div style="padding-top: 100px;
    padding-right: 150px;
    padding-left: 150px;
    margin-right: auto;
    margin-left: auto;">
        <div class="form-group" >
              <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${vo.title }">
          </div>

          <div class="form-group">
            <label for="description">내용</label>
            
             <textarea class="form-control" id="description" name="description" rows="10">${vo.description }</textarea> 
          </div>
          
        <button type="submit" class="btn btn-info">수정하기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='../community/main?page=${param.page}&perPageNum=${param.perPageNum}&keyword=${param.keyword}&team=${param.team}'">목록으로</button>
        </div>
    </form>
</body>
</html>