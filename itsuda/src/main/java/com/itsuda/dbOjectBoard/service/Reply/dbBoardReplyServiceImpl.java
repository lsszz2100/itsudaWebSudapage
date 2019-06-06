package com.itsuda.dbOjectBoard.service.Reply;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.itsuda.dbOjectBoard.service.Criteria;
import com.itsuda.dbOjectBoard.vo.dbBoardReplyVO;



@Service("dbBoardReplyService")
@Repository
public class dbBoardReplyServiceImpl implements dbBoardReplyService{
	
	private final dbBoardReplyDAO replyDAO;
	
	@Inject
	public dbBoardReplyServiceImpl(dbBoardReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<dbBoardReplyVO> list(Integer seq) throws Exception{
		return replyDAO.list(seq);
	}
	
	@Override
	public void create(dbBoardReplyVO replyVO) throws Exception{
		replyDAO.create(replyVO);
	}
	
	@Override
	public void update(dbBoardReplyVO replyVO) throws Exception{
		replyDAO.update(replyVO);
	}
	
	@Override
	public void delete(Integer replyNo) throws Exception{
		replyDAO.delete(replyNo);
	}

	@Override
	public List<dbBoardReplyVO> getRepliesPaging(Integer seq, Criteria criteria) throws Exception {
		return replyDAO.listPaging(seq, criteria);
	}

	@Override
	public int countReplies(Integer seq) throws Exception {
		return replyDAO.countReplies(seq);
	}

	@Override
	public void CommentsCreate(dbBoardReplyVO replyVO) throws Exception {
		replyDAO.CommentsCreate(replyVO);
	}



	
}
