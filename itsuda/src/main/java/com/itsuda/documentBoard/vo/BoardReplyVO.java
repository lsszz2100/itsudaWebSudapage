package com.itsuda.documentBoard.vo;

import lombok.Getter; 
import lombok.Setter;

public class BoardReplyVO {

	@Getter@Setter private Integer replyNo;
	@Getter@Setter private Integer seq;
	@Getter@Setter private String replyText;
	@Getter@Setter private String replyWriter;
	@Getter@Setter private String regDate;
	@Getter@Setter private String updateDate;
	
	
	//대댓글 처리
	@Getter@Setter private Integer reparent;
	@Getter@Setter private Integer reorder;
	
	//댓글 data
	@Getter@Setter private Integer PreplyNo;
	@Getter@Setter private Integer Pseq;
	@Getter@Setter private String PreplyText;
	@Getter@Setter private String PreplyWriter;
	@Getter@Setter private String PregDate;
	@Getter@Setter private String PupdateDate;
	@Getter@Setter private String Pdelflag;
	
	//	댓글 data
	@Getter@Setter private Integer CreplyNo;
	@Getter@Setter private Integer Cseq;
	@Getter@Setter private String CreplyText;
	@Getter@Setter private String CreplyWriter;
	@Getter@Setter private String CregDate;
	@Getter@Setter private String CupdateDate;
	@Getter@Setter private String Cdelflag;
	
	//댓글 순서 RANKING
	@Getter@Setter private String rank;
	
	

}
