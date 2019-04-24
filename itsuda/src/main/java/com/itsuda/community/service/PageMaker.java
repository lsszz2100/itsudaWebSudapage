package com.itsuda.community.service;

import java.io.UnsupportedEncodingException; 
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;

public class PageMaker {

	private int totalCount;
	@Getter@Setter private int startPage;
	@Getter@Setter private int endPage;
	@Getter@Setter private int end;
	@Getter@Setter private boolean prev;
	@Getter@Setter private boolean next;
	
	private int displayPageNum = 10;
	
	private SearchCriteria searchCriteria;
	
	public void setCriteria(SearchCriteria searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calData();
	}
	
	private void calData() {
		
		endPage = (int) (Math.ceil(searchCriteria.getPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage  - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) searchCriteria.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = (startPage == 1 ? false : true);
		
		next = endPage * searchCriteria.getPerPageNum() >= totalCount ? false : true;
		
		end = (totalCount % displayPageNum == 0) ? (totalCount / displayPageNum) : (totalCount / displayPageNum) + 1;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", searchCriteria.getPerPageNum()).build();
		return uriComponents.toUriString();
	}

	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", searchCriteria.getPerPageNum())
				.queryParam("keyword", encoding(((SearchCriteria) searchCriteria).getKeyword())).build()
		return uriComponents.toUriString();
	}

	public String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
