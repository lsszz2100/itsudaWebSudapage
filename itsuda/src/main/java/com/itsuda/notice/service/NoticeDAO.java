package com.itsuda.notice.service;

import java.util.List;
import javax.annotation.Resource;

import com.itsuda.notice.vo.NoticeVO;

@Resource
public interface NoticeDAO {
	public String getTime();

	public List<NoticeVO> getListBoard();
	
	public int insertBoard(NoticeVO noticeVO);
	
	public NoticeVO getOneBoard(int boardNo);
	
	public int deleteBoard(int boardNo);
	
	public int modifyBoard(NoticeVO noticeVO);
}
