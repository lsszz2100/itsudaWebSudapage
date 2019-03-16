package com.itsuda.common.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoginChk {
	
	@Before("execution(* com.itsuda.common..*DAOImpl.*(..))")
	public void loger() {
		System.out.println("aop테스트");
	}
}
