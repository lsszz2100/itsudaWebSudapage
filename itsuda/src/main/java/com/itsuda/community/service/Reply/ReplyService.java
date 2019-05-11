package com.itsuda.community.service.Reply;

import java.util.List;

import javax.annotation.Resource;

import com.itsuda.community.service.Criteria;
import com.itsuda.community.vo.ReplyVO;

@Resource
public interface ReplyService {

	public List<ReplyVO> list(Integer seq) throws Exception;
	
	public void create(ReplyVO replyVO) throws Exception;
	
	public void update(ReplyVO replyVO) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<ReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception;
	
	public int countReplies(Integer seq) throws Exception;
	
////	대댓글 목록 출력
//	public void ReReplyCreate(ReplyVO replyVO) throws Exception;
	
	//부모 댓글 정보 가져오기
	public List<ReplyVO> parentReply(Integer replyNo) throws Exception;
}
