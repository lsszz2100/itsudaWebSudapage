package com.itsuda.community.vo;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CommunityVO {
	@Getter @Setter private int 	seq;
	@Getter @Setter private int 	no;
	@Getter @Setter private int 	teamSeq;
	@Getter @Setter private String 	title;
	@Getter @Setter private String	writer;
	@Getter @Setter private Date	crtDt;
	@Getter @Setter private int		viewCnt;
	@Getter @Setter private String	description;
	
}
