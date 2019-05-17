package com.itsuda.community.service;

import java.util.List;

import org.springframework.ui.Model;

import com.itsuda.community.vo.CommunityVO;

public class CountPosts {

	public void postNum(List<CommunityVO> countPosts, Model model) {
		
		for(CommunityVO item : countPosts) {
			switch (item.getTeam()) {
			case 1:
				model.addAttribute("DesignCountPosts", item.getCountPosts());
				break;
			case 2:
				model.addAttribute("MobileCountPosts", item.getCountPosts());
				break;
			case 3:
				model.addAttribute("PlanCountPosts", item.getCountPosts());
				break;
			case 4:
				model.addAttribute("WebCountPosts", item.getCountPosts());
				break;
			}
	}
}
}
