<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp"%>

<div>
<form action= "<c:url value='/notice/insertPage'/>" method="post">
    <input type="hidden" id="boardWriter" name="boardWriter" value="coogy" > 
    <div style="padding-top: 100px;
    padding-right: 150px;
    padding-left: 150px;
    margin-right: auto;
    margin-left: auto;">
    
    
        <div class="form-group" >
              <label for="title">제목</label>
            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 작성해주세요." required >
          </div>

          <div class="form-group">
            <label for="description">내용</label>
            <textarea class="form-control" id="boardContent" name="boardContent" rows="10" required></textarea>
          </div>
          
        <button type="submit" class="btn btn-info" onclick="#" >등록하기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='../notice/main ">목록으로</button>
        </div>
    </form>

</div>