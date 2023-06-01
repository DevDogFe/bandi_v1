package com.bandi.novel.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bandi.novel.model.Account;

@Mapper
public interface AccountRepository {

	// 모든 매출
	List<Account> selectAll();
	// 모든 월 조회
	List<String> selectMonths();
	// 월별 매출 조회
	List<Account> selectByMonth(String month);
	// 월별 매출 총합
	Integer selectMonthSalesByMonth(String month);
	// 매출 생성
	int insertSalesHistory(Account account);
	// 환불 생성
	int insertRefundHistory(Account account);
	
	

}
