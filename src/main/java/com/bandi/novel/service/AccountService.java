package com.bandi.novel.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.model.Account;
import com.bandi.novel.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	private AccountRepository accountRepository;

	/**
	 * 매출관리 리스트 불러오기
	 * 
	 * @return
	 */
	@Transactional
	public List<Account> selectAccountList() {
		List<Account> accountList = accountRepository.selectAll();
		return accountList;
	}

	/**
	 * 매출 있었던 달 불러오기
	 * 
	 * @return
	 */
	@Transactional
	public List<String> selectMonthList() {
		List<String> monthList = accountRepository.selectMonths();
		return monthList;
	}

	/**
	 * 이달 총 매출, 총 환불 금액
	 * @author 김지현
	 */
	@Transactional
	public Map<String, Integer> selectSalesAndRefundOfThisMonth() {

		String thisMonth = LocalDate.now().format(DateTimeFormatter.ofPattern("yy-MM"));
		List<Account> accountList = accountRepository.selectByMonth(thisMonth);
		Integer sales = 0;
		Integer refund = 0;
		
		for (Account account : accountList) {
			if(account.getSales() != null) {
				sales += account.getSales();
			} else if(account.getRefund() != null) {
				refund += account.getRefund();
			}
		}
		
		Map<String, Integer> returnMap = new HashMap<>();
		returnMap.put("refund", refund);
		returnMap.put("sales", sales);
		
		return returnMap;

	}

	/**
	 * 월별 매출관리 리스트 불러오기
	 * 
	 * @return
	 */
	@Transactional
	public List<Account> selectAccountListByMonth(String month) {
		List<Account> accountList = accountRepository.selectByMonth(month);
		return accountList;
	}

	/**
	 * 월 매출 총액
	 * 
	 * @param month
	 * @return
	 */
	@Transactional
	public Integer selectMonthSales(String month) {
		Integer sales = accountRepository.selectMonthSalesByMonth(month);
		return sales;
	}
}
