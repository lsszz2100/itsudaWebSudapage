package com.itsuda.community.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itsuda.community.vo.CommunityVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO{
	
	@Autowired
	private SqlSession sql;

	private static final String namespace="itsuda.community";
	
	@Override
	public String getTime() {
		return null;
	}
	@Override
	public List<CommunityVO> listSearch(SearchCriteria searchCriteria) throws Exception{
		return sql.selectList(namespace+".listSearch", searchCriteria);
		
	}
	@Override
	public int countPage(SearchCriteria searchCriteria) throws Exception {
		return sql.selectOne(namespace+".countPage", searchCriteria);
	}

	//글 상세 페이지
	@Override
	public CommunityVO detailBoard(int seq) {
		return sql.selectOne(namespace+".detailBoard", seq);
	}

	//조회수 증가
	@Override
	public void updateViewCnt(int seq) {
		
		sql.update(namespace+".updateViewCnt", seq);
	}
	
	//글 작성
//	@Transactional
	@Override
	public void insertBoard(CommunityVO communityVO){  
		
		// 게시글 입력처리
		sql.insert(namespace+".insertBoard", communityVO);
//		String[] files = communityVO.getFiles();
//		if(files == null)
//			return;
//		
//		//게시글 첨부파일 입력처리
//		for(String fileName : files)
//			sql.insert(namespace+".addFile", fileName);
	}
	
	//글 수정 하기 전에 데이터 가져오기
	@Override
	public CommunityVO getBoard(int seq) {
		return sql.selectOne(namespace+".getBoard", seq);
	}
	
	//글 수정
	@Override
	public void updateBoard(CommunityVO communityVO) {
		sql.update(namespace+".updateBoard", communityVO);
	}
	
	//글 삭제
	@Override
	public void deleteBoard(int seq) {
		sql.update(namespace+".deleteBoard", seq);
	}
	
	//최근 게시물 갯수
	@Override
	public List<CommunityVO> lastestPageNum() {
		return sql.selectList(namespace+".lastestPageNum");
	}
	
//	//파일 업로드 
//	@Override
//	public void addFile(String fullName) throws Exception {
//		sql.insert(namespace+".addFile", fullName);
//	}
	
}