package com.itsuda.notice.service;

import java.util.List;
import javax.annotation.Resource;

import com.itsuda.notice.vo.Criteria;
import com.itsuda.notice.vo.NoticeVO;
import com.itsuda.notice.vo.SearchCriteria;

@Resource
public interface NoticeDAO {
	public String getTime();

	public List<NoticeVO> getListBoard(Criteria criteria) throws Exception;

	public int insertBoard(NoticeVO noticeVO);

	public NoticeVO getOneBoard(int boardNo);

	public int deleteBoard(int boardNo);

	public int modifyBoard(NoticeVO noticeVO);

	public int countBorad(SearchCriteria criteria) throws Exception;
	
	public List<NoticeVO> selectNoBoard();
}
