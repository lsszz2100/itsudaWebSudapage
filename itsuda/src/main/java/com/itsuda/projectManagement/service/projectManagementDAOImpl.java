package com.itsuda.projectManagement.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.projectManagement.vo.projectVO;

@Repository
public class projectManagementDAOImpl implements projectManagementDAO {

	@Autowired
	private SqlSession sql;

	private static final String namespace = "itsuda.projectManagement";

	@Override
	public String getTime() {
		return null;
	}

	// 프로젝트 년도 가져오기
	@Override
	public List<projectVO> projectYear() throws Exception {
		return sql.selectList(namespace + ".projectYear");
	}

	// 프로젝트 목록 가져오기
	@Override
	public List<projectVO> projectList(projectVO projectVO) throws Exception {
//		HashMap<String, String> map = new HashMap<>();
//		map.put("proYar", proYear);
//		map.put("proStatus", proStatus);

		return sql.selectList(namespace + ".projectList", projectVO);
	}

	//프로젝트 등록
	@Override
	public void createProject(projectVO projectVO) throws Exception {
		sql.insert(namespace + ".createProject", projectVO);
	}
}