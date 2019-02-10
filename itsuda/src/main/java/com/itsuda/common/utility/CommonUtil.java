package com.itsuda.common.utility;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itsuda.common.vo.CodeVO;
import com.itsuda.member.vo.MemberVO;
//import com.itsuda.library.vo.LibraryVO;

public class CommonUtil {

	
	/**
	 * 작성자 : 황준영	
	 * 최종 수정일 : 2018-07-04
	 * 설명  : 사용자 로그인 관련 쿠키(id,pw,name)가져오기
	 * 최종 수정일 :
	 * 수정 내역 :	
	 * @return id,pw
	 */
	public static Map<String, String> checkLoginCookie(Cookie[] cookies) {
		Map<String, String> map = new HashMap<String, String>();
		
		for (Cookie item : cookies) {
			switch (item.getName()) {
			// TODO : 이메일 복호화 필요
			case "cEmail"	: map.put("cEmail"	, item.getValue()); break;
			case "cPw"		: map.put("cPw"		, item.getValue()); break;
			}
		}
		
		return map;
	}	
	
	/**
	 * 작성자 : 황유미	
	 * 최종 수정일 : 2018-07-05
	 * 설명  : 단일 이미지 파일 업로드 구현
	 */
/*	public static LibraryVO FileUpload(LibraryVO vo, HttpServletRequest req, String team){
		
		String root_path = req.getSession().getServletContext().getRealPath("/");  
	    String attach_path = "resources/upload/"+team+"/";
	    
		Date dt = new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyyMMddHHmmss");
		String systime = String.valueOf(formatter.format(dt));
		vo.setLast_dt(systime);
				
		// 파일 업로드 기능 구현
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
		MultipartFile file = mhsr.getFile("image");
		String origName = new String(file.getOriginalFilename()); //한글깨짐 방지
		
		if (file != null && !"".equals(origName) && origName != null)
		{	
			String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
			
			File serverDirFile = new File(root_path + attach_path + "/" + systime.substring(0, 8)); 
			File serverFile = new File(root_path + attach_path + "/" + systime.substring(0, 8) + File.separator + systime + ext);
			if(!serverDirFile.exists()){
				// 경로 존재하지 않을 경우 폴더 생성
				serverDirFile.mkdirs();
			}
			
			try {
				file.transferTo(serverFile);
				vo.setOrg_f_name(origName);
				vo.setF_name(systime + ext);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
//			logger.info(root_path + attach_path + "/" + systime.substring(0, 8) + File.separator + systime + ext);
		}
		
		return vo;
	}*/
}
