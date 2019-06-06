package com.itsuda.libraryBoard.service.Reply;

import java.util.List;   

import javax.annotation.Resource;

import com.itsuda.libraryBoard.service.Criteria;
import com.itsuda.libraryBoard.vo.LiBoardReplyVO;



@Resource
public interface LiBoardReplyDAO {

	public  List<LiBoardReplyVO> list(Integer seq) throws Exception;
	
	public void create(LiBoardReplyVO replyVO) throws Exception;
	
	public void update(LiBoardReplyVO replyVO) throws Exception;

	public void delete(Integer replyNo) throws Exception;
	
	List<LiBoardReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(LiBoardReplyVO replyVO) throws Exception;
	
	

}
