package com.itsuda.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class MemberDAO implements MemberDAOImp{
	
	//private static final Logger logger = LoggerFactory.getLogger(LibraryDAOImpl.class);
    
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="itsuda.member";
	
	
	/**
	 * 작성일 : 2018.12.07
	 * 작성자 : 황준영
	 * 기능	: 로그인
	 * 수정내역 : 
	 * 
	 * 2018.12.07		황준영	최초작성
	 * 
	 * @param MemberVO
	 * @return MemberVO
	 */
	@Override
	public MemberVO selectLogin(MemberVO vo) throws Exception {
		log.debug("Start : selectLogin");
		// TODO(황준영) : 로그인 관련  SP작성 
		return sqlSession.selectOne(namespace+".selectLogin",vo);
	}


	@Override
	public int updateMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int selectMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void logout() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public int updatePwDefault(String email) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

	
}