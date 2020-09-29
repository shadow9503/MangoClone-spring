package com.springlec.mango.dao;

import com.springlec.mango.dto.MemberDto;

public interface loginDao {

	public void signUp(String kakaoId, String kakaoName, String kakaoImage);
	
	public MemberDto signIn(String kakaoId);
}
