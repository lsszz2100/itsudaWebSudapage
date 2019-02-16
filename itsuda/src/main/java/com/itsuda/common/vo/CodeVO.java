package com.itsuda.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * 작성자	: 황준영
 * 작성일 : 2019-02-11
 * 기능	: 공통 코드 VO 
 */
@ToString
public class CodeVO {
	@Getter @Setter private String	category;
	@Getter @Setter private int 	id;
	@Getter @Setter private String	korShortDesc;
	@Getter @Setter private String	korLongDesc;
	@Getter @Setter private String	engShortDesc;
	@Getter @Setter private String	engLongDesc;
	
}
