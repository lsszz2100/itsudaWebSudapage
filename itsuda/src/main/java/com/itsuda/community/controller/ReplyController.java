package com.itsuda.community.controller;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itsuda.common.utility.UriMap;
import com.itsuda.community.service.PageMaker;
import com.itsuda.community.service.SearchCriteria;
import com.itsuda.community.service.Reply.ReplyService;
import com.itsuda.community.vo.ReplyVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/replies")
public class ReplyController extends UriMap{
	
	private final ReplyService replyService;
	
	@Inject
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}

	
//	@PathVariable URI의 경로에서 원하는 데이터를 추출하는 용도로 사용한다.
//	@RequestBody : 전송된 JSON데이터를 객체로 변환해주는 어노테이션으로 @ModelAttribute와 유사한 역을을 하지만 JSON에서 사용한다는 점이 차이점
//	@ResponseBody : 페이지 이동이 아닌 데이터만 반환을 하겠다.
	
	
//	댓글 등록처리 
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO replyVO){
		ResponseEntity<String> entity = null;
		try {
			replyService.create(replyVO);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	대댓글 등록처리 
	@RequestMapping(value = "/insertSubReply", method = RequestMethod.POST)
	public ResponseEntity<String> comments(String pReplyNo, String pSeq, String cText, String cWriter){
		ResponseEntity<String> entity = null;
		ReplyVO vo = new ReplyVO();
		vo.setReparent(Integer.valueOf(pReplyNo));
		vo.setSeq(Integer.valueOf(pSeq));
		vo.setReplyText(cText);
		vo.setReplyWriter(cWriter);
		
		try {
			replyService.CommentsCreate(vo);
			entity = new ResponseEntity<>("CommentsSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
////	댓글 목록 
//	@RequestMapping(value = "/all/{seq}", method = RequestMethod.GET)
//	public ResponseEntity<List<ReplyVO>> list(@PathVariable("seq") Integer seq){
//		ResponseEntity<List<ReplyVO>> entity = null;
//
//		try {
//			entity = new ResponseEntity<>(replyService.list(seq), HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
	
//	댓글 수정 처리
	@RequestMapping(value = "/{replyNo}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("replyNo") Integer replyNo, @RequestBody ReplyVO replyVO){
		ResponseEntity<String> entity = null;
		try {
			replyVO.setReplyNo(replyNo);
//			replyService.modifyReply(replyVO);
			replyService.update(replyVO);
			entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 삭제 처리 
	@RequestMapping(value = "/{replyNo}", method = RequestMethod.GET)
	public ResponseEntity<String> delete(@PathVariable("replyNo") Integer replyNo){
		ResponseEntity<String> entity = null;
		try {
//			replyService.removeReply(replyNo);
			replyService.delete(replyNo);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 목록 출력 및 페이징 처리 
	@RequestMapping(value = "/{seq}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("seq") Integer seq
													 , @PathVariable("page") Integer page){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			SearchCriteria searchCriteria = new SearchCriteria();
			searchCriteria.setPage(page);
			
			int repliesCount = replyService.countReplies(seq);
			List<ReplyVO> replies = replyService.getRepliesPaging(seq, searchCriteria);
			
			PageMaker pageMaker = new PageMaker(); 		
			pageMaker.setCriteria(searchCriteria);
			pageMaker.setTotalCount(repliesCount);
			
			Map<String, Object> map = new HashMap<>();
			map.put("replies", replies);
			map.put("pageMaker", pageMaker);
			map.put("replyCount", repliesCount);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}
	
}
