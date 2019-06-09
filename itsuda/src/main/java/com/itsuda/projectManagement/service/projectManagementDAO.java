package com.itsuda.projectManagement.service;

import java.util.List;

import javax.annotation.Resource;

import com.itsuda.notice.vo.NoticeFileVO;
import com.itsuda.projectManagement.vo.iconFileVO;
import com.itsuda.projectManagement.vo.projectVO;


@Resource
public interface projectManagementDAO {
	public String getTime();
	
	//프로젝트 년도 가져오기
	public List<projectVO> projectYear() throws Exception;
	//프로젝트 목록 가져오기
	public List<projectVO> projectList(projectVO projectVO) throws Exception;
	//프로젝트 프로젝트 정보 가져오기(이름, 설명)
	public projectVO projectInfo(projectVO projectVO) throws Exception;
	//프로젝트  등록
	public void createProject(projectVO projectVO) throws Exception;
	//서브 메인페이지 기본 정보 리스트
	public projectVO subMainList(projectVO projectVO) throws Exception;
	//프로젝트 기본정보 수정
	public void subMainModify(projectVO projectVO) throws Exception;
	//아이콘 파일 업로드
	public void iconFileInsert(iconFileVO iconFileVO) throws Exception;
	//아이콘 파일 가져오기
	public String iconFileLoad(projectVO projectVO) throws Exception;
	//아이콘 데이터 삭제
	public void iconDelete(projectVO projectVO) throws Exception;
	// 기간 가져오기
	public projectVO projectTerm(projectVO projectVO) throws Exception;
	//분기 수정
	public void quarterUpdate(projectVO projectVO) throws Exception;
	//분기 조회
	public int proQuarterCnt(projectVO projectVO) throws Exception;
	//분기 테이블 생성
	public void creatQuarter(int seq) throws Exception;
	//분기 진행률 저장
	public void insertQuarterProgress(projectVO projectVO) throws Exception;
	//분기 진행률 조회
	public projectVO quarterList(projectVO projectVO) throws Exception;
	//생성된 프로젝트 seq 조회
	public int createdProjectSeq(projectVO projectVO) throws Exception;
	//이슈 게시판 상태 개수 조회
		public int cntGO(projectVO projectVO) throws Exception;
		//생성된 프로젝트 seq 조회
		public int cntBUG(projectVO projectVO) throws Exception;
		//생성된 프로젝트 seq 조회
		public int cntEND(projectVO projectVO) throws Exception;
	//코멘트 리스트 출력(제목, 갯수)
	public List<projectVO> commentList(projectVO projectVO) throws Exception;
	//팀원 등록
	public void insertTeamMember(projectVO projectVO) throws Exception;
	//팀원 조회
	public projectVO getTeamMember(projectVO projectVO) throws Exception;
}
