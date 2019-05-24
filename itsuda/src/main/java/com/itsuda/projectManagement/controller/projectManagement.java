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
	
	// 프로젝트 관리 메인
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main() throws Exception {
		
		log.info("start projectManagement");


		return URI_PROJECTMANAGEMENT_MAIN;
	}
	
	// 프로젝트 세부 메인 페이지
	@RequestMapping(value = "subMain", method = RequestMethod.GET)
	public String SubMain() throws Exception {

		log.info("start projectManagement-subMain");

		return URI_PROJECTMANAGEMENT_SUBMAIN;
	}
	
	// 기본 정보 수정 페이지
	@RequestMapping(value = "basicInfo", method = RequestMethod.GET)
	public String BasicInfo() throws Exception {

		log.info("start projectManagement-basicInfo");

		return URI_PROJECTMANAGEMENT_BASICINFO;
	}

	// 산출 문서 페이지
	@RequestMapping(value = "document", method = RequestMethod.GET)
	public String Document() throws Exception {

		log.info("start projectManagement-document");

		return URI_PROJECTMANAGEMENT_DOCUMENT;
	}
	
	// 버전 별 소스 페이지
		@RequestMapping(value = "source", method = RequestMethod.GET)
		public String Source() throws Exception {

			log.info("start projectManagement-source");

			return URI_PROJECTMANAGEMENT_SOURCE;
		}
		
		// 라이브러리 페이지
		@RequestMapping(value = "library", method = RequestMethod.GET)
		public String Library() throws Exception {

			log.info("start projectManagement-library");

			return URI_PROJECTMANAGEMENT_LIBRARY;
		}
		
		// DB Object 페이지
		@RequestMapping(value = "dbOject", method = RequestMethod.GET)
		public String DbOject() throws Exception {

			log.info("start projectManagement-dbOject");

			return URI_PROJECTMANAGEMENT_DBOBJECT;
		}
		
		// 이슈 관리 페이지
		@RequestMapping(value = "issueManage", method = RequestMethod.GET)
		public String IssueManage() throws Exception {

			log.info("start projectManagement-issueManage");

			return URI_PROJECTMANAGEMENT_ISSUEMANAGE;
		}
		
		// 프로젝트 관리 페이지
		@RequestMapping(value = "projectManage", method = RequestMethod.GET)
		public String ProjectManage() throws Exception {

			log.info("start projectManagement-projectManage");

			return URI_PROJECTMANAGEMENT_PROJECTMANAGE;
		}
}
