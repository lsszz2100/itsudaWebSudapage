package com.itsuda.sourceBoard.service.Reply;
 
import java.util.List;  

import javax.annotation.Resource;

import com.itsuda.sourceBoard.service.Criteria;
import com.itsuda.sourceBoard.vo.SoBoardReplyVO;


@Resource
public interface SoBoardReplyService {

	public List<SoBoardReplyVO> list(Integer seq) throws Exception;
	
	public void create(SoBoardReplyVO replyVO) throws Exception;
	
	public void update(SoBoardReplyVO replyVO) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<SoBoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception;
	
	public int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(SoBoardReplyVO replyVO) throws Exception;
	
	

}
