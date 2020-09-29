package com.springlec.mango.dao;

import java.util.ArrayList;


import com.springlec.mango.dto.RestaurantsDto;
import com.springlec.mango.dto.ReviewDto;


public interface SearchDao {
	
//	 인기 맛집 리스트
	 public ArrayList<RestaurantsDto> toplistDao(String category, String address, int page);
	 
	 public int tableCount(String category, String address);
	 
//	 음식점 검색 쿼리
	 public RestaurantsDto searchRestaurant(String seq);
	 
//	 음식점의 리뷰 리스트 쿼리
	 public ArrayList<ReviewDto> reviewList(String seq, int index_start);
	 
//	 주변 음식점 검색 쿼리
	 public ArrayList<RestaurantsDto> nearbyRestaurant(String seq,String addr);
	 
//	 음식점 검색 쿼리
	 public ArrayList<RestaurantsDto> search(String search, int table_num);
	 
	 public int r_tableCount(String search);
	 
// 	 메인페이지 평점순 음식점 리스트 검색 쿼리
	 public ArrayList<RestaurantsDto> ratingList();
	 
}
