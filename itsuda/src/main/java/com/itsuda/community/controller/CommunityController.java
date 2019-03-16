// 1. 컨트롤러 2, 맵퍼 SQL문 , DAO 작성 완료, DOAIMPL 만들다 말았음, 

package com.itsuda.community.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itsuda.common.utility.UriMap;
import com.itsuda.community.service.CommunityDAOImpl;
import com.itsuda.community.vo.CommunityVO;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community/*")
public class CommunityController extends UriMap {

	@Resource
	private CommunityDAOImpl dao;
	

	
	// 커뮤니티 페이지의 출력 단위
	private int pageSize = 12;

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 메인화면 이동
	 * 최종 수정일 : 2019.03.12
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("team") String team) {
		log.info("start community");
		List<CommunityVO> list = dao.getList(team);

		for (CommunityVO communityVO : list) {
			log.info(communityVO);
		}
		model.addAttribute("list", list);
		model.addAttribute("team", team);

		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록화면 이동
	 * 최종 수정일 : 2019.03.12
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "insert", method = RequestMethod.GET)  //뷰에서의 이름과 같게 해주어야한다.
	public String InsertPage() {
		return URI_COMMUNITY_INSERT;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록 최종 
	 * 수정일 : 2019.03.12
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "insertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, CommunityVO communityVO, 
			@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("team") String team,
			HttpSession session)
	{
		
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		communityVO.setTeam(Integer.parseInt(team));
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		communityVO.setWriter(member.getName());
		
		dao.insertBoard(communityVO);
		
		model.addAttribute("team",team);
		List<CommunityVO> list = dao.getList(team);
		model.addAttribute("list", list);
		
		return URI_COMMUNITY_MAIN;
	}
	

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 삭제 최종
	 * 수정일 : 2019.03.12
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam("seq") String seq, @RequestParam("team") String team) {
		
		dao.deleteBoard(Integer.parseInt(seq));
		model.addAttribute("seq", seq);
		List<CommunityVO> list = dao.getList(team);
		model.addAttribute("list", list);
		
		
		return URI_COMMUNITY_MAIN;
		//UPDATE로 만들 것
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정화면 이동 
	 * 최종 수정일 : 2019.03.14
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyPage(Model model, CommunityVO communityVO, @RequestParam("seq") String seq, @RequestParam("team") String team) {
		log.info(seq);
		log.info(team);
		CommunityVO vo = dao.getBoard(Integer.parseInt(seq));
		log.info(vo);
		model.addAttribute("vo", vo);
		
		return URI_COMMUNITY_MODIFY;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정 최종 
	 * 수정일 : 2019.03.14
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "modifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, CommunityVO communityVO, @RequestParam("seq") String seq,
																		@RequestParam("title") String title,
																		@RequestParam("description") String description,
																		@RequestParam("team") String team) {
		communityVO.setSeq(Integer.parseInt(seq));
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		communityVO.setTeam(Integer.parseInt(team));
		dao.updateBoard(communityVO);

		
		model.addAttribute("team",team);
		List<CommunityVO> list = dao.getList(team);
		model.addAttribute("list", list);
		
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 상세정보 확인 
	 * 최종 수정일 : 2019.03.14
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, CommunityVO communityVO, @RequestParam("seq") String seq) throws Exception {
		CommunityVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		log.info("여깁니다." + vo);
		model.addAttribute("vo", vo);
		return URI_COMMUNITY_DETAIL;

	}
	
	

}
