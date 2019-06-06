package com.itsuda.documentBoard.service.Reply;
 
import java.util.List;

import javax.annotation.Resource;

import com.itsuda.documentBoard.service.Criteria;
import com.itsuda.documentBoard.vo.BoardReplyVO;


@Resource
public interface BoardReplyService {

	public List<BoardReplyVO> list(Integer seq) throws Exception;
	
	public void create(BoardReplyVO replyVO) throws Exception;
	
	public void update(BoardReplyVO replyVO) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<BoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception;
	
	public int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(BoardReplyVO replyVO) throws Exception;
	
	

}
