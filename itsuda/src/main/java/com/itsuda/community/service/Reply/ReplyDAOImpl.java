package com.itsuda.community.service.Reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.community.service.Criteria;
import com.itsuda.community.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	private static String NAMESPACE ="itsuda.community";
	
	@Autowired
	private SqlSession sql;
	
	// 특정 게시글의 댓글 목록
    @Override
    public List<ReplyVO> list(Integer seq) throws Exception {
        return sql.selectList(NAMESPACE + ".list", seq);
    }

    // 댓글 입력
    @Override
    public void create(ReplyVO replyVO) throws Exception {
    	sql.insert(NAMESPACE + ".create", replyVO);
    }

    // 댓글 수정
    @Override
    public void update(ReplyVO replyVO) throws Exception {
    	sql.update(NAMESPACE + ".update", replyVO);
    }

    // 댓글 삭제
    @Override
    public void delete(Integer seq) throws Exception {
    	sql.delete(NAMESPACE + ".delete", seq);
    }
    
    @Override
    public List<ReplyVO> listPaging(Integer seq, Criteria criteria) throws Exception{
    	
    	Map<String, Object> paramMap = new HashMap<>();
    	paramMap.put("seq", seq);
    	paramMap.put("criteria", criteria);
    	
    	return sql.selectList(NAMESPACE + ".listPaging", paramMap);
    }
    
    @Override
    public int countReplies(Integer seq) throws Exception{
    	return sql.selectOne(NAMESPACE + ".countReplies", seq);
    }

    
////  대댓글 추가
//	@Override
//	public void ReReplyCreate(Integer replyNo) throws Exception {
//		sql.insert(NAMESPACE + ".ReReplyCreate", replyNo);
//	}
	
// 부모 댓글 정보 가져오기
    @Override
    public  List<ReplyVO> parentReply(Integer replyNo) throws Exception{
    	return sql.selectList(NAMESPACE + ".parentReply", replyNo);
    }

	@Override
	public List<ReplyVO> commentsReply(ReplyVO patentVO) throws Exception {
		return sql.selectList(NAMESPACE + ".commentsReply", patentVO);
	}

}
