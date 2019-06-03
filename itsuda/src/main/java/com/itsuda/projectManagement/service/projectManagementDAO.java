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
}
