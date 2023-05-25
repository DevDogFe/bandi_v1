package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserPurchaseRentalRecord {

	private Integer id; // novel_section의 Id임
	private Integer purchaseSectionId;
	private Integer rentalSectionId;
	@DateTimeFormat(pattern = "yyyy-MM")
	private Timestamp beginRental;
	@DateTimeFormat(pattern = "yyyy-MM")
	private Timestamp endRental;

}
