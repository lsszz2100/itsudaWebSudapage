package com.itsuda.dbOjectBoard.service;

import java.util.List;   

import javax.annotation.Resource;

import com.itsuda.dbOjectBoard.vo.dbBoardFileVO;
import com.itsuda.dbOjectBoard.vo.dbBoardVO;



@Resource
public interface dbBoardDAO {
	public String getTime();
	
	public List<dbBoardVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	public int countPage(SearchCriteria searchCriteria) throws Exception;
	
	//글 상세 목록
	public dbBoardVO detailBoard(int seq);
	
	//조회수 증가
	public void updateViewCnt(int seq); 
	
	//글 등록
	public void insertBoard(dbBoardVO BoardVO);
	
	//글 수정 하기 전에 데이터 가져오기
	public dbBoardVO getBoard(int seq);
	
	//글 수정
	public void updateBoard(dbBoardVO BoardVO);
	
	//글 삭제
	public void deleteBoard(int seq) ;
	
	//최근 게시물 게수
	public List<dbBoardVO> lastestPageNum();

	//파일 업로드
	public void fileInsert(dbBoardFileVO file) throws Exception;
	
	//파일 리스트
	public List<dbBoardFileVO> fileDetail(int seq) throws Exception;
	
	//파일 다운로드
	public dbBoardFileVO fileDownload(int upSeq, int seq) throws Exception;
	
	//파일 삭제
	public void fileDelete(int upSeq, int seq) throws Exception;
	
	//파일 다운로드 회수 증가
	public void fileDownloadCnt(int upSeq, int seq) throws Exception;
	
	//게시글 삭제 시 파일 모두 삭제
	public void fileDeleteAll(int seq) throws Exception;

}
