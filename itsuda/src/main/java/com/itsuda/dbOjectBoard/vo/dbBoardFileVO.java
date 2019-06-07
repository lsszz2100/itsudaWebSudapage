package com.itsuda.dbOjectBoard.vo;

import java.sql.Date;     
import lombok.Getter;
import lombok.Setter;

public class dbBoardFileVO {

	@Getter @Setter private int seq;
	@Getter @Setter private int upSeq;
	@Getter @Setter private String fileName;
	@Getter @Setter private String fileRealName;
	@Getter @Setter private String filePath;
	@Getter @Setter private int downCnt;
	@Getter @Setter private Date crtDt;
	@Getter @Setter private Date lastDt;
	@Getter @Setter private  String delFlag;
	
	@Getter @Setter private  int proSeq;
	
}
