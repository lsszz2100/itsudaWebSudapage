package com.itsuda.common.utility;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsuda.member.service.MemberDAO;
import com.itsuda.member.vo.MemberVO;

public class MemberUtil {
	
	
	
	final static private String TEAM_WEB				= "WEB";
	final static private String TEAM_MOBILE				= "MOBILE";
	final static private String TEAM_PLAN				= "PLAN";
	final static private String TEAM_DESIGN				= "DESIGN";

	final static private String GRADE_ADMIN				= "ADMIN";
	final static private String GRADE_LEADER			= "LEADER";
	final static private String GRADE_MEMBER			= "MEMBER";
	

	
	/**
	 * 사용자 등급에 따른 선택 가능 팀 목록
	 * @param team
	 * @param grade
	 * @return
	 */
	public List<String> regTeamList(String team, String grade){
		if(grade != null) {
			
			List<String> teamList = new ArrayList<String>();
			
			switch (grade) {
			case GRADE_ADMIN  :	teamList.add(TEAM_WEB);
								teamList.add(TEAM_MOBILE);
								teamList.add(TEAM_PLAN);
								teamList.add(TEAM_DESIGN); break;
			case GRADE_LEADER : teamList.add(team); break;
			}
			return teamList;
		}
		return null;
	}
	
	/**
	 * 사용자 등급에 따른 선택 가능 권한 목록
	 * @param grade
	 * @return
	 */
	public List<String> regGradeList(String grade){
		if(grade != null) {
			
			List<String> gradeList = new ArrayList<String>();
			
			switch (grade) {
			case GRADE_ADMIN  :	gradeList.add(GRADE_ADMIN	);
								gradeList.add(GRADE_LEADER  );
								gradeList.add(GRADE_MEMBER  ); break;
			case GRADE_LEADER : gradeList.add(GRADE_LEADER  );
								gradeList.add(GRADE_MEMBER  ); break;
			}
			return gradeList;
		}
		return null;
	}
	
	/**
	 * 사용자 입력 passwd 암호화
	 * @param oldPasswd
	 * @return
	 */
	public static String getSecPasswd(String passwd) {
		StringBuffer sbuf = new StringBuffer();
	    MessageDigest mDigest;
	    
		try {
			mDigest = MessageDigest.getInstance("SHA-256");
			mDigest.update(passwd.getBytes());
		     
		    byte[] msgStr = mDigest.digest() ;
		     
		    for(int i=0; i < msgStr.length; i++){
		        byte tmpStrByte = msgStr[i];
		        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
		        sbuf.append(tmpEncTxt) ;
		    }
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sbuf.toString();
	}
	
	/**
	 * 기본 passwod 생성
	 * @return
	 */
	public static String getSecPasswd() {
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		String passwd="ItSuda"+cal.get(Calendar.YEAR)+"@!";
		StringBuffer sbuf = new StringBuffer();
		
	    MessageDigest mDigest;
		try {
			mDigest = MessageDigest.getInstance("SHA-256");
			mDigest.update(passwd.getBytes());
		     
		    byte[] msgStr = mDigest.digest() ;
		     
		    for(int i=0; i < msgStr.length; i++){
		        byte tmpStrByte = msgStr[i];
		        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
		         
		        sbuf.append(tmpEncTxt) ;
		    }
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sbuf.toString();
	}
	
	/**
	 * login 관련 쿠키 및 세션 제거
	 * @param session
	 * @param req
	 */
	public static void delLoginInfo(HttpSession session, HttpServletRequest req) {
		// 쿠키 정보 제거
    	for (Cookie item : req.getCookies()) {
    		item.setMaxAge(0);
		}
    	// 세션 정보 제거
    	session.setAttribute("userInfo", null);
	}
	// TODO : 비밀번호 복호화 모듈 필요
	
	
	public static String chkLogin(HttpSession session, HttpServletRequest req,String defaultUrl,String destUri,MemberDAO memberDao) throws Exception{
		if(session.getAttribute("userInfo") == null) {
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
						return "main";
					}
					else {
						MemberUtil.delLoginInfo(session, req);
						return "index";
					}
				}
				else {
					MemberUtil.delLoginInfo(session, req);
					return "index";
				}
				
			}
			return "main";
		}
		// 로그인 상태
		else {
			return "main";
		} 
	}
	
}
