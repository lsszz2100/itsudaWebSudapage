package com.itsuda.projectManagement.vo;

import java.sql.Date; 

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class projectVO {

	@Getter@Setter private int seq;
	@Getter@Setter private int proYear;
	@Getter@Setter private String proTitle;
	@Getter@Setter private String proStatus;
	@Getter@Setter private Date registDate;
	@Getter@Setter private String registrant;
	
	@Getter@Setter private int pcount;
	@Getter@Setter private int ecount;
	
	@Getter@Setter private String description;
	@Getter@Setter private String startDt;
	@Getter@Setter private String endDt;
	
}