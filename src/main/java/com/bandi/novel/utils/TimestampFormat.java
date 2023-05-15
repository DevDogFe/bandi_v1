package com.bandi.novel.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * 타임스탬프 포맷
 * 
 * @author 김지현
 *
 */
public class TimestampFormat {

	public static String format(Timestamp timestamp) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(timestamp);
	}

}
