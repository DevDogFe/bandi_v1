package com.bandi.novel.dto.response;

import java.sql.Timestamp;

import com.bandi.novel.utils.TimestampFormat;

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
	private Timestamp beginRental;
	private Timestamp endRental;

	public String endFormat() {
		return TimestampFormat.dateFormat(endRental);
	}
}
