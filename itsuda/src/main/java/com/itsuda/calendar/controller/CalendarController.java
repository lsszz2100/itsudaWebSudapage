package com.itsuda.calendar.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itsuda.calendar.service.CalendarDAOImpl;
import com.itsuda.calendar.vo.CalendarVO;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	
	@Resource
	private CalendarDAOImpl dao;
	
	//Calendar에 뿌려줄 데이터 호출
	@RequestMapping(value="ajaxLoad.json", method=RequestMethod.GET)
	public @ResponseBody List<CalendarVO> AjaxView(){
		List<CalendarVO> scheduler = new ArrayList<CalendarVO>();
		//dao   //Service에서  DB처리
		CalendarVO calendar = new CalendarVO();
		calendar.setId("1");
		calendar.setTitle("Hi");
		calendar.setStart("2019-01-19");
		calendar.setEnd("2019-01-24");
		calendar.setAllDay(false);
		calendar.setColor("red");
		scheduler.add(calendar);
		
		return scheduler;
		
		
	}

	/* HttpServletResponse 방식
	@RequestMapping(value="ajaxLoad.json", method=RequestMethod.GET)
	public void AjaxView(HttpServletResponse response){
		String CalendarInfo;
		CalendarInfo="["+"{\"title\":\""+"allDay"
					+"\",\"start\":\""+"2019-01-19"
					+"\",\"end\":\""+"2019-02-01"+"\"}"+","
					+"{\"title\":\""+"reservation1"
					+"\",\"start\":\""+"2019-01-19"
					+"\",\"end\":\""+"2019-01-24"+"\"}"+","
					+"{\"title\":\""+"reservation2"
					+"\",\"start\":\""+"2019-01-19"
					+"\",\"end\":\""+"2019-01-23"+"\"}"+"]";
				
		try {
			response.getWriter().print(CalendarInfo);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	*/
	// main페이지 기본 표출 데이터
	@RequestMapping(value = "default", method = RequestMethod.GET)
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
	public String InsertInd(Model model, @RequestParam("title") String title, @RequestParam("start-day") String startDay, 
			@RequestParam("end-day") String endDay, @RequestParam("type") String type)
	{	
		/* 
		 * TODO: 
		 * 1. 개인 스케줄 등록
		 * DONE:
		 * 1. form에서 title, start-day, end-day 받아오기 성공.
		 * 2. CalendarVO로 데이터 전달
		 * 3. DB Insert 성공
		 * 
		*/
		CalendarVO calendar = new CalendarVO();
		
		
		if(type.equals("public"))
			type="pub";
		else
			type="pri";
		
		calendar.setTitle(title);
		calendar.setStart(startDay);
		calendar.setEnd(endDay);
		calendar.setType(type);
		calendar.setAllDay(true);
		calendar.setColor("blue");
		calendar.setWriter("hjo0045@naver.com");
		try {
			dao.insertSchedule(calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "main";
	}
	
	// 개인 스케줄 삭제
	@RequestMapping(value = "deleteInd", method = RequestMethod.POST)
	public String DeleteInd(Model model, @RequestParam("scheduleID") String id)
	{	
		/* 
		 * TODO: 
		 * 1. DAO로 넘겨서 해당 ID를 가진 DB값 제거 후 리셋하기.
		 * DONE:
		 * 1. FORM에서 일정 ID값 받아오기 성공.
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
