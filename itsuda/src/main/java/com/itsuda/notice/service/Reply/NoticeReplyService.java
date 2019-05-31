package com.itsuda.notice.service.Reply;
 
import java.util.List; 

import javax.annotation.Resource;

import com.itsuda.notice.service.Criteria;
import com.itsuda.notice.vo.NoticeReplyVO;



@Resource
public interface NoticeReplyService {

	public List<NoticeReplyVO> list(Integer seq) throws Exception;
	
	public void create(NoticeReplyVO replyVO) throws Exception;
	
	public void update(NoticeReplyVO replyVO) throws Exception;
	
	public void delete(Integer replyNo) throws Exception;
	
	public List<NoticeReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception;
	
	public int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(NoticeReplyVO replyVO) throws Exception;
	
	

}
