package com.itsuda.calendar.service;

import java.util.List;
import javax.annotation.Resource;
import com.itsuda.calendar.vo.CalendarVO;

@Resource
public interface CalendarDAO {
	/*
	 * 작성자 : 홍민석
	 * 작성일 : 2019-01-13
	 * TODO : LibraryVO를 CalendarVO로 변경하였습니다.
	 * 
	 */
	public boolean insertSchedule(CalendarVO vo) throws Exception;
	public List<CalendarVO> selectSchJson(String id) throws Exception;
	public int deleteSchedule(String id) throws Exception;
	public int updateSchedule(CalendarVO vo) throws Exception;
	
	
	
	
	
	
	public String getTime();
	public int insertLink(CalendarVO vo, String team) throws Exception;
	public List<CalendarVO> selectLink(int seq, String team) throws Exception;
	public List<CalendarVO> selectLinkAjax(int seq, String team, int amount) throws Exception;
	public void deleteLink(int seq, String team) throws Exception;
	public CalendarVO editLink(int seq, String team) throws Exception;
	public int updateLink(CalendarVO vo, String team) throws Exception;
	
	/*
	 *	작성자 : 황유미
	 *	작성일 : 2018-07-06
	 *  TODO : 필터링 구현 필요 (조건 : 검색값, 작성자)
	 */
	public CalendarVO readLinkbyHashlink(String Hashlink) throws Exception;
	public CalendarVO readLinkbyAuthor(String Author) throws Exception;	
}
