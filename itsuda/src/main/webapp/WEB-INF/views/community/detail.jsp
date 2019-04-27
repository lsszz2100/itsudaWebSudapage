<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/directives.jsp"%>
<!DOCTYPE html PUBLIC "--//W3C//DTD HTML 4.01 Transitional//EN"
						"http://www.w3.org/TR/html4/loose.dtd">

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



