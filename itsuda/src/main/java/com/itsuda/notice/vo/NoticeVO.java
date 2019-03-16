package com.itsuda.notice.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class NoticeVO {
	@Getter @Setter private int 	no;
	@Getter @Setter private int		boardNo;
	@Getter @Setter private int		boardViewcnt;
	@Getter @Setter private String 	boardTitle;
	@Getter @Setter private String 	boardWriter;
	@Getter @Setter private String 	boardInsertd;
	@Getter @Setter private String 	boardModifyd;
	@Getter @Setter private String 	boradDelflag;
	@Getter @Setter private String 	boardContent;
}
