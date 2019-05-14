package com.itsuda.projectManagement.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itsuda.common.utility.UriMap;
import com.itsuda.projectManagement.service.projectManagementDAOImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/projectManagement/*")
public class projectManagement extends UriMap {

	@Resource
	private projectManagementDAOImpl dao;
	
	// 메인
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main() throws Exception {
		
		log.info("start projectManagement");


		return URI_PROJECTMANAGEMENT_MAIN;
	}
	
	// 차트
	@RequestMapping(value = "charts", method = RequestMethod.GET)
	public String Charts() throws Exception {

		log.info("start projectManagement-charts");

		return URI_PROJECTMANAGEMENT_CHARTS;
	}

	// 테이블
	@RequestMapping(value = "tables", method = RequestMethod.GET)
	public String Tables() throws Exception {

		log.info("start projectManagement-tables");

		return URI_PROJECTMANAGEMENT_TABLES;
	}

}
