package com.itsuda.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.library.vo.LibraryVO;

@Repository
public class LibraryDAOImpl implements LibraryDAO{
	
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="itsuda.library";
	
	/*
	 *	작성자 : 황유미
	 *	작성일 : 2018-07-06
	 *  TODO : DB - WAS 서버 이중화 시 진행할 필요 있음
	 */
	@Override
	public String getTime() {
		return null;
	}

	@Override
	public List<LibraryVO> selectLink(int seq, String team) throws Exception {
		Map<String, String> param = new HashMap<String, String>();
		param.put("mode", team.toUpperCase());
		param.put("seq", String.valueOf(seq));
		
//		return sqlSession.selectList(namespace+".selectLink", param);
		return null;
	}
	

	@Override
	public List<LibraryVO> selectLinkAjax(int seq, String team, int amount) throws Exception {
		Map<String, String> param = new HashMap<String, String>();
		param.put("mode", team.toUpperCase());
		param.put("seq", String.valueOf(seq));
		param.put("amount", String.valueOf(seq-amount));
		
//		return sqlSession.selectList(namespace+".selectLinkAjax", param);
		return null;
	}
	@Override
	public int insertLink(LibraryVO vo, String team) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("lib",vo);

//		int num = sqlSession.insert(namespace+".insertLink", param);

//		return num;
		return 0;
	}

	@Override
	public void deleteLink(int seq, String team) throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("seq",seq);

//		sqlSession.update(namespace+".deleteLink", param);
	}

	@Override
	public LibraryVO editLink(int seq, String team) throws Exception {
		LibraryVO vo = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("seq",seq);
		
//		vo = sqlSession.selectOne(namespace+".editLink", param);
		
//		return vo;
		return null;
	}

	@Override
	public int updateLink(LibraryVO vo, String team) throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("lib",vo);
		int num = 0;
//		System.out.println("mode:"+team.toUpperCase());
//		System.out.println("vo1:"+vo.toString());
//		try{
//			num = sqlSession.update(namespace+".updateLink", param);
//		}catch(Exception ex)
//		{
//			System.out.println(ex.getMessage());
//		}
		
//		return num;
		return 0;
	}
	
	/*
	 *	작성자 : 황유미
	 *	작성일 : 2018-07-06
	 *  TODO : 필터링 구현 필요 (조건 : 검색값, 작성자)
	 */
	@Override
	public LibraryVO readLinkbyHashlink(String Hashlink) throws Exception {
		return null;
	}

	@Override
	public LibraryVO readLinkbyAuthor(String Author) throws Exception {
		return null;
	}


}