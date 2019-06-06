package com.itsuda.issueManageBoard.service.Reply;

import java.util.List;   

import javax.annotation.Resource;

import com.itsuda.issueManageBoard.service.Criteria;
import com.itsuda.issueManageBoard.vo.IsBoardReplyVO;



@Resource
public interface IsBoardReplyDAO {

	public  List<IsBoardReplyVO> list(Integer seq) throws Exception;
	
	public void create(IsBoardReplyVO replyVO) throws Exception;
	
	public void update(IsBoardReplyVO replyVO) throws Exception;

	public void delete(Integer replyNo) throws Exception;
	
	List<IsBoardReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
	
	public void CommentsCreate(IsBoardReplyVO replyVO) throws Exception;
	
	

}
