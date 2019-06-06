package com.itsuda.libraryBoard.service.Reply;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itsuda.libraryBoard.service.Criteria;
import com.itsuda.libraryBoard.vo.LiBoardReplyVO;



@Service("LiBoardReplyService")
@Repository
public class LiBoardReplyServiceImpl implements LiBoardReplyService{
	
	private final LiBoardReplyDAO replyDAO;
	
	@Inject
	public LiBoardReplyServiceImpl(LiBoardReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<LiBoardReplyVO> list(Integer seq) throws Exception{
		return replyDAO.list(seq);
	}
	
	@Override
	public void create(LiBoardReplyVO replyVO) throws Exception{
		replyDAO.create(replyVO);
	}
	
	@Override
	public void update(LiBoardReplyVO replyVO) throws Exception{
		replyDAO.update(replyVO);
	}
	
	@Override
	public void delete(Integer replyNo) throws Exception{
		replyDAO.delete(replyNo);
	}

	@Override
	public List<LiBoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception {
		return replyDAO.listPaging(seq, criteria);
	}

	@Override
	public int countReplies(Integer seq) throws Exception {
		return replyDAO.countReplies(seq);
	}

	@Override
	public void CommentsCreate(LiBoardReplyVO replyVO) throws Exception {
		replyDAO.CommentsCreate(replyVO);
	}



	
}
