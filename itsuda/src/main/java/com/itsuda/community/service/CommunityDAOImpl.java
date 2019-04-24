package com.itsuda.community.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("team", Integer.parseInt(searchCriteria.getTeam()));
//		map.put("keyword", searchCriteria.getKeyword());
//		map.put("pageStart", searchCriteria.getPageStart());
//		map.put("endStart", searchCriteria.getPerPageNum());
		return sql.selectList(namespace+".listSearch", searchCriteria);
		
	}
	
	
	@Override
	public int countPage(SearchCriteria searchCriteria) throws Exception {
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("team", searchCriteria.getTeam());
//		map.put("keyword", searchCriteria.getKeyword());
		return sql.selectOne(namespace+".countPage", searchCriteria);
	}

	@Override
	public List<CommunityVO> listPaging(int page) {
		
		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return sql.selectList(namespace+".listPaging", page);
	}
	
	//글 목록 
	@Override
	public List<CommunityVO> getList(String team) {
		Map<String, String> map = new HashMap<>();
		
		map.put("team", team);
		return sql.selectList(namespace+".getList", map);
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
	@Override
	public void insertBoard(CommunityVO communityVO){  
		sql.insert(namespace+".insertBoard", communityVO);
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
	
}