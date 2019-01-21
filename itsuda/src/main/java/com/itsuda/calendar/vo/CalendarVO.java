package com.itsuda.calendar.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class CalendarVO {

	/*
	 * Standart Full Calendar Object :https://fullcalendar.io/docs/event-object 
	 * 
	 */
	@Getter @Setter private String	id;
	@Getter @Setter private String	title;
	@Getter @Setter private String	start;
	@Getter @Setter private String	end;
	@Getter @Setter private String	writer;
	@Getter @Setter private boolean	allDay;
	@Getter @Setter private String	type;
	@Getter @Setter private String	color;
	
	/*
	@Getter @Setter private int 	seq;
	@Getter @Setter private String	author;
	@Getter @Setter private int 	rank;
	@Getter @Setter private String	url;
	
	@Getter @Setter private String	hash_link;
	@Getter @Setter private String	team;
	
	@Getter @Setter private String	description;
	

	@Getter @Setter private String	f_name;
	@Getter @Setter private String	org_f_name;
	@Getter @Setter private String	crt_dt;
	@Getter @Setter private String	last_dt;
	 */
	
}
