package com.springlec.mango.util;
//참고 : https://javacan.tistory.com/entry/90
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.util.Map;
import java.net.URLEncoder; 
import java.net.URLDecoder; 
import java.io.IOException; 

public class CookieBox {
	Cookie[] cookies = null;
    private Map cookieMap = new java.util.HashMap();
    
    //Constructor
    public CookieBox(HttpServletRequest request) {
        cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0 ; i < cookies.length ; i++) {
                cookieMap.put(cookies[i].getName(), cookies[i]);
            }
        }
    }

    //쿠키 생성 1
    public static Cookie createCookie(String name, String value)
    throws IOException {
        return new Cookie(name, URLEncoder.encode(value, "utf-8"));
    }
    
    //쿠키 생성 2 경로, 만료기한
    public static Cookie createCookie(
            String name, String value, String path, int maxAge) 
    throws IOException {
        Cookie cookie = new Cookie(name, 
                                URLEncoder.encode(value, "utf-8"));
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        return cookie;
    }
    
    //쿠키 생성 3	도메인 , 경로, 만료기한
    public static Cookie createCookie(
            String name, String value,  
            String domain, String path, int maxAge) 
    throws IOException {
        Cookie cookie = new Cookie(name, 
                  URLEncoder.encode(value, "utf-8"));
        cookie.setDomain(domain);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        return cookie;
    }

    //특정 쿠키만 가져오기	
    public Cookie getCookie(String name) {
        return (Cookie)cookieMap.get(name); 
    }
    
    //특정 쿠키의 값만 가져오기	
    public String getValue(String name) throws IOException {
        Cookie cookie = (Cookie)cookieMap.get(name);
        if (cookie == null) return null;
        return URLDecoder.decode(cookie.getValue(), "utf-8");
    }
    
    //특정 쿠키만 삭제
    public boolean exists(String name) {
        return cookieMap.get(name) != null;
    }
    
////////////////////    
// 추가한 메소드
////////////////////
    
    //모든 쿠키 삭제  (쿠키 생성시 PATH 지정했다면 삭제시에도 동일 PATH 지정해야함.)
  	public void existsCookies(CookieBox cookieBox, HttpServletRequest request, HttpServletResponse response) {
  		cookieBox = new CookieBox(request);
  		cookies = request.getCookies();
  		for(Cookie c : cookies) { 
      		c.setMaxAge(0);
      		c.setPath("/");
      		response.addCookie(c);
      	}
  	}
    
    //모든 쿠키 가져오기
    public Cookie[] getCookies() { 
    	return cookies; 
    }
    
    //해당 쿠키의 값 가져오기
    public String getCookieValue(Cookie ck) throws IOException {
        Cookie cookie = ck;
        if (cookie == null) return null;
        return URLDecoder.decode(cookie.getValue(), "utf-8");
    }
}