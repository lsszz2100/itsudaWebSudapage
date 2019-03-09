package com.itsuda.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.common.vo.CodeVO;

@Repository
public class CommonDAOImpl {
	
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="itsuda.common";
	
	
	/*
	 * 작성자	: 황준영
	 * 작성일 : 2019-02-11
	 * 기능	: OneDesc Selector
	 */
	public CodeVO getOneCodeDesc(String category, String id) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("id", id);
		return sqlSession.selectOne(namespace+".getOneCodeDesc",map);
	}
	
	/*
	 * 작성자	: 황준영
	 * 작성일 : 2019-02-11
	 * 기능	: GradeListDesc Selector
	 */
	public List<CodeVO> getListGradeDesc() throws Exception {
		return sqlSession.selectList(namespace+".getListGradeDesc");
	}

	/*
	 * 작성자	: 황준영
	 * 작성일 : 2019-02-11
	 * 기능	: TeamListDesc Selector
	 */
	public List<CodeVO> getListTeamDesc() throws Exception {
		return sqlSession.selectList(namespace+".getListTeamDesc");
	}

	/*
	 * 작성자	: 황준영
	 * 작성일 : 2019-02-11
	 * 기능	: GradeOneDesc Selector
	 */
	public CodeVO getOneGradeDesc(String id) throws Exception {
		return sqlSession.selectOne(namespace+".getOneGradeDesc");
	}
	
	/*
	 * 작성자	: 황준영
	 * 작성일 : 2019-02-11
	 * 기능	: TeamOneDesc Selector
	 */
	public CodeVO getOneTeamDesc(String id) throws Exception {
		return sqlSession.selectOne(namespace+".getOneTeamDesc");
	}

}