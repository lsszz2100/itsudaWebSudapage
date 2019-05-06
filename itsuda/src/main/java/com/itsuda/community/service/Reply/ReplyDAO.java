package com.itsuda.community.service.Reply;

import java.util.List;

import com.itsuda.community.service.Criteria;
import com.itsuda.community.vo.ReplyVO;

public interface ReplyDAO {

	public  List<ReplyVO> list(Integer seq) throws Exception;
	
	public void create(ReplyVO replyVO) throws Exception;
	
	public void update(ReplyVO replyVO) throws Exception;

	public void delete(Integer replyVO) throws Exception;
	
	List<ReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
}
