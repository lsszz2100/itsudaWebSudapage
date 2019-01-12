package com.itsuda.calendar.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itsuda.calendar.service.CalendarDAOImpl;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	
	@Resource
	private CalendarDAOImpl dao;
	
	
	// main페이지 기본 표출 데이터
	@RequestMapping(value = "defalut", method = RequestMethod.GET)
	public Model Main(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 월 단위 스케줄(공통,개인)
		*/
		return model;
	}
	
	// 개인 스케줄 등록
	@RequestMapping(value = "insertInd", method = RequestMethod.POST)
	public String InsertInd(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 개인 스케줄 등록
		*/
		return "main";
	}
	
	// 개인 스케줄 삭제
	@RequestMapping(value = "deleteInd", method = RequestMethod.POST)
	public String DeleteInd(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 개인 스케줄 삭제
		 */
		return "main";
	}

	// 개인 스케줄 수정
	@RequestMapping(value = "modifyInd", method = RequestMethod.POST)
	public String ModifyInd(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 개인 스케줄 수정
		 */
		return "main";
	}
	
	
	

	// 공통 스케줄 등록
	@RequestMapping(value = "insertAdm", method = RequestMethod.POST)
	public String InsertAdm(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 공통 스케줄 등록
		 */
		return "adminMain";
	}
	
	// 공통 스케줄 삭제
	@RequestMapping(value = "deleteAdm", method = RequestMethod.POST)
	public String DeleteAdm(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 공통 스케줄 삭제
		 */
		return "adminMain";
	}

	// 공통 스케줄 수정
	@RequestMapping(value = "modifyAdm", method = RequestMethod.POST)
	public String ModifyAdm(Model model, @RequestParam("mode") String mode)
	{	
		/* 
		 * TODO: 
		 * 1. 공통 스케줄 수정
		 */
		return "adminMain";
	}
	
}
