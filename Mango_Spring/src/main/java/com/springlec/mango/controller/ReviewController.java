package com.springlec.mango.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springlec.mango.dao.ReviewDao;
import com.springlec.mango.dao.SearchDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/*////////////////////////////
	 *	리뷰 클릭
	 *////////////////////////////
	
	@RequestMapping("/ReviewClick")
	public String ReviewClick(HttpServletRequest request, Model model) {
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		
		model.addAttribute("review_click", dao.reviewClick(Integer.parseInt(request.getParameter("seq_review"))));
		
		return "ReviewClick";
	}
	
	
	
	/*//////////////////////////////
	 *	음식점 페이지 상단 리뷰이미지 클릭
	 *//////////////////////////////
	
	@RequestMapping("/ReviewImageClick")
	public String ReviewImageClick(HttpServletRequest request, Model model) {
		
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		
		model.addAttribute("review_info", dao.reviewList(Integer.parseInt(request.getParameter("seq"))) );
		
		return "ReviewImageClick";
	}
	
	
	
	
}