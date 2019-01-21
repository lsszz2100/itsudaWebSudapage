package com.itsuda.calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.calendar.vo.CalendarVO;
import com.itsuda.library.vo.LibraryVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="itsuda.calendar";
	
	/*
	 *	작성자 : 황유미
	 *	작성일 : 2018-07-06
	 *  TODO : DB - WAS 서버 이중화 시 진행할 필요 있음
	 */
	@Override
	public String getTime() {
		return null;
	}

	
	/*
	 *	작성자 : 홍민석
	 *	작성일 : 2019-01-21
	 *  TODO : 
	 *  DONE : 
	 */
	
	@Override
	public boolean insertSchedule(CalendarVO vo) throws Exception {
		Map<String, Object> param=new HashMap<String,Object>();
		param.put("schedule", vo);
		
		sqlSession.insert(namespace+".insertSchedule",param);
		
		return false;
	}
	
	@Override
	public List<CalendarVO> selectLink(int seq, String team) throws Exception {
		Map<String, String> param = new HashMap<String, String>();
		param.put("mode", team.toUpperCase());
		param.put("seq", String.valueOf(seq));
		
//		return sqlSession.selectList(namespace+".getTime", param);
		return null;
	}
	

	@Override
	public List<CalendarVO> selectLinkAjax(int seq, String team, int amount) throws Exception {
		Map<String, String> param = new HashMap<String, String>();
		param.put("mode", team.toUpperCase());
		param.put("seq", String.valueOf(seq));
		param.put("amount", String.valueOf(seq-amount));
		
//		return sqlSession.selectList(namespace+".selectLinkAjax", param);
		return null;
	}
	@Override
	public int insertLink(CalendarVO vo, String team) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("lib",vo);
		
		return 0;
		
		/* 
		 * 이전 작업물
		 * 
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("lib",vo);

//		int num = sqlSession.insert(namespace+".insertLink", param);
W
//		return num;
		return 0;
		*/
	}

	@Override
	public void deleteLink(int seq, String team) throws Exception {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("seq",seq);

//		sqlSession.update(namespace+".deleteLink", param);
	}

	@Override
	public CalendarVO editLink(int seq, String team) throws Exception {
		LibraryVO vo = null;
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("mode",team.toUpperCase());
		param.put("seq",seq);
		
//		vo = sqlSession.selectOne(namespace+".editLink", param);
		
//		return vo;
		return null;
	}

	@Override
	public int updateLink(CalendarVO vo, String team) throws Exception {
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
	public CalendarVO readLinkbyHashlink(String Hashlink) throws Exception {
		return null;
	}

	@Override
	public CalendarVO readLinkbyAuthor(String Author) throws Exception {
		return null;
	}

	
	


}