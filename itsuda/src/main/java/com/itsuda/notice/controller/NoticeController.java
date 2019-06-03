package com.itsuda.notice.controller;

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
import com.itsuda.member.vo.MemberVO;
import com.itsuda.notice.service.NoticeDAOImpl;
import com.itsuda.notice.service.PageMaker;
import com.itsuda.notice.service.SearchCriteria;
import com.itsuda.notice.vo.NoticeVO;
import com.itsuda.notice.vo.NoticeFileVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/notice/*", produces="text/plain;charset=UTF-8")
public class NoticeController extends UriMap {

	@Resource
	private NoticeDAOImpl dao;
	
	PageMaker pageMaker = new PageMaker();


	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("page") String page
								  , @RequestParam("perPageNum") String perPageNum
								  , @RequestParam("keyword") String keyword
//								  ,	@RequestParam("team") String team
								  , SearchCriteria searchCriteria) throws Exception {
		log.info("start NOTICE main");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		
		searchCriteria.setKeyword(keyword);
//		searchCriteria.setTeam(team);
		List<NoticeVO> list = dao.listSearch(searchCriteria);
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
//		model.addAttribute("team",team);
		log.info(list);
		
//		List<NoticeVO> lastestPageNum = dao.lastestPageNum();
//		model.addAttribute("lastestPageNum",lastestPageNum);
		
		return URI_NOTICE_MAIN;
	}


	
	@RequestMapping(value = "NoInsert", method = RequestMethod.GET)  //뷰에서의 이름과 같게 해주어야한다.
	public String InsertPage(SearchCriteria searchCriteria) throws Exception {
		
		log.info("start NOTICE insert");
		pageMaker.setCriteria(searchCriteria);
		
		return URI_NOTICE_INSERT;
	}


	@RequestMapping(value = "NoInsertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, NoticeVO NoticeVO, NoticeFileVO file
										  , @RequestParam("title") String title
										  , @RequestParam("description") String description
										  , HttpSession session
										  , SearchCriteria searchCriteria
										  , MultipartHttpServletRequest request
										  , @RequestParam("files") MultipartFile[] files) throws Exception {
		
		log.info("start NOTICE insertAction");
		
		description = description.replace("\r\n", "<br>"); // 줄바꿈 처리
			
			
		NoticeVO.setTitle(title);
		NoticeVO.setDescription(description);
//		NoticeVO.setTeam(Integer.parseInt(team));
		
		MemberVO member = (MemberVO) session.getAttribute("userInfo");
		NoticeVO.setWriter(member.getName());
		
		dao.insertBoard(NoticeVO); 

		for(int i=0; i < files.length; i++) {
			if(files[i].getOriginalFilename() != "") {
			
		String fileName = files[i].getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileUrl= "/Users/이건우/itsuda_git/itsudaWebSudapage/itsuda/src/main/webapp/WEB-INF/Notice_uploadFiles/";
		
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

		destinationFile.getParentFile().mkdirs();
		files[i].transferTo(destinationFile);
		
           file.setSeq(NoticeVO.getSeq());
           file.setFileName(destinationFileName);
           file.setFileRealName(fileName);
           file.setFilePath(fileUrl);

           dao.fileInsert(file); //file insert
			}
		}
		
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
//		model.addAttribute("team",team);
	
//		List<NoticeVO> lastestPageNum = dao.lastestPageNum();
//		model.addAttribute("lastestPageNum",lastestPageNum);
		
		return URI_NOTICE_MAIN;
	}
	

	@RequestMapping(value = "NoDelete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam("seq") String seq
//									, @RequestParam("team") String team
									, SearchCriteria searchCriteria) throws Exception {
		
		log.info("start NOTICE delete");
		
		dao.deleteBoard(Integer.parseInt(seq));
		
		dao.fileDeleteAll(Integer.parseInt(seq));
		
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
//		model.addAttribute("team",team);
		
//		List<NoticeVO> lastestPageNum = dao.lastestPageNum();
//		model.addAttribute("lastestPageNum",lastestPageNum);
		
		return URI_NOTICE_MAIN;
		//UPDATE로 만들 것
	}


	@RequestMapping(value = "NoModify", method = RequestMethod.GET)
	public String modifyPage(Model model, NoticeVO NoticeVO
										, @RequestParam("seq") String seq
//										, @RequestParam("team") String team
										, SearchCriteria searChCriteria) throws Exception{
		
		log.info("start NOTICE modify");
		
		NoticeVO vo = dao.getBoard(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		
		List<NoticeFileVO> files = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", files);
		
		
		return URI_NOTICE_MODIFY;
	}


	@RequestMapping(value = "NoModifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, NoticeVO NoticeVO, @RequestParam("seq") String seq
																		, @RequestParam("title") String title
																		, @RequestParam("description") String description
//																		@RequestParam("team") String team
																		, SearchCriteria searchCriteria
																		, NoticeFileVO file
																		, HttpSession session
																		, MultipartHttpServletRequest request
																		, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		log.info("start NOTICE modifyAction");
		description = description.replace("\r\n", "<br>"); // 줄바꿈 처리
		
		NoticeVO.setSeq(Integer.parseInt(seq));
		NoticeVO.setTitle(title);
		NoticeVO.setDescription(description);
//		NoticeVO.setTeam(Integer.parseInt(team));
		dao.updateBoard(NoticeVO);
		
		NoticeVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		
//		List<NoticeVO> lastestPageNum = dao.lastestPageNum();
//		model.addAttribute("lastestPageNum",lastestPageNum);
		
		
		
		for(int i=0; i < files.length; i++) {
			if(files[i].getOriginalFilename() != "") {
			String fileName = files[i].getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl= "/Users/이건우/itsuda_git/itsudaWebSudapage/itsuda/src/main/webapp/WEB-INF/uploadFiles/";
			
			
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files[i].transferTo(destinationFile);
			
	           file.setSeq(NoticeVO.getSeq());
	           file.setFileName(destinationFileName);
	           file.setFileRealName(fileName);
	           file.setFilePath(fileUrl);

	           dao.fileInsert(file); //file insert
			}
			}
		
		List<NoticeFileVO> filesList = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", filesList);
		
		 
		return URI_NOTICE_DETAIL;
		
	}

	@RequestMapping(value = "NoDetail", method = RequestMethod.GET)
	public String detail(Model model, NoticeVO NoticeVO, @RequestParam("seq") String seq) throws Exception{ 
		
		log.info("start NOTICE detail");
		NoticeVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		List<NoticeFileVO> files = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", files);
		
//		List<NoticeVO> lastestPageNum = dao.lastestPageNum();
//		model.addAttribute("lastestPageNum",lastestPageNum);
		
		
		return URI_NOTICE_DETAIL;
	}
	
	//파일 다운로드
	@RequestMapping("/fileDown/{upSeq}/{seq}")
    private void fileDown(@PathVariable String upSeq, @PathVariable String seq, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
		log.info("start NOTICE fileDown");
		
        request.setCharacterEncoding("UTF-8");
        NoticeFileVO fileVO = dao.fileDownload(Integer.parseInt(upSeq), Integer.parseInt(seq));
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
		@RequestMapping("/fileDelete/{upSeq}/{seq}")
	    private String fileDelete(@PathVariable String upSeq , @PathVariable String seq, RedirectAttributes redirectAttributes) throws Exception{
		
			log.info("start NOTICE fileDelete");
			
	        dao.fileDelete(Integer.parseInt(upSeq), Integer.parseInt(seq));
	        redirectAttributes.addAttribute("seq", upSeq);
	        
	        return "redirect:/notice/NoModify";
	    }

}