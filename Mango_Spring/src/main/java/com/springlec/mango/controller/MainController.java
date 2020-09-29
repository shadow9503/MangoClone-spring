package com.springlec.mango.controller;
/*TODO: 
 * 	메인페이지 음식점 사진들 크기 비율이 맞지않게늘어나고 줄어듬.
 *  메인페이지 음식점 사진들 Sql로 리스트 불러오는것이아닌 각자 수작업으로 넣은것.
 *  음식점 페이지 리뷰리스트 Ajax이용하여 더보기 구현할것.
 *  검색페이지 식당 이름으로 검색이안됨.
 * */


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springlec.mango.dao.SearchDao;
import com.springlec.mango.dao.loginDao;
import com.springlec.mango.dto.MemberDto;

@Controller
public class MainController {
	
	// 로그인 세션
	HttpSession session;
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/*////////////////////////////
	 *	메인
	 *////////////////////////////
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/MangoMain";
	}

	@RequestMapping("/MangoMain")
	public String main(Model model) {
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		model.addAttribute("rating_list", dao.ratingList());
		
		return "/MangoMain";
	}
	
	
	/*////////////////////////////
	 *	로그인 
	 *////////////////////////////
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, Model model) {
//		System.out.println("/login");
		loginDao dao = sqlSession.getMapper(loginDao.class);
		session = request.getSession();
		
		MemberDto userInfoDto = dao.signIn(request.getParameter("kakaoId"));
		if( userInfoDto != null) {
//			System.out.println("/로그인 정보 있음");
			session.setAttribute("user", userInfoDto);
			
		} else {
			
			try {
//				System.out.println("/회원 가입");
				dao.signUp(request.getParameter("kakaoId"), request.getParameter("kakaoName"), request.getParameter("kakaoImage"));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
//					System.out.println("/이미 회원이므로 로그인");
					MemberDto tempDto = dao.signIn(request.getParameter("kakaoId"));
					
					session.setAttribute("user", tempDto);
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return "redirect:/MangoMain";
	}
	
	
	
	
	/*////////////////////////////
	 *	로그아웃 
	 *////////////////////////////
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		session.invalidate(); 
		String page_name = request.getParameter("page_name");
		String seq = request.getParameter("seq");
		
		if(page_name.equals("restaurants")) {
			return "redirect:/" + page_name + "?seq=" + seq;
		}else {
			return "redirect:/MangoMain";
		}
		
		
	}
	
	
}
