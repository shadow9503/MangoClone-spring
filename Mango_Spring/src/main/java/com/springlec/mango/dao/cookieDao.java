package com.springlec.mango.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.springlec.mango.dto.RestaurantsDto;
import com.springlec.mango.util.CookieBox;

public interface cookieDao {

	public ArrayList<RestaurantsDto> cookieListDao(List<String> seq_list);
	public CookieBox cookieBox (HttpServletRequest request);
}
