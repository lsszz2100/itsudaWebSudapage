// itsuda

package com.itsuda.community.controller;


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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.itsuda.common.utility.UriMap;
import com.itsuda.community.service.CommunityDAOImpl;
import com.itsuda.community.service.LastestPageNum;
import com.itsuda.community.service.PageMaker;
import com.itsuda.community.service.SearchCriteria;
import com.itsuda.community.vo.CommunityVO;
import com.itsuda.community.vo.FileVO;
import com.itsuda.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/community/*", produces="text/plain;charset=UTF-8")
public class CommunityController extends UriMap {

	@Resource
	private CommunityDAOImpl dao;
	
	PageMaker pageMaker = new PageMaker();

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 메인화면 이동
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String Main(Model model, @RequestParam("page") String page
								  , @RequestParam("perPageNum") String perPageNum
								  , @RequestParam("keyword") String keyword
								  ,	@RequestParam("team") String team
								  , SearchCriteria searchCriteria) throws Exception {
		log.info("start community");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		searchCriteria.setKeyword(keyword);
		searchCriteria.setTeam(team);
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		LastestPageNum LPN = new LastestPageNum();
		LPN.pageNum(lastestPageNum, model);
		
		return URI_COMMUNITY_MAIN;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록화면 이동
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "insert", method = RequestMethod.GET)  //뷰에서의 이름과 같게 해주어야한다.
	public String InsertPage(Model model, SearchCriteria searchCriteria) throws Exception {
		
		pageMaker.setCriteria(searchCriteria);
		
		return URI_COMMUNITY_INSERT;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 등록 최종 
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "insertAction", method = RequestMethod.POST)
	public String InsertAction(Model model, CommunityVO communityVO, FileVO file
										  , @RequestParam("title") String title
										  , @RequestParam("description") String description
										  , @RequestParam("team") String team
										  , HttpSession session
										  , SearchCriteria searchCriteria
										  , HttpServletRequest request
										  , @RequestPart MultipartFile files) throws Exception {
		
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		communityVO.setTeam(Integer.parseInt(team));
		
		
		if(files.isEmpty()) {
			 MemberVO member = (MemberVO) session.getAttribute("userInfo");
				communityVO.setWriter(member.getName());
				
				dao.insertBoard(communityVO);  
				
				searchCriteria.setPage(1);
				searchCriteria.setKeyword("");
				pageMaker.setCriteria(searchCriteria);
				pageMaker.setTotalCount(dao.countPage(searchCriteria));
				
				model.addAttribute("list", dao.listSearch(searchCriteria));
				model.addAttribute("pageMaker",pageMaker);
				model.addAttribute("team",team);
			
				List<CommunityVO> lastestPageNum = dao.lastestPageNum();
				model.addAttribute("lastestPageNum",lastestPageNum);
				LastestPageNum LPN = new LastestPageNum();
				LPN.pageNum(lastestPageNum, model);
				
		}else {
		String fileName = files.getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileUrl= "/Users/이건우/itsuda_git/itsudaWebSudapage/itsuda/src/main/webapp/WEB-INF/uploadFiles/";
		
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

		destinationFile.getParentFile().mkdirs();
		files.transferTo(destinationFile);
		
	    MemberVO member = (MemberVO) session.getAttribute("userInfo");
		communityVO.setWriter(member.getName());
		
		dao.insertBoard(communityVO);  
		
           file.setSeq(communityVO.getSeq());
           file.setFileName(destinationFileName);
           file.setFileRealName(fileName);
           file.setFilePath(fileUrl);

           
           dao.fileInsert(file); //file insert


	
		
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("");
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
	
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		LastestPageNum LPN = new LastestPageNum();
		LPN.pageNum(lastestPageNum, model);
		}
		return URI_COMMUNITY_MAIN;
	}
	

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 삭제 최종
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam("seq") String seq
									, @RequestParam("team") String team
									, SearchCriteria searchCriteria) throws Exception {
		
		dao.deleteBoard(Integer.parseInt(seq));
		
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(dao.countPage(searchCriteria));
		
		model.addAttribute("list", dao.listSearch(searchCriteria));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("team",team);
		
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		LastestPageNum LPN = new LastestPageNum();
		LPN.pageNum(lastestPageNum, model);
		
		return URI_COMMUNITY_MAIN;
		//UPDATE로 만들 것
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정화면 이동 
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyPage(Model model, CommunityVO communityVO
										, @RequestParam("seq") String seq
										, @RequestParam("team") String team
										, SearchCriteria searChCriteria) throws Exception{
		log.info(seq);
		log.info(team);
		CommunityVO vo = dao.getBoard(Integer.parseInt(seq));
		log.info(vo);
		model.addAttribute("vo", vo);
		
		
		return URI_COMMUNITY_MODIFY;
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 수정 최종 
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "modifyAction", method = RequestMethod.POST)
	public String modifyAction(Model model, CommunityVO communityVO, @RequestParam("seq") String seq,
																		@RequestParam("title") String title,
																		@RequestParam("description") String description,
																		@RequestParam("team") String team
																		,SearchCriteria searchCriteria) throws Exception{
		communityVO.setSeq(Integer.parseInt(seq));
		communityVO.setTitle(title);
		communityVO.setDescription(description);
		log.info("11"+description);
		communityVO.setTeam(Integer.parseInt(team));
		dao.updateBoard(communityVO);
		
		CommunityVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		log.info(vo);
		
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		LastestPageNum LPN = new LastestPageNum();
		LPN.pageNum(lastestPageNum, model);
		
		 
		return URI_COMMUNITY_DETAIL;
		
	}

	/**
	 * 작성자 : 이건우 
	 * 기능명 : 커뮤니티 글 상세정보 확인 
	 * 최종 수정일 : 2019.05.17
	 * 수정 이력 : 최근 게시물 갯수 출력 추가
	 * 
	 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(Model model, CommunityVO communityVO, @RequestParam("seq") String seq) throws Exception{ 
		CommunityVO vo = dao.detailBoard(Integer.parseInt(seq));
		dao.updateViewCnt(Integer.parseInt(seq));
		model.addAttribute("vo", vo);
		FileVO files = dao.fileDetail(Integer.parseInt(seq));
		model.addAttribute("files", files);
		
		List<CommunityVO> lastestPageNum = dao.lastestPageNum();
		model.addAttribute("lastestPageNum",lastestPageNum);
		LastestPageNum LPN = new LastestPageNum();
		LPN.pageNum(lastestPageNum, model);
		
		
		return URI_COMMUNITY_DETAIL;
	}
	
	//파일 다운로드
	@RequestMapping("/fileDown/{seq}")
    private void fileDown(@PathVariable int seq, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileVO fileVO = dao.fileDetail(seq);
        
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
}