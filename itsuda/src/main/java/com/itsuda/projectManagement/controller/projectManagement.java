package com.itsuda.projectManagement.controller;

import java.io.File;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itsuda.common.utility.UriMap;
import com.itsuda.member.vo.MemberVO;
import com.itsuda.projectManagement.service.projectManagementDAOImpl;
import com.itsuda.projectManagement.vo.iconFileVO;
import com.itsuda.projectManagement.vo.projectVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/projectManagement/*")
public class projectManagement extends UriMap {

	@Resource
	private projectManagementDAOImpl dao;

	// 프로젝트 관리 메인
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(projectVO projectVO, Model model, HttpSession session) throws Exception {

		log.info("start projectManagement");
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		projectVO.setUserName(member.getName());

		model.addAttribute("year", dao.projectYear());
		model.addAttribute("proList", dao.projectList(projectVO));
		List<projectVO> list= dao.projectList(projectVO);
		model.addAttribute("status", list.get(0).getProStatus());
		
		model.addAttribute("proInfo", dao.projectInfo(projectVO));
		model.addAttribute("iconVO", dao.iconFileLoad(projectVO));
		
		model.addAttribute("cntGo", dao.cntGO(projectVO));
		model.addAttribute("cntBug", dao.cntBUG(projectVO));
		model.addAttribute("cntEnd", dao.cntEND(projectVO));
		
		model.addAttribute("commentList", dao.commentList(projectVO));
		model.addAttribute("TeamMember", dao.getTeamMember(projectVO));
		model.addAttribute("iconVO",dao.iconFileLoad(projectVO));
		 
		return URI_PROJECTMANAGEMENT_MAIN;
	}

	// 프로젝트 등록 
		@RequestMapping(value = "addProject", method = RequestMethod.GET)
		public String AddProject(projectVO projectVO, Model model) throws Exception {

			log.info("start projectManagement-addProject");
			log.info(projectVO);
			
			dao.createProject(projectVO);
			int seq = dao.createdProjectSeq(projectVO);
			//프로젝트 진행률 테이블 생성
			dao.creatQuarter(seq);
			
			model.addAttribute("year", dao.projectYear());
			
			model.addAttribute("proList", dao.projectList(projectVO));
			List<projectVO> list= dao.projectList(projectVO);
			model.addAttribute("status", list.get(0).getProStatus());

			return URI_PROJECTMANAGEMENT_MAIN;
		}
		
		
		
	// 프로젝트 세부 메인 페이지
	@RequestMapping(value = "subMain", method = RequestMethod.GET)
	public String SubMain(Model model, projectVO projectVO, HttpSession session) throws Exception {

		log.info("start projectManagement-subMain");
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		projectVO.setUserName(member.getName());
		
		
		projectVO.setProSeq(projectVO.getSeq()+"");
		
		model.addAttribute("info",dao.subMainList(projectVO));
		model.addAttribute("iconVO",dao.iconFileLoad(projectVO));
		model.addAttribute("proQuarterCnt", dao.proQuarterCnt(projectVO));
		model.addAttribute("proQuarterList", dao.quarterList(projectVO));
		
		model.addAttribute("commentList", dao.commentList(projectVO));
		
		
		return URI_PROJECTMANAGEMENT_SUBMAIN;
	}

	// 기본 정보 수정 페이지
	@RequestMapping(value = "basicInfo", method = RequestMethod.GET)
	public String BasicInfo(Model model, projectVO projectVO) throws Exception {

		log.info("start projectManagement-basicInfo");
		
		model.addAttribute("info",dao.subMainList(projectVO));
		
		return URI_PROJECTMANAGEMENT_BASICINFO;
	}
	
	// 기본 정보 수정 
		@RequestMapping(value = "basicInfoModity", method = RequestMethod.POST)
		public String BasicInfoModify(Model model, projectVO projectVO
												 , HttpSession session
												 , @RequestParam("file") MultipartFile file
												 , iconFileVO iconFileVO) throws Exception {

			log.info("start projectManagement-basicInfoModity");
			
			dao.subMainModify(projectVO);
			dao.quarterUpdate(projectVO);
//			dao.creatQuarter(projectVO);
			
			
			if(file.getOriginalFilename() != "") {
			dao.iconDelete(projectVO);
			String fileName = file.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl= "/var/lib/tomcat8/webapps/ROOT/projectIconFile/";
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			file.transferTo(destinationFile);
			
			iconFileVO.setSeq(projectVO.getSeq());
			iconFileVO.setFileName(destinationFileName);
			iconFileVO.setFileRealName(fileName);
			iconFileVO.setFilePath(fileUrl);

	        dao.iconFileInsert(iconFileVO); 
			}
			
			model.addAttribute("info",dao.subMainList(projectVO));
			
			return "redirect:/projectManagement/subMain?seq="+ projectVO.getSeq();
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
	public String ProjectManage(Model model, projectVO projectVO) throws Exception {

		log.info("start projectManagement-projectManage");
		
		log.info(projectVO);
		model.addAttribute("proQuarterList", dao.quarterList(projectVO));
		log.info(dao.quarterList(projectVO));
		model.addAttribute("proQuarterCnt", dao.proQuarterCnt(projectVO));
		model.addAttribute("projectTerm", dao.projectTerm(projectVO));
		model.addAttribute("proSeq", projectVO.getProSeq());
		model.addAttribute("TeamMember", dao.getTeamMember(projectVO));

		return URI_PROJECTMANAGEMENT_PROJECTMANAGE;
	}
	
	// 프로젝트 관리 저장 버튼 클릭시
		@RequestMapping(value = "projectManageAction", method = RequestMethod.POST)
		public String ProjectManageAction(Model model, projectVO projectVO) throws Exception {

			log.info("start projectManagement-projectManageAction");
			
			dao.insertQuarterProgress(projectVO);
			dao.insertTeamMember(projectVO);
			
			model.addAttribute("proQuarterCnt", dao.proQuarterCnt(projectVO));
			model.addAttribute("projectTerm", dao.projectTerm(projectVO));
			model.addAttribute("proSeq", projectVO.getProSeq());

			return "redirect:/projectManagement/subMain?seq="+ projectVO.getProSeq();
		}
	

}
