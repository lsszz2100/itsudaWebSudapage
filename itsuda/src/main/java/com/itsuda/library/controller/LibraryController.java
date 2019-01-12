package com.itsuda.library.controller;

import java.util.List;
import java.util.Map;

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

import com.itsuda.common.utility.CommonUtil;
import com.itsuda.member.vo.MemberVO;
import com.itsuda.library.service.LibraryDAOImpl;
import com.itsuda.library.vo.LibraryVO;

/**
 * 
 * 작성자 : 황유미
 * 작성일 : 2018-07-06
 * 최종수정일 : 2018-07-06
 * 기능 : 팀별 라이브러리 페이지 이동 및 등록, 조회, 편집, 삭제
 * 상세기능
 * 	1. 페이지 이동 
 * 		1-1. 팀별 라이브러리 페이지
 * 		1-2. 등록 페이지
 *		1-3. 상세 페이지
 *		1-4. 편집 페이지
 *	2. 등록
 *	3. 조회
 *		3-1. 데이터 출력 기준 단위는 12건으로 선언
 *		3-2. 스크롤 시 ajax를 통해 기준 단위 건수 대로 추가
 *	4. 편집
 *		4-1. 편집 페이지 이동 순서
 *			1-1 상단의 아이콘 클릭 -> 1-2 수정하기 클릭 -> 1-3
 *		4-2. 편집한 내용 적용 시 last_dt 갱신
 *	5. 삭제
 *		5-1. flag값을 F로 변경하여 화면에서 보여지지 않도록 갱신
 *
 */
@Controller
@RequestMapping("/library/*")
public class LibraryController {
	
	@Resource
	private LibraryDAOImpl dao;
	
	// 라이브러리 데이터의 출력 단위
	private int amount = 12;
	
	/**
	 *	1. 페이지 이동 
	 *		1-1 팀별 라이브러리 페이지 이동
	 *	3. 조회
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("mode") String mode)
	{	
		List<LibraryVO> list = null;
		try {
			list = dao.selectLink(amount,mode);
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("[ShowLinks]" + e.getMessage());
		}
		model.addAttribute("list",list);
		model.addAttribute("team",mode);
		
		return "showLinks";  // view 페이지
	}
	
	/**
	 *	3. 조회
	 *		3-2. 스크롤 시 ajax를 통해 기준 단위 건수 대로 추가
	 */
	@RequestMapping(value = "selectLinkAjax", method = RequestMethod.POST)
	public @ResponseBody List<LibraryVO> SelectLinkAjax(@RequestBody Map<String, String> data)
	{	
		List<LibraryVO> list = null;
		try {
			list = dao.selectLinkAjax(Integer.valueOf(data.get("seq")) + amount, data.get("team"), amount);
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("[selectLinkAjax]" + e.getMessage());
		}
		
		return list;
	}
	
	/**
	 * 	1. 페이지 이동 
	 * 		1-2. 등록 페이지
	 */
	@RequestMapping(value = "/addLink", method = RequestMethod.GET)
	public String AddLink(HttpSession session, Model model)
	{
		MemberVO sessionInfo = (MemberVO) session.getAttribute("userInfo");
		String name = sessionInfo.getName();
		model.addAttribute("author", name);
		
		return "addLink";  // view 페이지
	}
	
	/**
	 *	2. 등록
	 */
	@RequestMapping(value = "/addLink", method = RequestMethod.POST)
	public String AddLink(HttpServletRequest req, Model model, HttpSession session
			,@RequestParam(value="team") String team
			,@RequestParam(value="hashlink") String hashlink
			,@RequestParam(value="description") String description
			,@RequestParam(value="rank") String rank
			,@RequestParam(value="title") String title
			,@RequestParam(value="url") String url) 
	{			
		// 작성자는 세션에 담긴 계정의 등록된 이름으로 반영
		MemberVO sessionInfo = (MemberVO) session.getAttribute("userInfo");
		String author = sessionInfo.getName();
		
		LibraryVO vo = new LibraryVO();
		vo = CommonUtil.FileUpload(vo, req, team);
			
		vo.setHash_link(hashlink);
		vo.setDescription(description);
		vo.setRank(Integer.valueOf(rank));
		vo.setTitle(title);
		vo.setUrl(url);
		vo.setAuthor(author);
		vo.setCrt_dt(vo.getLast_dt());
		System.out.println("addLink:"+vo.toString());
		
		int res = 0;
		res = dao.insertLink(vo, team); // db 반영
		System.out.println("res:"+res);
	
		if(res > 0) model.addAttribute("status","SUCCESS");
		else model.addAttribute("status","FAIL");
		
		return "redirect:/library/addLink"; // view 페이지
	}
	
