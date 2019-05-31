package com.itsuda.notice.service;

import java.util.List; 

import javax.annotation.Resource;

import com.itsuda.notice.vo.NoticeFileVO;
import com.itsuda.notice.vo.NoticeVO;



@Resource
public interface NoticeDAO {
	public String getTime();
	
	public List<NoticeVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	public int countPage(SearchCriteria searchCriteria) throws Exception;
	
	//글 상세 목록
	public NoticeVO detailBoard(int seq);
	
	//조회수 증가
	public void updateViewCnt(int seq);
	
	//글 등록
	public void insertBoard(NoticeVO noticeVO);
	
	//글 수정 하기 전에 데이터 가져오기
	public NoticeVO getBoard(int seq);
	
	//글 수정
	public void updateBoard(NoticeVO noticeVO);
	
	//글 삭제
	public void deleteBoard(int seq) ;
	
	//최근 게시물 게수
	public List<NoticeVO> lastestPageNum();

	//파일 업로드
	public void fileInsert(NoticeFileVO file) throws Exception;
	
	//파일 리스트
	public List<NoticeFileVO> fileDetail(int seq) throws Exception;
	
	//파일 다운로드
	public NoticeFileVO fileDownload(int upSeq, int seq) throws Exception;
	
	//파일 삭제
	public void fileDelete(int upSeq, int seq) throws Exception;
	
	//파일 다운로드 회수 증가
	public void fileDownloadCnt(int upSeq, int seq) throws Exception;
	
	//게시글 삭제 시 파일 모두 삭제
	public void fileDeleteAll(int seq) throws Exception;

}
