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
	
	@Getter@Setter private int  quarter;
	
	@Getter@Setter private String  proSeq;
	
	@Getter@Setter private String  quarter1;
	@Getter@Setter private String  quarter2;
	@Getter@Setter private String  quarter3;
	@Getter@Setter private String  quarter4;
	@Getter@Setter private String  quarter5;
	@Getter@Setter private String  quarter6;
	@Getter@Setter private String  quarter7;
	@Getter@Setter private String  quarter8;
	@Getter@Setter private String  quarter9;
	@Getter@Setter private String  quarter10;
	@Getter@Setter private String  quarter11;
	@Getter@Setter private String  quarter12;
	
	
}