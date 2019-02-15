package com.itsuda.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.notice.vo.NoticeVO;

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
	public List<NoticeVO> getListBoard() {
		return sqlSession.selectList(namespace + ".getListBoard");
	}

}