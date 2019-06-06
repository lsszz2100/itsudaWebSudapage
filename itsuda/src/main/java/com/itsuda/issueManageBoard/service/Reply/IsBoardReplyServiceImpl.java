package com.itsuda.issueManageBoard.service.Reply;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itsuda.issueManageBoard.service.Criteria;
import com.itsuda.issueManageBoard.vo.IsBoardReplyVO;



@Service("IsBoardReplyService")
@Repository
public class IsBoardReplyServiceImpl implements IsBoardReplyService{
	
	private final IsBoardReplyDAO replyDAO;
	
	@Inject
	public IsBoardReplyServiceImpl(IsBoardReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<IsBoardReplyVO> list(Integer seq) throws Exception{
		return replyDAO.list(seq);
	}
	
	@Override
	public void create(IsBoardReplyVO replyVO) throws Exception{
		replyDAO.create(replyVO);
	}
	
	@Override
	public void update(IsBoardReplyVO replyVO) throws Exception{
		replyDAO.update(replyVO);
	}
	
	@Override
	public void delete(Integer replyNo) throws Exception{
		replyDAO.delete(replyNo);
	}

	@Override
	public List<IsBoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception {
		return replyDAO.listPaging(seq, criteria);
	}

	@Override
	public int countReplies(Integer seq) throws Exception {
		return replyDAO.countReplies(seq);
	}

	@Override
	public void CommentsCreate(IsBoardReplyVO replyVO) throws Exception {
		replyDAO.CommentsCreate(replyVO);
	}



	
}
