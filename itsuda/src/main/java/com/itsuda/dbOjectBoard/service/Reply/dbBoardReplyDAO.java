package com.itsuda.dbOjectBoard.service.Reply;

import java.util.List;    

import javax.annotation.Resource;

import com.itsuda.dbOjectBoard.service.Criteria;
import com.itsuda.dbOjectBoard.vo.dbBoardReplyVO;



@Resource
public interface dbBoardReplyDAO {

	public  List<dbBoardReplyVO> list(Integer seq) throws Exception;
	
	public void create(dbBoardReplyVO replyVO) throws Exception;
	
	public void update(dbBoardReplyVO replyVO) throws Exception;

	public void delete(Integer replyNo) throws Exception;
	
	List<dbBoardReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(dbBoardReplyVO replyVO) throws Exception;
	
	

}