	/**
	 * 	1. 페이지 이동 
	 *		1-3. 상세 페이지
	 */
	@RequestMapping(value = "/detailLink")
	public String detailLink(HttpServletRequest req, Model model
			,@RequestParam(value="seq") String seq
			,@RequestParam(value="team") String team){	
		
		LibraryVO list = null;
		try {
			list = dao.editLink(Integer.valueOf(seq),team); // db 반영
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("[detailLink]" + e.getMessage());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("team", team);
		
		return "detailLink";  // view 페이지
	}
	

	/**
	 * 	1. 페이지 이동
	 *		1-4. 편집 페이지
	 */
	@RequestMapping(value = "/editLink")
	public String EditLink(HttpServletRequest req, Model model
			,@RequestParam(value="seq") String seq
			,@RequestParam(value="team") String team) 
	throws NumberFormatException, Exception{	
		System.out.println("seq:" + seq + " ,team:" + team);
		
		LibraryVO list = null;
		try {
			list = dao.editLink(Integer.valueOf(seq),team); // db 반영
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("[editLink]" + e.getMessage());
		}
		
		String status = (req.getParameter("status") != null) ? req.getParameter("status") : "";
		model.addAttribute("list", list);
		model.addAttribute("rank", String.valueOf(list.getRank()));
		model.addAttribute("team", team);
		model.addAttribute("status", status);
		
		return "editLink";  // view 페이지
	}

	/**
	 *	4. 편집
	 */
	@RequestMapping(value = "/updateLink", method = RequestMethod.POST)
	public String EditLinkApply(HttpServletRequest req, HttpSession session, Model model
			,@RequestParam(value="seq") String seq
			,@RequestParam(value="team") String team
			,@RequestParam(value="title") String title
			,@RequestParam(value="url") String url
			,@RequestParam(value="description") String description
			,@RequestParam(value="hash_link") String hash_link
			,@RequestParam(value="rank") String rank){
		
		// 작성자는 세션에 담긴 계정의 등록된 이름으로 반영
		MemberVO sessionInfo = (MemberVO) session.getAttribute("userInfo");
		String author = sessionInfo.getName();
		
		LibraryVO vo = new LibraryVO();
		vo = CommonUtil.FileUpload(vo, req, team);
		
		vo.setSeq(Integer.valueOf(seq));
		vo.setAuthor(author);
		vo.setHash_link(hash_link);
		vo.setDescription(description);
		vo.setRank(Integer.valueOf(rank));
		vo.setTitle(title);
		vo.setUrl(url);
		
		int res = 0;
		try {
			res = dao.updateLink(vo, team); // db 반영
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(res > 0) model.addAttribute("status", "SUCCESS");
		else model.addAttribute("status", "FAIL");
		
		model.addAttribute("team", team);
		model.addAttribute("seq", seq);
		
		return "redirect:/library/editLink";  // view 페이지
	}
	
	/**
	 *	5. 삭제
	 */		
	@RequestMapping(value = "/deleteLink", method = RequestMethod.POST)
	public String DeleteLink(HttpServletRequest req, Model model
			,@RequestParam(value="seq") String seq
			,@RequestParam(value="team") String team){	

		try {
			dao.deleteLink(Integer.valueOf(seq),team); // db 반영
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("mode", team);
		
		return "redirect:/library/main";  // view 페이지
	}	
}
