package com.itsuda.member.service;

import com.itsuda.member.vo.MemberVO;

public interface MemberDAOImp {
	
	// 로그인
	public MemberVO selectLogin(MemberVO vo) throws Exception;

	// 회원정보 수정(수정 정보에 따라 sp 분기처리 - 비밀번호 변경,사용자 등급 변경)
	public int updateMember(MemberVO vo) throws Exception;

	// 단순 email,pw 확인(회원정보 수정 이전 email,pw 확인)
	public int selectMember(MemberVO vo) throws Exception;
	
	// 로그아웃
	public void logout();
	
	// 비밀번호 초기화
	public int updatePwDefault(String email) throws Exception;
	
}
