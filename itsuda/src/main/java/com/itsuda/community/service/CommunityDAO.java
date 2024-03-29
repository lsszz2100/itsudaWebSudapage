package com.itsuda.community.service;

import java.util.List;

import javax.annotation.Resource;

import com.itsuda.community.vo.CommunityVO;
import com.itsuda.community.vo.FileVO;

@Resource
public interface CommunityDAO {
	public String getTime();
	
	public List<CommunityVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	public int countPage(SearchCriteria searchCriteria) throws Exception;
	
	//글 상세 목록
	public CommunityVO detailBoard(int seq);
	
	//조회수 증가
	public void updateViewCnt(int seq);
	
	//글 등록
	public void insertBoard(CommunityVO communityVO);
	
	//글 수정 하기 전에 데이터 가져오기
	public CommunityVO getBoard(int seq);
	
	//글 수정
	public void updateBoard(CommunityVO communityVO);
	
	//글 삭제
	public void deleteBoard(int seq) ;
	
	//최근 게시물 게수
	public List<CommunityVO> lastestPageNum();

	//파일 업로드
	public void fileInsert(FileVO file) throws Exception;
	
	//파일 리스트
	public List<FileVO> fileDetail(int seq) throws Exception;
	
	//파일 다운로드
	public FileVO fileDownload(int upSeq, int seq) throws Exception;
	
	//파일 삭제
	public void fileDelete(int upSeq, int seq) throws Exception;
	
	//파일 다운로드 회수 증가
	public void fileDownloadCnt(int upSeq, int seq) throws Exception;
	
	//게시글 삭제 시 파일 모두 삭제
	public void fileDeleteAll(int seq) throws Exception;

	//디자인 최신5개글
	public List<CommunityVO> selectTopFiveDesign();
	//모바일 최신5개글
	public List<CommunityVO> selectTopFiveMobile();
	//기획 최신5개글
	public List<CommunityVO> selectTopFivePlan();
	//웹 최신5개글
	public List<CommunityVO> selectTopFiveWeb();

}
