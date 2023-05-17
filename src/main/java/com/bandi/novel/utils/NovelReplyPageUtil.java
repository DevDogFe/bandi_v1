package com.bandi.novel.utils;

import java.util.ArrayList;
import java.util.List;

import com.bandi.novel.dto.response.NovelReplyListDto;

import lombok.Data;

@Data
public class NovelReplyPageUtil {

	private int total;
	private int currentPage;
	private int totalPages;
	private int startPage;
	private int endPage;
	private int pagingCount;
	private List<NovelReplyListDto> content;
	
	public NovelReplyPageUtil(int total, int size, int currentPage, int pagingCount, List<NovelReplyListDto> replyList) {
		super();
		this.total = total;
		this.currentPage = currentPage;
		this.pagingCount = pagingCount;
		this.content = new ArrayList<>();
		int count = (currentPage - 1) * size;
		for (int i = count; i < count + size; i++) {
			
			if(replyList.get(i) == null) {
				break;
			}
			content.add(replyList.get(i));
		}
		
		if(total == 0) { 
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else { 
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}
			
			startPage = currentPage / pagingCount * pagingCount + 1;
			if(currentPage % pagingCount == 0) {
				startPage -= pagingCount;
			}
			
			endPage = startPage + pagingCount - 1 ;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}
	
	
	
}
