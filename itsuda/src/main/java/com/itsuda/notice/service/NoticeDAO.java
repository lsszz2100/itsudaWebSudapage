package com.itsuda.notice.service;

import java.util.List;
import javax.annotation.Resource;

import com.itsuda.notice.vo.NoticeVO;

@Resource
public interface NoticeDAO {
	public String getTime();
	//board list
	public List<NoticeVO> getListBoard();
}
