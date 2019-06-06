package com.itsuda.sourceBoard.service.Reply;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itsuda.sourceBoard.service.Criteria;
import com.itsuda.sourceBoard.vo.SoBoardReplyVO;



@Service("SoBoardReplyService")
@Repository
public class SoBoardReplyServiceImpl implements SoBoardReplyService{
	
	private final SoBoardReplyDAO replyDAO;
	
	@Inject
	public SoBoardReplyServiceImpl(SoBoardReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<SoBoardReplyVO> list(Integer seq) throws Exception{
		return replyDAO.list(seq);
	}
	
	@Override
	public void create(SoBoardReplyVO replyVO) throws Exception{
		replyDAO.create(replyVO);
	}
	
	@Override
	public void update(SoBoardReplyVO replyVO) throws Exception{
		replyDAO.update(replyVO);
	}
	
	@Override
	public void delete(Integer replyNo) throws Exception{
		replyDAO.delete(replyNo);
	}

	@Override
	public List<SoBoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception {
		return replyDAO.listPaging(seq, criteria);
	}

	@Override
	public int countReplies(Integer seq) throws Exception {
		return replyDAO.countReplies(seq);
	}

	@Override
	public void CommentsCreate(SoBoardReplyVO replyVO) throws Exception {
		replyDAO.CommentsCreate(replyVO);
	}



	
}
