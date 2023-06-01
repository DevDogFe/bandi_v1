package com.bandi.novel.utils;

import java.util.ArrayList;
import java.util.List;

import com.bandi.novel.model.Faq;

import lombok.Data;

@Data
public class FaqPageUtil {

	private int total;
	private int currentPage;
	private int totalPages;
	private int startPage;
	private int endPage;
	private int pagingCount;
	private List<Faq> content;

	public FaqPageUtil(int total, int size, int currentPage, int pagingCount, List<Faq> faqList) {

		this.total = total;
		this.currentPage = currentPage;
		this.pagingCount = pagingCount;
		this.content = new ArrayList<>();
		int count = (currentPage - 1) * size;
		if (faqList.size() != 0) {
			for (int i = count; i < count + size; i++) {

				if (i == faqList.size()) {
					break;
				}
				content.add(faqList.get(i));
			}
		}
		if (total == 0) {
			totalPages = 0;
			startPage = 1;
			endPage = 1;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}

			startPage = currentPage - pagingCount + 3;
			if (startPage < 1) {
				startPage = 1;
			}

			endPage = startPage + pagingCount - 1;
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}

}
