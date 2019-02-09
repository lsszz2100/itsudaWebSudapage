package com.itsuda.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itsuda.common.utility.MemberUtil;
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
		//log.debug("Start : selectLogin");
		// TODO(황준영) : 로그인 관련  SP작성 
		return sqlSession.selectOne(namespace+".selectLogin",vo);
	}


	/*
	 * 작성자: 홍민석
	 * 작성일: 2019-02-08
	 * 기능: 사용자 정보를 수정합니다.
	 * @see com.itsuda.member.service.MemberDAOImp#updatePwDefault(java.lang.String)
	 */
	@Override
	public int updateMember(MemberVO vo) throws Exception {
		
		return sqlSession.update(namespace+".updateMember",vo);
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

	/*
	 * 작성자: 홍민석
	 * 작성일: 2019-02-08
	 * 기능: 사용자 비밀번호를 초기화합니다.
	 * @see com.itsuda.member.service.MemberDAOImp#updatePwDefault(java.lang.String)
	 */
	@Override
	public int updatePwDefault(String email) throws Exception {
		MemberVO vo=new MemberVO();
		String initVal="123456789";
		
		vo.setPassword(MemberUtil.getSecPasswd(initVal));
		vo.setEmail(email);
		return sqlSession.update(namespace+".initPW",vo);
	}


	@Override
	public List<MemberVO> showMember(int unit) throws Exception {
		return sqlSession.selectList(namespace+".showMember");
	}
	
	/*
	 * 작성자: 홍민석
	 * 작성일: 2019-02-08
	 * 기능: 회원 검색 기능을 수행합니다.
	 * (non-Javadoc)
	 * @see com.itsuda.member.service.MemberDAOImp#searchMember(java.lang.String, java.lang.String)
	 */
	
	@Override
	public List<MemberVO> searchMember(String dataType, String search) throws Exception{
		MemberVO vo=new MemberVO();
		
		switch(dataType) {
		case "email":
			vo.setEmail(search);
			return sqlSession.selectList(namespace+".searchMemberByEmail",vo);
		case "name":
			vo.setName(search);
			System.out.println("이름으로 찾기 수행"+vo.getName());
			return sqlSession.selectList(namespace+".searchMemberByName",vo);
		case "team":
			vo.setTeam(search);
			return sqlSession.selectList(namespace+".searchMemberByTeam",vo);
		case "grade":
			search=convGradeToNum(search);
			vo.setGrade(search);
			return sqlSession.selectList(namespace+".searchMemberByGrade",vo);
		}
		
		return null;
	}
	
	/*
	 * 작성자: 홍민석
	 * 작성일: 2019-02-09
	 * 기능: 직급을 DB 숫자로 바꿔주는 함수입니다.
	 * 적절한 직급명이 없을때 -1을 반환합니다.
	 */
	private String convGradeToNum(String grade){
		switch(grade) {
		case "PM":
			return "0";
		case "PL":
			return "1";
		case "팀원":
			return "2";
		case "준회원":
			return "3";
		default:
			return "-1";
		}
	}
}