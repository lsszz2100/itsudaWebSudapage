<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/default/include/include.jsp"%>
<!DOCTYPE html PUBLIC "--//W3C//DTD HTML 4.01 Transitional//EN"
						"http://www.w3.org/TR/html4/loose.dtd">

<form action="updateBoard.do" method="get">
<input name="seq" type"hidden" value="${vo.seq }" />
 <table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="orange" width="70">제목</td>
		<td align="left"><input name="title" type="text" value="${vo.title }"/></td>
	<tr>
	<tr>
		<td bgcolor="orange" >작성자</td>
		<td align="left"><input name="title" type="text" value="${vo.writer }"/></td>
	</tr>
	<tr>
		<td bgcolor="orange" >내용</td>
		<td align="left"><input name="title" type="text" value="${vo.description }"/><textarea name="content" cols="40" rows="10" >
			</textarea></td>
	</tr>
	<tr>
		<td bgcolor="orange">등록일</td>
		<td align="left"><input name="title" type="text" value="${vo.crtDt }"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">조회수</td>
		<td align="left"><input name="title" type="text" value="${vo.viewCnt }"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="글 수정"/>
		</td>
	</tr>
</table> 
</form>
<hr>
<a href="">글등록</a>&nbsp;&nbsp;&nbsp;
<a href="">글삭제</a>&nbsp;&nbsp;&nbsp;
<a href="">글목록</a>
