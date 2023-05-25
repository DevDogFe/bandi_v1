package com.bandi.novel.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;

import lombok.Data;

@Data
public class TotalRecommendUtil {

	private Map<Integer, MainRecommendDto> returnList;
	
	
	
	public static List<MainRecommendDto> getTotalRecommendList(List<PreferGenreForTotalRecommendDto> genreList, List<MainRecommendDto> tempList){
		
		Map<Integer, Integer> genreMap = genreList.stream().collect(Collectors.toMap(PreferGenreForTotalRecommendDto::getGenreId, PreferGenreForTotalRecommendDto::getGenreCount));
		Map<Integer, Integer> totalScoreMap = new HashMap<>();
		
		for (MainRecommendDto dto : tempList) {
			if(dto.getScore() == null) {
				dto.setScore(1.0);
			}
			System.out.println(dto);
			totalScoreMap.put(dto.getId(), -(int)(genreMap.get(dto.getGenreId()) * dto.getScore() * dto.getFavoriteCount()));
		}
		
		
		List<Map.Entry<Integer, Integer>> entryList = new LinkedList<>(totalScoreMap.entrySet());
		List<MainRecommendDto> resultList = new ArrayList<>();
		int count = 0;
		entryList.sort(Map.Entry.comparingByValue());
		for (Map.Entry<Integer, Integer> entry : entryList) {
			System.out.println("novelId: " + entry.getKey() + "/ score: " + entry.getValue());
			for (MainRecommendDto dto : tempList) {
				if(dto.getId() == entry.getKey()) {
					resultList.add(dto);
				}
			}
			count ++;
			if(count == 5) {
				break;
			}
		}
		System.out.println(resultList);
		
		return resultList;
	}
	
	
	
	
}
