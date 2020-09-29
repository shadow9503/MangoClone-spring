package com.springlec.mango.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.mango.dao.SearchDao;
import com.springlec.mango.dao.ReviewDao;
import com.springlec.mango.dao.cookieDao;
import com.springlec.mango.dto.RestaurantsDto;
import com.springlec.mango.util.CookieBox;


@Controller
public class SearchController {

	// 쿠키 세션
	HttpSession cookieSession;
	
	@Autowired
	private SqlSession sqlSession;
	
	/*////////////////////////////
	 *	인기탑 리스트
	 *////////////////////////////
	
	@RequestMapping("top_lists")
	public String topList(HttpServletRequest request, Model model) {
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		
		int page = 0;
		if(request.getParameter("page") == null) {
			page = 1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		model.addAttribute("list", dao.toplistDao(request.getParameter("rest_category"), request.getParameter("rest_addr"), ((page-1)*10)));
		int restaurantnum = dao.tableCount(request.getParameter("rest_category"), request.getParameter("rest_addr"));
		model.addAttribute("restaurantnum", restaurantnum);
		model.addAttribute("pagenum", (int)Math.ceil(restaurantnum/10));
		model.addAttribute("rest_category", request.getParameter("rest_category"));			
		model.addAttribute("rest_addr", request.getParameter("rest_addr"));			
		model.addAttribute("title", request.getParameter("title"));
		
		return "top_lists";
	}
	
	
	
	/*////////////////////////////
	 *	인기탑 리스트 메인
	 *////////////////////////////
	
	@RequestMapping("top_listsMain")
	public String topListMain() {
		
		return "/top_listsMain";
	}
	

	
	
	/*////////////////////////////
	 *	음식점
	 *////////////////////////////
	
	@RequestMapping("/restaurants")
	public String restaurants(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		model.addAttribute("review",dao.reviewList(request.getParameter("seq"),1));
		model.addAttribute("restaurant_info",dao.searchRestaurant(request.getParameter("seq")));
		
		ReviewDao reviewdao = sqlSession.getMapper(ReviewDao.class);
		model.addAttribute("review_info", reviewdao.reviewList(Integer.parseInt(request.getParameter("seq"))));
		
		String address[] = dao.searchRestaurant(request.getParameter("seq")).getAddr().split("길");
//		System.out.println(address[0]);
//		System.out.println(request.getParameter("seq"));
		model.addAttribute("nearby",dao.nearbyRestaurant((request.getParameter("seq")), address[0]));
		
				// 쿠키 리스트 최근 음식점 seq list 
				List<String> seq_arr = null;
				
				// 쿠키 리스트 담는 arrList
				ArrayList<RestaurantsDto> cookieList = null;
				
				// 쿠키 리스트 세션
				cookieSession = request.getSession();
				
				
				
				/*////////////////////////////
				 *	쿠키 저장
				 *////////////////////////////
				
				try {
					Cookie cookie_seq = CookieBox.createCookie(
							"recent_seq" + request.getParameter("seq"), // string
							request.getParameter("seq"), 				// value
							"/", 										// path
							24*60*60									// maxAge
					); 									
					
					response.addCookie(cookie_seq);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				/*////////////////////////////
				 *	쿠키 리스트
				 *////////////////////////////
				
				try {
					CookieBox cookieBox = new CookieBox(request);
					seq_arr = new ArrayList<String>();
				    Cookie[] cookie_arr = cookieBox.getCookies();
//				    System.out.println("쿠키 불러옴");
				    for(int i=0; i<cookie_arr.length; i++) {
				    	seq_arr.add(cookieBox.getCookieValue(cookie_arr[i]));
//				    	System.out.println(seq_arr.get(i));
				    }
			    
				    
				} catch (Exception e) {
					System.out.println(e);
				} finally {
					try {
						
						cookieDao cookie = sqlSession.getMapper(cookieDao.class);
//						// 쿠키 세션에 담기
						ArrayList<RestaurantsDto> arr = cookie.cookieListDao(seq_arr);
						for(int i=0; i<arr.size(); i++) {
//							System.out.println("쿠키 리스트 : " +arr.get(i).getSeq());
						}
						cookieSession.setAttribute("cookie_list", cookie.cookieListDao(seq_arr));
						cookieSession.setAttribute("cookie_Cnt", seq_arr.size());
			
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
				
				
				return "restaurants";
		}
	
	
	/*////////////////////////////
	 *	검색
	 *////////////////////////////
	
	@RequestMapping("search")
	public String search(HttpServletRequest request, Model model) {
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		
		int page = 0;
		if(request.getParameter("page") == null) {
			page = 1;
		}else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<RestaurantsDto> add = dao.search((request.getParameter("search")), ((page-1)*10));
		ArrayList<RestaurantsDto> addr =new ArrayList<RestaurantsDto>();
		for(int i=0; i<add.size(); i++) {
			String[] address = add.get(i).getAddr().split("지번");
			RestaurantsDto dto = new RestaurantsDto(address[1]);
			addr.add(dto);
		}
		int restaurantnum = dao.r_tableCount(request.getParameter("search"));
//		System.out.println(restaurantnum);
		model.addAttribute("restaurantnum", restaurantnum);
		model.addAttribute("add",addr);
		model.addAttribute("list",dao.search((request.getParameter("search")), ((page-1)*10)));
		
		return "/search";
	}
	
	
	
	/*////////////////////////////
	 *	쿠키 삭제
	 *////////////////////////////
	
	@RequestMapping("/deleteCookie")
	public String deleteCookie(HttpServletRequest request, HttpServletResponse response) {
		
		String seq = "";
		String page_name = "";
		
		try {
			// 쿠키 삭제 기한 만료
			CookieBox cookieBox = new CookieBox(request);
			cookieBox.existsCookies(cookieBox, request, response);
			
			cookieSession.invalidate();
			
			if(page_name.equals("restaurants")) {
				seq = request.getParameter("seq");
				page_name = URLEncoder.encode(request.getParameter("page_name"), "UTF-8");
				
				return "redirect:/" + page_name + 
						"?seq=" + seq;
				
			}else if(page_name.equals("top_lists")) {
				String rest_category = URLEncoder.encode(request.getParameter("rest_category"), "UTF-8");
				String rest_kind = URLEncoder.encode(request.getParameter("rest_kind"), "UTF-8");
				String rest_addr = URLEncoder.encode(request.getParameter("rest_addr"), "UTF-8");
				
				return "redirect:/" + page_name + 
						"?seq=" + seq +
						"&rest_category=" + rest_category + 
						"&rest_kind=" + rest_kind + 
						"&rest_addr=" + rest_addr;
				
			}else {
				return "redirect:/MangoMain";
				
			}
		
		}catch(Exception e) {
			e.printStackTrace();
//			System.out.println("삭제할 쿠키가 없습니다.");
		}
		return "redirect:/MangoMain";
	}
	
	@RequestMapping("moreReview")
	public String moreReview(HttpServletRequest request, Model model) {
		System.out.println("moreReview()");
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		
//		System.out.println(request.getParameter("seq"));
//		System.out.println(Integer.parseInt(request.getParameter("index_start")));
		
		model.addAttribute("review",dao.reviewList(request.getParameter("seq"), Integer.parseInt(request.getParameter("index_start"))));
		
		return "/moreReview";
	}
	
}
