package com.itsuda.projectManagement.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
	//프로젝트 정보 가져오기
	@Override
	public projectVO projectInfo(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".projectInfo", projectVO);
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

	@Override
	public projectVO projectTerm(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".projectTerm", projectVO);
	}

	@Override
	public void quarterUpdate(projectVO projectVO) throws Exception {
		sql.update(namespace + ".quarterUpdate", projectVO);
	}

	@Override
	public int proQuarterCnt(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".proQuarterCnt", projectVO);
	}

	@Override
	public void insertQuarterProgress(projectVO projectVO) throws Exception {
		if(projectVO.getQuarter1() == null || projectVO.getQuarter1() == "" ) {
			projectVO.setQuarter1("0");
		}if(projectVO.getQuarter2() == null || projectVO.getQuarter2() == "") {
			projectVO.setQuarter2("0");
		}if(projectVO.getQuarter3() == null || projectVO.getQuarter3() == "") {
			projectVO.setQuarter3("0");
		}if(projectVO.getQuarter4() == null || projectVO.getQuarter4() == "") {
			projectVO.setQuarter4("0");
		}if(projectVO.getQuarter5() == null || projectVO.getQuarter5() == "") {
			projectVO.setQuarter5("0");
		}if(projectVO.getQuarter6() == null || projectVO.getQuarter6() == "") {
			projectVO.setQuarter6("0");
		}if(projectVO.getQuarter7() == null || projectVO.getQuarter7() == "") {
			projectVO.setQuarter7("0");
		}if(projectVO.getQuarter8() == null || projectVO.getQuarter8() == "") {
			projectVO.setQuarter8("0");
		}if(projectVO.getQuarter9() == null || projectVO.getQuarter9() == "") {
			projectVO.setQuarter9("0");
		}if(projectVO.getQuarter10() == null || projectVO.getQuarter10() == "") {
			projectVO.setQuarter10("0");
		}if(projectVO.getQuarter11() == null || projectVO.getQuarter11() == "") {
			projectVO.setQuarter11("0");
		}if(projectVO.getQuarter12() == null || projectVO.getQuarter12() == "") {
			projectVO.setQuarter12("0");
		}
		sql.update(namespace + ".insertQuarterProgress", projectVO);
		
	}

	@Override
	public projectVO quarterList(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".quarterList", projectVO);
	}

	@Override
	public void creatQuarter(int seq) throws Exception {
		sql.insert(namespace + ".creatQuarter", seq);
	}

	@Override
	public int createdProjectSeq(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".createdProjectSeq", projectVO);
	}

	@Override
	public int cntGO(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".cntGO", projectVO);
	}

	@Override
	public int cntBUG(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".cntBUG", projectVO);
	}
	
	@Override
	public int cntEND(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".cntEND", projectVO);
	}

	@Override
	public List<projectVO> commentList(projectVO projectVO) throws Exception {
		return sql.selectList(namespace + ".commentList", projectVO);
	}

	@Override
	public void insertTeamMember(projectVO projectVO) throws Exception {
		sql.update(namespace + ".insertTeamMember", projectVO);
	}

	@Override
	public projectVO getTeamMember(projectVO projectVO) throws Exception {
		return sql.selectOne(namespace + ".getTeamMember", projectVO);
	}
}
