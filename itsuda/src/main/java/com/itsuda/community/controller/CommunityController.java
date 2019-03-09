package com.itsuda.community.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itsuda.common.utility.UriMap;
import com.itsuda.community.service.CommunityDAOImpl;
import com.itsuda.community.vo.CommunityVO;

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
	 * 최종 수정일 : 
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
	 * 최종 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "insertPage", method = RequestMethod.GET)
	public String InsertPage(Model model, @RequestParam("member") String member) {
		return URI_COMMUNITY_INSERT;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록 최종 
	 * 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "insertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, @RequestParam("item") String item) {
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 삭제 최종
	 * 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam("item") String item) {
		return URI_COMMUNITY_DETAIL;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정화면 이동 
	 * 최종 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "modifyPage", method = RequestMethod.GET)
	public String modifyPage(Model model, @RequestParam("item") String item) {
		return URI_COMMUNITY_MODIFY;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정 최종 
	 * 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "modifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, @RequestParam("item") String item) {
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 상세정보 확인 
	 * 최종 수정일 : 
	 * 수정 이력 :
	 * 
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, CommunityVO communityVO, @RequestParam("seq") String seq) throws Exception {
		log.info("여깁니다." + seq);
		CommunityVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		return URI_COMMUNITY_DETAIL;

	}
	
	
//	@RequestMapping(value = "detail")
//	public String detail() throws Exception {
//		
//		return URI_COMMUNITY_DETAIL;
//
//	}

}
