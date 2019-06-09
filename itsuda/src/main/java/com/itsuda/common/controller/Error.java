package com.itsuda.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itsuda.member.service.MemberDAO;
import com.itsuda.common.utility.CommonUtil;
import com.itsuda.common.utility.MemberUtil;
import com.itsuda.common.utility.UriMap;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j
@Controller
@RequestMapping("/error/*")
public class Error extends UriMap {
	
	
	
	
	
	@RequestMapping(value = {"main"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String error(Model model,HttpSession session, HttpServletRequest req, HttpServletResponse res)
	{
		
		return "error.main";
	}
}
