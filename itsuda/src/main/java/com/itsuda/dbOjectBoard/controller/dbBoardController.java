package com.itsuda.dbOjectBoard.controller;

import java.io.File;    
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itsuda.common.utility.UriMap;
import com.itsuda.dbOjectBoard.service.dbBoardDAOImpl;
import com.itsuda.dbOjectBoard.service.PageMaker;
import com.itsuda.dbOjectBoard.service.SearchCriteria;
import com.itsuda.dbOjectBoard.vo.dbBoardFileVO;
import com.itsuda.dbOjectBoard.vo.dbBoardVO;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/dbOjectBoard/*", produces="text/plain;charset=UTF-8")
public class dbBoardController extends UriMap {

	@Resource
	private dbBoardDAOImpl dao;
	
	PageMaker pageMaker = new PageMaker();


	@RequestMapping(value = "DBMain", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("page") String page
								  , @RequestParam("perPageNum") String perPageNum
								  , @RequestParam("keyword") String keyword
								  , @RequestParam("proSeq") int proSeq
								  , SearchCriteria searchCriteria) throws Exception {
		log.info("start Board main");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		
		searchCriteria.setKeyword(keyword);
		searchCriteria.setProSeq(proSeq);
		List<dbBoardVO> list = dao.listSearch(searchCriteria);
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		log.info(list);
		
		model.addAttribute("proSeq", proSeq);
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_MAIN;
	}


	
	@RequestMapping(value = "DBInsert", method = RequestMethod.GET)  //뷰에서의 이름과 같게 해주어야한다.
	public String InsertPage(Model model, SearchCriteria searchCriteria, @RequestParam("proSeq") int proSeq) throws Exception {
		
		log.info("start Board insert");
		pageMaker.setCriteria(searchCriteria);
		model.addAttribute("proSeq", proSeq);
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_INSERT;
	}


	@RequestMapping(value = "DBInsertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, dbBoardVO BoardVO, dbBoardFileVO file
										  , @RequestParam("title") String title
										  , @RequestParam("description") String description
										  , HttpSession session
										  , SearchCriteria searchCriteria
										  , MultipartHttpServletRequest request
										  , @RequestParam("files") MultipartFile[] files
										  , @RequestParam("proSeq") int proSeq) throws Exception {
		
		log.info("start Board insertAction");
		
		description = description.replace("\r\n", "<br>"); // 줄바꿈 처리
			
			
		BoardVO.setTitle(title);
		BoardVO.setDescription(description);
		BoardVO.setProSeq(proSeq);
		
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		BoardVO.setWriter(member.getName());
		
		dao.insertBoard(BoardVO); 

		for(int i=0; i < files.length; i++) {
			if(files[i].getOriginalFilename() != "") {
			
		String fileName = files[i].getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileUrl= "/var/lib/tomcat8/webapps/file/";
		
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

		destinationFile.getParentFile().mkdirs();
		files[i].transferTo(destinationFile);
		
           file.setSeq(BoardVO.getSeq());
           file.setFileName(destinationFileName);
           file.setFileRealName(fileName);
           file.setFilePath(fileUrl);
           file.setProSeq(proSeq);

           dao.fileInsert(file); //file insert
			}
		}
		
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("");
		searchCriteria.setProSeq(proSeq);
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("proSeq", proSeq);
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_MAIN;
	}
	

	@RequestMapping(value = "DBDelete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam("seq") String seq
									, SearchCriteria searchCriteria
									, @RequestParam("proSeq") int proSeq) throws Exception {
		
		log.info("start Board delete");
		searchCriteria.setProSeq(proSeq);
		
		dao.deleteBoard(Integer.parseInt(seq));
		
		dao.fileDeleteAll(Integer.parseInt(seq));
		
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("proSeq", proSeq);
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_MAIN;
	}


	@RequestMapping(value = "DBModify", method = RequestMethod.GET)
	public String modifyPage(Model model, dbBoardVO BoardVO
										, @RequestParam("seq") String seq
										, SearchCriteria searChCriteria
										, @RequestParam("proSeq") int proSeq) throws Exception{
		
		log.info("start Board modify");
		
		dbBoardVO vo = dao.getBoard(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		
		List<dbBoardFileVO> files = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", files);
		
		model.addAttribute("proSeq", proSeq);
		
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_MODIFY;
	}


	@RequestMapping(value = "DBModifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, dbBoardVO BoardVO, @RequestParam("seq") String seq
																		, @RequestParam("title") String title
																		, @RequestParam("description") String description
																		, SearchCriteria searchCriteria
																		, dbBoardFileVO file
																		, HttpSession session
																		, MultipartHttpServletRequest request
																		, @RequestParam("files") MultipartFile[] files
																		, @RequestParam("proSeq") int proSeq) throws Exception{
		
		log.info("start Board modifyAction");
		description = description.replace("\r\n", "<br>"); // 줄바꿈 처리
		
		BoardVO.setSeq(Integer.parseInt(seq));
		BoardVO.setTitle(title);
		BoardVO.setDescription(description);
		dao.updateBoard(BoardVO);
		
		dbBoardVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		
		
		for(int i=0; i < files.length; i++) {
			if(files[i].getOriginalFilename() != "") {
			String fileName = files[i].getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl= "/var/lib/tomcat8/webapps/file/";
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files[i].transferTo(destinationFile);
			
	           file.setSeq(BoardVO.getSeq());
	           file.setFileName(destinationFileName);
	           file.setFileRealName(fileName);
	           file.setFilePath(fileUrl);
	           file.setProSeq(proSeq);

	           dao.fileInsert(file); //file insert
			}
			}
		
		List<dbBoardFileVO> filesList = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", filesList);
		
		model.addAttribute("proSeq", proSeq);
		
		 
		return URI_PROJECTMANAGEMENT_DBOBJECT_DETAIL;
		
	}

	@RequestMapping(value = "DBDetail", method = RequestMethod.GET)
	public String detail(Model model, dbBoardVO BoardVO, @RequestParam("seq") String seq, @RequestParam("proSeq") int proSeq) throws Exception{ 
		
		log.info("start Board detail");
		dbBoardVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		List<dbBoardFileVO> files = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", files);
		
		model.addAttribute("proSeq", proSeq);
		
		
		
		return URI_PROJECTMANAGEMENT_DBOBJECT_DETAIL;
	}
	
	//파일 다운로드
	@RequestMapping("/fileDown/{upSeq}/{seq}")
    private void fileDown(@PathVariable String upSeq, @PathVariable String seq, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
		log.info("start Board fileDown");
		
        request.setCharacterEncoding("UTF-8");
        dbBoardFileVO fileVO = dao.fileDownload(Integer.parseInt(upSeq), Integer.parseInt(seq));
        dao.fileDownloadCnt(Integer.parseInt(upSeq), Integer.parseInt(seq));
     
        //파일 업로드된 경로 
        try{
            String filePath = fileVO.getFilePath();
            filePath += "/";
            String savePath = filePath;
            String fileName = fileVO.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileVO.getFileRealName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
	
	

		//파일 삭제
		@RequestMapping("/fileDelete/{upSeq}/{seq}/{proSeq}")
	    private String fileDelete(@PathVariable String upSeq , @PathVariable String seq
	    													 , RedirectAttributes redirectAttributes
	    													 , @PathVariable int proSeq) throws Exception{
		
			log.info("start Board fileDelete");
			
	        dao.fileDelete(Integer.parseInt(upSeq), Integer.parseInt(seq));
	        redirectAttributes.addAttribute("seq", upSeq);
	        redirectAttributes.addAttribute("proSeq", proSeq);
	        
	        return "redirect:/dbOjectBoard/DBModify";
	    }

}