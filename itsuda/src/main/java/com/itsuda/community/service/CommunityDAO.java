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

}
