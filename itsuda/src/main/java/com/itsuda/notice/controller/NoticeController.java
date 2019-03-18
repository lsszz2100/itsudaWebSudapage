package com.itsuda.notice.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itsuda.common.utility.UriMap;
import com.itsuda.notice.service.NoticeDAOImpl;
import com.itsuda.notice.vo.NoticeVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController extends UriMap {

	@Resource
	private NoticeDAOImpl dao;
	
	private int pageSize 	= 10;		// 페이지의 출력 단위
	private int navSize 	= 5;		// 네비 출력 갯수
	
	
	
	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 메인화면 이동 
	 * 최종 수정일 	: 03-16
	 * 수정 이력	: 03-16
	 * 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model)
	{	
		model.addAttribute("list", dao.getListBoard());
		return URI_NOTICE_MAIN;
	}

	
	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 등록화면 이동 
	 * 최종 수정일 	: 03-16
	 * 수정 이력	: 03-16
	 * 
	 */
	@RequestMapping("insert")
	public String insert(Model model)
	{	
		return URI_NOTICE_INSERT;
	}

	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 등록 
	 * 최종 수정일 	: 03-17
	 * 수정 이력	: 03-19
	 * 
	 * noticeVO 이걸 쓰면 따로 받지 않아도 잘 실행 된다. 공부좀하자 준서야
	 * 
	 */
	@RequestMapping(value = "insertPage", method = RequestMethod.POST)
	public String InsertAction(Model model ,NoticeVO noticeVO)
	{	
		if(dao.insertBoard(noticeVO) == 1)
			return "redirect:/notice/main";
		else
			return URI_NOTICE_INSERT;
		

		//"redirect:" + URI_NOTICE_MAIN; 리다이렉션이 먹지 않는다, 문의 필요!!!!!!!!!!!!! 		03-17
	}

	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 삭제 
	 * 최종 수정일 	: 03-17
	 * 수정 이력	: 03-17
	 * 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("boardNo") String boardNo)
	{	
		try {
			dao.deleteBoard(Integer.parseInt(boardNo));
			return "redirect:/notice/main";
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return "redirect:/notice/detail?boardNo="+boardNo;
		
		
	}

	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 수정화면 이동
	 * 최종 수정일 	: 03-19
	 * 수정 이력	: 03-19
	 * 
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(Model model,  @RequestParam("boardNo") String boardNo)
	{	
		
		model.addAttribute("modify", dao.getOneBoard(Integer.parseInt(boardNo)));
		
		return URI_NOTICE_MODIFY;
	}

	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 수정
	 * 최종 수정일 	: 03-18
	 * 수정 이력	: 03-18
	 * 
	 */
	@RequestMapping(value = "modifyPage", method = RequestMethod.POST)
	public String modifyPage(Model model,NoticeVO noticeVO)
	{	
		
		if(dao.modifyBoard(noticeVO)==1)
			return "redirect:/notice/main";
		else
			return "redirect:/notice/modify?boardNo="+noticeVO.getBoardNo();
	}

	/**
	 * 작성자		: 조준서
	 * 기능명		: 공지사항 글 상세정보 확인
	 * 최종 수정일 	: 03-17
	 * 수정 이력	: 03-17
	 * 
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam("boardNo") String boardNo)
	{	
		model.addAttribute("detail", dao.getOneBoard(Integer.parseInt(boardNo)));
		return URI_NOTICE_DETAIL;
	}
	
	
	
}
