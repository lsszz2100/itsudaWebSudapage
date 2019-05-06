package com.itsuda.community.service.Reply;

import java.util.List;

import com.itsuda.community.service.Criteria;
import com.itsuda.community.vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> list(Integer seq) throws Exception;
	
	void create(ReplyVO replyVO) throws Exception;
	
	void update(ReplyVO replyVO) throws Exception;
	
	void delete(Integer replyNo) throws Exception;
	
	List<ReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception;
	
	int countReplies(Integer seq) throws Exception;
}
