package com.itsuda.dbOjectBoard.service;
 
import java.util.HashMap;     
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.dbOjectBoard.vo.dbBoardFileVO;
import com.itsuda.dbOjectBoard.vo.dbBoardVO;
  


@Repository
public class dbBoardDAOImpl implements dbBoardDAO{
	
	@Autowired
	private SqlSession sql;

	private static final String namespace="itsuda.dbOjectBoard";
	
	@Override
	public String getTime() {
		return null;
	}
	@Override
	public List<dbBoardVO> listSearch(SearchCriteria searchCriteria) throws Exception{
		return sql.selectList(namespace+".listSearch", searchCriteria);
	}
	@Override
	public int countPage(SearchCriteria searchCriteria) throws Exception {
		return sql.selectOne(namespace+".countPage", searchCriteria);
	}
	//글 상세 페이지
	@Override
	public dbBoardVO detailBoard(int seq) {
		return sql.selectOne(namespace+".detailBoard", seq);
	}
	//조회수 증가
	@Override
	public void updateViewCnt(int seq) {
		
		sql.update(namespace+".updateViewCnt", seq);
	}
	// 글 작성
	@Override
	public void insertBoard(dbBoardVO BoardVO){  
		sql.insert(namespace+".insertBoard", BoardVO);
	}
	//글 수정 하기 전에 데이터 가져오기
	@Override
	public dbBoardVO getBoard(int seq) {
		return sql.selectOne(namespace+".getBoard", seq);
	}
	//글 수정
	@Override
	public void updateBoard(dbBoardVO BoardVO) {
		sql.update(namespace+".updateBoard", BoardVO);
	}
	//글 삭제
	@Override
	public void deleteBoard(int seq) {
		sql.update(namespace+".deleteBoard", seq);
	}
	//최근 게시물 갯수
	@Override
	public List<dbBoardVO> lastestPageNum() {
		return sql.selectList(namespace+".lastestPageNum");
	}
	//파일 업로드 
	@Override
	public void fileInsert(dbBoardFileVO file) throws Exception {
		 sql.insert(namespace+".fileInsert", file);
	}
	//파일 리스트
	@Override
	public List<dbBoardFileVO> fileDetail(int seq) throws Exception {
		return sql.selectList(namespace+".fileDetail", seq);
	}
	//파일 다운로드
	@Override
	public dbBoardFileVO fileDownload(int upSeq, int seq) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("upSeq", upSeq);
		map.put("seq", seq);
		return sql.selectOne(namespace+".fileDownload", map);
	}
	//파일 삭제
	@Override
	public void fileDelete(int upSeq, int seq) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("upSeq", upSeq);
		map.put("seq", seq);
		sql.update(namespace+".fileDelete", map);
	}
	//파일 다운로드 회수 증가
	@Override
	public void fileDownloadCnt(int upSeq, int seq) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("upSeq", upSeq);
		map.put("seq", seq);
		sql.update(namespace + ".fileDownloadCnt", map);
	}
	//게시글 삭제시 파일 모두 삭제
	@Override
	public void fileDeleteAll(int seq) throws Exception {
		sql.update(namespace+".fileDeleteAll", seq);
	}
}