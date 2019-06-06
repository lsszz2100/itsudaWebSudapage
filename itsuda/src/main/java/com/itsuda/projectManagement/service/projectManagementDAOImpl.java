package com.itsuda.projectManagement.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.projectManagement.vo.iconFileVO;
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
		return sql.selectList(namespace + ".projectList", projectVO);
	}

	//프로젝트 등록
	@Override
	public void createProject(projectVO projectVO) throws Exception {
		sql.insert(namespace + ".createProject", projectVO);
	}

	//서브 메인페이지 기본 정보 리스트
	@Override
	public projectVO subMainList(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".subMainList", projectVO);
	}

	//프로젝트 기본정보 수정
	@Override
	public void subMainModify(projectVO projectVO) throws Exception {
		sql.update(namespace + ".subMainModify", projectVO);
	}
	
	//아이콘 파일 업로드
	@Override
	public void iconFileInsert(iconFileVO iconFileVO) throws Exception {
		sql.insert(namespace+".iconFileInsert", iconFileVO);
	}

	//아이콘 파일 가져오기
	@Override
	public String iconFileLoad(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".iconFileLoad", projectVO);
	}

	//아이콘 데이터 삭제
	@Override
	public void iconDelete(projectVO projectVO) throws Exception {
		sql.update(namespace+".iconDelete", projectVO);
	}
}