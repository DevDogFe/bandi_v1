package com.bandi.novel.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.bandi.novel.dto.response.MainRecommendDto;
import com.bandi.novel.dto.response.PreferGenreForTotalRecommendDto;

import lombok.Data;

/**
 * 종합 추천 알고리즘
 * @author 김지현
 *
 */
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
			if(dto.getFavoriteCount() > 10000) {
				dto.setFavoriteCount(5);;
			} else if(dto.getFavoriteCount() > 1000) {
				dto.setFavoriteCount(4);;
			} else if(dto.getFavoriteCount() > 100) {
				dto.setFavoriteCount(3);;
			} else if(dto.getFavoriteCount() > 10) {
				dto.setFavoriteCount(2);;
			} else {
				dto.setFavoriteCount(1);;
			}
			
			if(genreMap.get(dto.getGenreId()) != null) {
				totalScoreMap.put(dto.getId(), -(int)(genreMap.get(dto.getGenreId()) * (dto.getScore() + dto.getFavoriteCount())));
			} else {
				totalScoreMap.put(dto.getId(), -(int)(dto.getScore() + dto.getFavoriteCount()));
			}
			
		}
		
		
		List<Map.Entry<Integer, Integer>> entryList = new LinkedList<>(totalScoreMap.entrySet());
		List<MainRecommendDto> resultList = new ArrayList<>();
		int count = 0;
		entryList.sort(Map.Entry.comparingByValue());
		for (Map.Entry<Integer, Integer> entry : entryList) {
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
		
		return resultList;
	}
	
	public static <K, V> K getKey(Map<K, V> map, V value) {
		 
        for (K key : map.keySet()) {
            if (value.equals(map.get(key))) {
                return key;
            }
        }
        return null;
    }
	
	
}
