package com.springlec.mango.dao;

import java.util.ArrayList;

import com.springlec.mango.dto.ReviewClickDto;
import com.springlec.mango.dto.ReviewDto;
import com.springlec.mango.dto.ReviewImageClickDto;

public interface ReviewDao {
//  음식점 하단 리뷰 클릭
	public ReviewClickDto reviewClick(int seq_review);
//  음식점 상단 리뷰 사진 클릭
	public ArrayList<ReviewImageClickDto> reviewList(int seq);
//  리뷰 정보 쿼리
	public ReviewDto reviewInfo(String id_user);
}