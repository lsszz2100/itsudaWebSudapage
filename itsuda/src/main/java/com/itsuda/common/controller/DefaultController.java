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
public class DefaultController extends UriMap {
	
	@Resource
	private MemberDAO memberDao;
	
	
	/**
	 * 최초 접근 page
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"*","/","/index","/main"}, method = {RequestMethod.GET,RequestMethod.POST})
	public String root(Model model,HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		// TODO : 사용자 세션 확인 부분 인터럽트 등록(
		log.info("start_pjt");
		if(session.getAttribute("userInfo") == null) {
			return URI_DEFAULT_INDEX;
		}
		else {
			return URI_DEFAULT_MAIN;
		}
		
		
		
		
		// 비 로그인 상태
		/*if(session.getAttribute("userInfo") == null) {
			// 사용자 쿠키 확인
			Map<String, String> map = new HashMap<String, String>();
			if(req.getCookies() != null) {
				map = CommonUtil.checkLoginCookie(req.getCookies());
				if(map.get("loginAuto") != null){
					if(map.get("loginAuto").equals("Y")) {
						MemberVO vo = new MemberVO();
						vo.setEmail(map.get("cEmail"));
						vo.setPassword(map.get("cPw"));
						vo = memberDao.selectLogin(vo);
						session.setAttribute("userInfo",vo);
						return URI_DEFAULT_MAIN;
					}
					else {
						MemberUtil.delLoginInfo(session, req);
						return URI_DEFAULT_INDEX;
					}
				}
				else {
					MemberUtil.delLoginInfo(session, req);
					return URI_DEFAULT_INDEX;
				}
				
			}
			return URI_DEFAULT_MAIN;
		}
		// 로그인 상태
		else {
			return URI_DEFAULT_MAIN;
		}*/
		
	}
}
