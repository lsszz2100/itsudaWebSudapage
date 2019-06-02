package com.itsuda.projectManagement.service;

import java.util.List;

import javax.annotation.Resource;

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
}
