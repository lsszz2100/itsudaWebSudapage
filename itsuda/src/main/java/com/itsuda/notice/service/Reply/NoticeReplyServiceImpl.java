package com.itsuda.notice.service.Reply;

import java.util.List; 

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itsuda.notice.service.Criteria;
import com.itsuda.notice.vo.NoticeReplyVO;



@Service("NoticeReplyService")
@Repository
public class NoticeReplyServiceImpl implements NoticeReplyService{
	
	private final NoticeReplyDAO replyDAO;
	
	@Inject
	public NoticeReplyServiceImpl(NoticeReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<NoticeReplyVO> list(Integer seq) throws Exception{
		return replyDAO.list(seq);
	}
	
	@Override
	public void create(NoticeReplyVO replyVO) throws Exception{
		replyDAO.create(replyVO);
	}
	
	@Override
	public void update(NoticeReplyVO replyVO) throws Exception{
		replyDAO.update(replyVO);
	}
	
	@Override
	public void delete(Integer replyNo) throws Exception{
		replyDAO.delete(replyNo);
	}

	@Override
	public List<NoticeReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception {
		return replyDAO.listPaging(seq, criteria);
	}

	@Override
	public int countReplies(Integer seq) throws Exception {
		return replyDAO.countReplies(seq);
	}

	@Override
	public void CommentsCreate(NoticeReplyVO replyVO) throws Exception {
		replyDAO.CommentsCreate(replyVO);
	}



	
}
