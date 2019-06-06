package com.itsuda.issueManageBoard.service.Reply;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.issueManageBoard.service.Criteria;
import com.itsuda.issueManageBoard.vo.IsBoardReplyVO;
 


@Repository
public class IsBoardReplyDAOImpl implements IsBoardReplyDAO{

	private static String NAMESPACE ="itsuda.issueManageBoard";
	
	@Autowired
	private SqlSession sql;
	
	// 특정 게시글의 댓글 목록
    @Override
    public List<IsBoardReplyVO> list(Integer seq) throws Exception {
        return sql.selectList(NAMESPACE + ".list", seq);
    }

    // 댓글 입력
    @Override
    public void create(IsBoardReplyVO replyVO) throws Exception {
    		sql.insert(NAMESPACE + ".create", replyVO);
    }
    
    //대댓글 입력
    public void CommentsCreate(IsBoardReplyVO replyVO) throws Exception {
 	if(replyVO.getReparent() == 0) {
		sql.insert(NAMESPACE + ".create", replyVO);
	} else {
		sql.insert(NAMESPACE + ".createSubReply", replyVO);
	}
}

    // 댓글 수정
    @Override
    public void update(IsBoardReplyVO replyVO) throws Exception {
    	sql.update(NAMESPACE + ".update", replyVO);
    }

    // 댓글 삭제
    @Override
    public void delete(Integer replyNo) throws Exception {
    	sql.update(NAMESPACE + ".delete", replyNo);
    }
    
    @Override
    public List<IsBoardReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception{
    	
    	Map<String, Object> paramMap = new HashMap<>();
    	paramMap.put("seq", seq);
    	paramMap.put("criteria", criteria);
    	
    	return sql.selectList(NAMESPACE + ".listPaging", paramMap);
    }
    
    @Override
    public int countReplies(Integer seq) throws Exception{
    	return sql.selectOne(NAMESPACE + ".countReplies", seq);
    }

  


}
