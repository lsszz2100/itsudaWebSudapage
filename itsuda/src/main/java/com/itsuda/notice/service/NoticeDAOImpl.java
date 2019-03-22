package com.itsuda.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.notice.vo.Criteria;
import com.itsuda.notice.vo.NoticeVO;
import com.itsuda.notice.vo.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "itsuda.notice";

	@Override
	public String getTime() {
		return null;
	}

	@Override
	public List<NoticeVO> getListBoard(Criteria criteria) throws Exception {
		return sqlSession.selectList(namespace + ".getListBoard" ,criteria);
	}

	@Override
	public int insertBoard(NoticeVO noticeVO) {
		return sqlSession.insert(namespace + ".insertBoard", noticeVO);
	}

	@Override
	public NoticeVO getOneBoard(int boardNo) {
		return sqlSession.selectOne(namespace + ".getOneBoard", boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.update(namespace + ".deleteBoard", boardNo);
	}

	@Override
	public int modifyBoard(NoticeVO noticeVO) {
		return sqlSession.update(namespace + ".modifyBoard", noticeVO);
	}

	@Override
	public List<NoticeVO> selectBoard() {
		return sqlSession.selectList(namespace + ".selectBoard");
	}

	@Override
	public int countBorad(SearchCriteria criteria) throws Exception {
		return sqlSession.selectOne(namespace + ".countBorad", criteria);
	}

}