package com.itsuda.calendar.service;

import java.util.List;
import javax.annotation.Resource;
import com.itsuda.library.vo.LibraryVO;

@Resource
public interface CalendarDAO {
	public String getTime();
	public int insertLink(LibraryVO vo, String team) throws Exception;
	public List<LibraryVO> selectLink(int seq, String team) throws Exception;
	public List<LibraryVO> selectLinkAjax(int seq, String team, int amount) throws Exception;
	public void deleteLink(int seq, String team) throws Exception;
	public LibraryVO editLink(int seq, String team) throws Exception;
	public int updateLink(LibraryVO vo, String team) throws Exception;
	
	/*
	 *	작성자 : 황유미
	 *	작성일 : 2018-07-06
	 *  TODO : 필터링 구현 필요 (조건 : 검색값, 작성자)
	 */
	public LibraryVO readLinkbyHashlink(String Hashlink) throws Exception;
	public LibraryVO readLinkbyAuthor(String Author) throws Exception;	
}
