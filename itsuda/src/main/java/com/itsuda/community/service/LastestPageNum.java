	/**
	 최근 게시물 갯수 리스트로 뷰에 뿌려줌 - 클래스로 따로 빼냄
	 */
package com.itsuda.community.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itsuda.community.vo.CommunityVO;

public class LastestPageNum  {
	
	public void pageNum(List<CommunityVO> lastestPageNum, Model model) {

	for(CommunityVO item : lastestPageNum) {
		switch (item.getTeam()) {
		case 1:
			model.addAttribute("newDesign", item.getLastestPageNum());
			break;
		case 2:
			model.addAttribute("newMobile", item.getLastestPageNum());
			break;
		case 3:
			model.addAttribute("newPlan", item.getLastestPageNum());
			break;
		case 4:
			model.addAttribute("newWeb", item.getLastestPageNum());
			break;
		}
	}
}
}
