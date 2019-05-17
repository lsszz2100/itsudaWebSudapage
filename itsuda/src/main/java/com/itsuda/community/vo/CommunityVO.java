package com.itsuda.community.vo;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CommunityVO {
	@Getter @Setter private int 	seq;
	@Getter @Setter private String	writer;
	@Getter @Setter private String 	title;
	@Getter @Setter private int 	grade;
	@Getter @Setter private String	description;
	@Getter @Setter private int		viewCnt;
	@Getter @Setter private int		team;
	@Getter @Setter private Date	crtDt;
	@Getter @Setter private Date	lastDt;
//	재정의한 팀 시퀀스
	@Getter @Setter private int	    no;	
//	최근 게시물 갯수 - 갯수 
	@Getter @Setter private int	lastestPageNum;	
//	팀별 게시물 갯수
	@Getter @Setter private int	CountPosts;	
//  첨부파일 이름 저장
	@Getter private String[] files;
//	첨부파일 갯수
	@Getter private int fileCnt;
	
	public void setFile(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}
	
	private void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
}