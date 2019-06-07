package com.itsuda.issueManageBoard.service;

import lombok.Getter;    
import lombok.Setter;

public class SearchCriteria  extends Criteria{
	
	@Getter@Setter private String keyword;
	@Getter@Setter private int proSeq;
	
	

}
