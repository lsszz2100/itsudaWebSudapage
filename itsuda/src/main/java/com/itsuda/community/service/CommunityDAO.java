package com.itsuda.community.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.itsuda.community.vo.CommunityVO;

@Resource
public interface CommunityDAO {
	public String getTime();
	/**
	 * 최초 개시판 불러오기
	 * @param team
	 * @return
	 */
	
	//글 목록
	public List<CommunityVO> getList(String team);
	
	//글 상세 목록
	public CommunityVO detailBoard(int seq);
	
	// 조회수 증가
	public void updateViewCnt(int seq);

	
}
