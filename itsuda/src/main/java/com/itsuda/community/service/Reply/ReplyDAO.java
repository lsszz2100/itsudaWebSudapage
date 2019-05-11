package com.itsuda.community.service.Reply;

import java.util.List;

import javax.annotation.Resource;

import com.itsuda.community.service.Criteria;
import com.itsuda.community.vo.ReplyVO;

@Resource
public interface ReplyDAO {

	public  List<ReplyVO> list(Integer seq) throws Exception;
	
	public void create(ReplyVO replyVO) throws Exception;
	
	public void update(ReplyVO replyVO) throws Exception;

	public void delete(Integer replyVO) throws Exception;
	
	List<ReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
	
////	대댓글 추가
//	public  void ReReplyCreate(Integer replyNo) throws Exception;
	
	//부모 댓글 정보 가져오기
	public  List<ReplyVO> parentReply(Integer replyNo) throws Exception;
	
	//부모 데이터를 이용하여 대댓글 만들기
	public  List<ReplyVO> commentsReply(ReplyVO patentVO) throws Exception;
}
