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

	//글 목록 
	@Override
	public List<CommunityVO> getList(String team) {
		Map<String, String> map = new HashMap<>();
		
		map.put("team", team);
		return sql.selectList(namespace+".getList", map);
	}

	@Override
	public CommunityVO detailBoard(int seq) {
		return sql.selectOne(namespace+".detailBoard", seq);
	}

	@Override
	public void updateViewCnt(int seq) {
		sql.update(namespace+".updateViewCnt", seq);
	}
}