package com.itsuda.member.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.itsuda.common.utility.MemberUtil;
import com.itsuda.member.service.MemberDAO;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Resource
	private MemberDAO dao;
	
	/**
	 * 로그인 - 기능 동작
	 * @param session
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session,HttpServletResponse res, HttpServletRequest req, Model model
			, @RequestParam(value="email")String email
			, @RequestParam(value="password")String password
			, @RequestParam(value="loginAuto")String loginAuto
			) throws Exception
	{

//		MemberVO vo = new MemberVO();
//		vo.setEmail(email);
//		vo.setPassword(MemberUtil.getSecPasswd(password));
//		System.out.println(MemberUtil.getSecPasswd(password));
//		System.out.println(email);
//		vo = dao.selectLogin(vo);
//		System.out.println(vo);
//		// 로그인 성공
//		if(vo != null) {
//			System.out.println("t1");
//			// TODO : Code 값에 따른 작업메소드 만들어야됨
//			
//			// login Success
//			model.addAttribute("login", "SUCCESS");
//			// 사용자 정보 session저장(email, name, mode, grade)
//			req.getSession().setAttribute("userInfo", vo);
//			
//			// cookie 등록
//			Cookie cAuto = new Cookie("cAuto", loginAuto);
//			// TODO : 아이디 암호화 추가
//			Cookie cEmail = new Cookie("cEmail",email);
//			Cookie cPw = new Cookie("cPw", MemberUtil.getSecPasswd(password));
//			res.addCookie(cAuto);
//			res.addCookie(cEmail);
//			res.addCookie(cPw);
//			
//			// 자동 로그인 여부에 따른 쿠키 기간 설정(30일/ 30분)
//			if(loginAuto.equals("Y")) {
//				cAuto.setMaxAge(2592000);
//				cEmail.setMaxAge(2592000);
//				cPw.setMaxAge(2592000);
//			} else {
//				cAuto.setMaxAge(1800);
//				cEmail.setMaxAge(1800);
//				cPw.setMaxAge(1800);
//			}
//			
//			return "main";
//		}
//		else {
//			// login Fail
//			model.addAttribute("login", "FAIL");
//			return "index";
//		}
		
		return "default.main";
	}
	
	/*
	 * 작성자: 홍민석
	 * 작성일 : 2019-02-06
	 * 기능: 회원관리 기능을 제공합니다.
	 * views/admin/manageMeber.jsp페이지에 출력합니다.
	 */
	@RequestMapping(value="manage" ,method=RequestMethod.GET)
	public String manageMember(Model model, @RequestParam(value="dType", required=false) String dataType, 
			@RequestParam(value="search", required=false) String search) throws Exception {
		List<MemberVO> members=new ArrayList<MemberVO>();
		
		if(dataType!=null && search!=null) {
			members=dao.searchMember(dataType,search);
		}else {
			members=dao.showMember(10);
		}
		
		model.addAttribute("members",members);
		
		return "manageMember";
	}
	
	

	/**
	 * 회원 가입 - 페이지 이동
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String Register(Model model)
	{
		model.addAttribute("registered", "FALSE");
		return "registerForm"; 
	}
	
	
	
	/**
	 * by ym 2018-07-04 회원 정보 수정 - 페이지 이동
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/modifyMember", method = RequestMethod.GET)
	public String Modify(HttpSession session, Model model)
	{
		Object info = session.getAttribute("userInfo");
		model.addAttribute("info",info);

		return "modifyMember";
	}
	
	/**
	 * by ym 2018-07-04 회원 정보 수정(비밀번호 변경만) - 기능 동작
	 * @param session @param model @param req
	 * @return
	 */
	@RequestMapping(value = "/modifyMember", method = RequestMethod.POST)
	public String Modify(HttpSession session, Model model, HttpServletRequest req
			, @RequestParam(value="oldPassword") String oldPwd
			, @RequestParam(value="newPassword") String newPwd)
			throws Exception
	{
		MemberVO sessionInfo = (MemberVO) session.getAttribute("userInfo");
		String email = sessionInfo.getEmail();
		MemberVO vo = new MemberVO();
		vo.setEmail(email.toString());
		vo.setPassword(MemberUtil.getSecPasswd(oldPwd));
		// TODO(황준영) : 기존 비밀번호 확인 사용 sql구문 변경 요청 dao.selectLogin -> dao.selectMember
		vo = dao.selectLogin(vo);
		
		// 기존 비밀번호가 맞았을 경우에 신규 비밀번호 반영
		if(vo != null) {
			vo.setPassword(MemberUtil.getSecPasswd(newPwd));
			int res = 0; //dao.updateLoginPwd(vo);
			if(res == 1) model.addAttribute("status", "SUCCESS");
			else model.addAttribute("status", "FAIL");
		}
		else{
			model.addAttribute("status", "FAIL");
		}
		Object info = session.getAttribute("userInfo");
		model.addAttribute("info",info);
		return "modifyMember";
	}
	

	/**
	 * 작성자: 홍민석 
	 * 작성일: 2019-02-08 
	 * 기능: 회원 정보를 수정합니다.
	 * 
	 */
	@RequestMapping(value = "/modifyMemInfo", method = RequestMethod.POST)
	public String ModifyMemberInfo(@RequestParam(name="selectedEmail") String email, 
			@RequestParam(name="selectedName") String name,
			@RequestParam(name="selectedTeam") String team,
			@RequestParam(name="selectedGrade") String grade, Model model)throws Exception
	{
		List<MemberVO> members=new ArrayList<MemberVO>();
		MemberVO vo= new MemberVO();
		vo.setEmail(email);
		vo.setName(name);
		vo.setTeam(team);
		vo.setGrade(grade);
		
		System.out.println(vo.getName()+" "+vo.getEmail()+" "+vo.getGrade()+" "+vo.getTeam());
		
		dao.updateMember(vo);

		members=dao.showMember(10);
		
		model.addAttribute("members",members);
		return "manageMember";
	}
	
	/**
	 * 작성자: 홍민석 
	 * 작성일: 2019-02-08 
	 * 기능: 비밀번호를 초기화합니다.
	 * 
	 */
	@RequestMapping(value = "/initPW", method = RequestMethod.POST)
	public String InitMemberPW(@RequestParam(name="selectedEmail") String email, Model model)throws Exception
	{
		List<MemberVO> members=new ArrayList<MemberVO>();
		dao.updatePwDefault(email);

		members=dao.showMember(10);
		
		model.addAttribute("members",members);
		
		return "manageMember";
	}
	
	
	/**
	 * 로그아웃 - 기능 동작
	 * @param session
	 * @return
	 */
    @RequestMapping(value="logout")
    public String logout(HttpSession session, HttpServletResponse res, HttpServletRequest req) {
    	// 로그인 쿠키 및 세션 삭제
    	MemberUtil.delLoginInfo(session, req);
    	
        return "index"; // 로그아웃 후 게시글 목록으로 이동하도록...함 -> 로그아웃 후 로그인 화면(최초 접근)으로 이동
    }
}
