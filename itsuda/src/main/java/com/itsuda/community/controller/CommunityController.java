// itsuda

package com.itsuda.community.controller;

import java.util.List; 

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itsuda.common.utility.UriMap;
import com.itsuda.community.service.CommunityDAOImpl;
import com.itsuda.community.service.PageMaker;
import com.itsuda.community.service.SearchCriteria;
import com.itsuda.community.vo.CommunityVO;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/community/*")
public class CommunityController extends UriMap {

	@Resource
	private CommunityDAOImpl dao;
	
	PageMaker pageMaker = new PageMaker();

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 메인화면 이동
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("page") String page
								  , @RequestParam("perPageNum") String perPageNum
								  , @RequestParam("keyword") String keyword
								  ,	@RequestParam("team") String team
								  , SearchCriteria searchCriteria) throws Exception {
		log.info("start community");
//		List<CommunityVO> list = dao.getList(team);
//		model.addAttribute("list", list);
//		model.addAttribute("team", team);
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		searchCriteria.setKeyword(keyword);
		searchCriteria.setTeam(team);
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록화면 이동
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "insert", method = RequestMethod.GET)  //뷰에서의 이름과 같게 해주어야한다.
	public String InsertPage(Model model, SearchCriteria searchCriteria) throws Exception {
		
		pageMaker.setCriteria(searchCriteria);
		return URI_COMMUNITY_INSERT;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록 최종 
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "insertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, CommunityVO communityVO
										  , @RequestParam("title") String title
										  , @RequestParam("description") String description
										  , @RequestParam("team") String team
										  , HttpSession session
										  , SearchCriteria searchCriteria) throws Exception {
		
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		communityVO.setTeam(Integer.parseInt(team));
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		communityVO.setWriter(member.getName());
		
		dao.insertBoard(communityVO);
		
//		model.addAttribute("team",team);
//		List<CommunityVO> list = dao.getList(team);
//		model.addAttribute("list", list);
		
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		return URI_COMMUNITY_MAIN;
	}
	

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 삭제 최종
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam("seq") String seq
									, @RequestParam("team") String team
									, SearchCriteria searchCriteria) throws Exception {
		
		dao.deleteBoard(Integer.parseInt(seq));
		
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		return URI_COMMUNITY_MAIN;
		//UPDATE로 만들 것
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정화면 이동 
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyPage(Model model, CommunityVO communityVO
										, @RequestParam("seq") String seq
										, @RequestParam("team") String team
										, SearchCriteria searChCriteria) throws Exception{
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
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "modifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, CommunityVO communityVO, @RequestParam("seq") String seq,
																		@RequestParam("title") String title,
																		@RequestParam("description") String description,
																		@RequestParam("team") String team
																		,SearchCriteria searchCriteria) throws Exception{
		communityVO.setSeq(Integer.parseInt(seq));
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		communityVO.setTeam(Integer.parseInt(team));
		dao.updateBoard(communityVO);
		
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 상세정보 확인 
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 페이징, 통합검색 복구 완료
	 * 
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, CommunityVO communityVO, @RequestParam("seq") String seq) throws Exception{ 
		CommunityVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		return URI_COMMUNITY_DETAIL;
	}
	
	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 일주일간 최근 게시물 갯수
	 * 최종 수정일 : 2019.04.27
	 * 수정 이력 : 
	 * 
	 */
//	@RequestMapping(value = "latestPage", method = RequestMethod.GET)
//	public String delete(Model model, CommunityVO communityVO, @RequestParam("team") String team) throws Exception {
//		
//		int lastestPageNum= dao.lastestPageNum(Integer.parseInt(team));
//		model.addAttribute("lastestPageNum", lastestPageNum);
//		return URI_COMMUNITY_MAIN;
//	}
}
