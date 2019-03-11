package com.itsuda.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//TODO: 필요에 따라 로그인 성공시 받는 정보 추가
@ToString
public class MemberVO {
	
//	@Getter @Setter private String chkEmail;
//	@Getter @Setter private String chkPassword; 
//	@Getter @Setter private String chkName; 
	@Getter @Setter private String email;
	@Getter @Setter private String password;
	@Getter @Setter private String name;
	@Getter @Setter private String grade;
	@Getter @Setter private String team;
	@Getter @Setter private String userAgent;
	@Getter @Setter private String errorStr;
}
