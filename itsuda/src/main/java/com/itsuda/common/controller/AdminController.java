package com.itsuda.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itsuda.member.service.MemberDAO;
import com.itsuda.member.vo.MemberVO;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Resource
	private MemberDAO dao;
	
	/**
	 * 회원 가입 - 페이지 이동
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "registerMember", method = RequestMethod.GET)
	public String Register(Model model)
	{
		model.addAttribute("registered", "FALSE");
		model.addAttribute("memberVo", new MemberVO());
		return "registerMember";
	}
	
	/**
	 * 회원 가입 - 기능 동작
	 * @param req
	 * @param model
	 * @param vo
	 * @param bindingResult
	 * @return
	 */
	@RequestMapping(value = "registerMember", method = RequestMethod.POST)
	public String Register(HttpServletRequest req, Model model, @ModelAttribute("memberVo") @Valid MemberVO vo, BindingResult bindingResult)
	{	
		if (bindingResult.hasErrors()){
			return "registerMember";
		}
		else
		{
			vo.setPassword(req.getParameter("password"));
			vo.setEmail(req.getParameter("email"));
			vo.setName(req.getParameter("name"));
			
			/*vo.setMode("init"); // init,member,admin*/			
			/*try {
				dao.insertMember(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			model.addAttribute("registered", "TRUE");
			model.addAttribute("vo", new MemberVO());
			return "main";
		}
		
	}
	
	/**
	 * 회원 정보 수정 - 페이지 이동
	 * @return
	 */
	@RequestMapping(value = "modifyMember", method = RequestMethod.GET)
	public String Modify(Model model)
	{
		return "modifyMember";
	}

	/**
	 * 회원 정보 수정 - 페이지 이동
	 * @return
	 */
	@RequestMapping(value = "modifyMember", method = RequestMethod.POST)
	public String Modify(Model model, HttpServletRequest req, HttpServletResponse res)
	{
		// TODO : 회원정보 수정 리스트 작성 필요, 차후 회원정보 detail은 memberController 이하 내용 사용
		return "";
	}
}
