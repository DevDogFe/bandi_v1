package com.bandi.novel.utils;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;

import lombok.Data;

@Data
public class TotalRecommendUtil {

	private Map<Integer, MainRecommendDto> returnList;
	
	
	
	public static Map<Integer, MainRecommendDto> getTotalRecommendList(List<PreferGenreForTotalRecommendDto> genreList, List<MainRecommendDto> tempList){
		
		Map<Integer, Integer> genreMap = genreList.stream().collect(Collectors.toMap(PreferGenreForTotalRecommendDto::getGenreId, PreferGenreForTotalRecommendDto::getGenreCount));
		System.out.println(genreMap.get(1)); 
		System.out.println(genreMap.get(5)); 
		
		
		
		return null;
	}
	
	
	
	
}
