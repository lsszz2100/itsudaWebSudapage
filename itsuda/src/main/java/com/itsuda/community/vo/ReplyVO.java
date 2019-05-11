package com.itsuda.community.vo;

import java.util.Date; 

import lombok.Getter;
import lombok.Setter;

public class ReplyVO {

	@Getter@Setter private Integer replyNo;
	@Getter@Setter private Integer seq;
	@Getter@Setter private String replyText;
	@Getter@Setter private String replyWriter;
	@Getter@Setter private String regDate;
	@Getter@Setter private String updateDate;
	
	
	//대댓글 처리
	@Getter@Setter private Integer reparent;
	@Getter@Setter private Integer retoder;

}
