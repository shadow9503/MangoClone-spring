package com.springlec.mango.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springlec.mango.dao.SearchDao;
import com.springlec.mango.dao.reviewInsertDao;

@Controller
public class ReviewInsertController {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/*////////////////////////////////////////////////
	 *	리뷰 작성전 필요한 정보 가져오기 (음식점, 유저 정보)
	 *////////////////////////////////////////////////
	
	@RequestMapping("/ReviewInfo")
	public String Reviewinsert(HttpServletRequest request, Model model) {
		SearchDao dao = sqlSession.getMapper(SearchDao.class);
		model.addAttribute("dto", dao.searchRestaurant(request.getParameter("seq")));
	
		return "Reviewinsert_view";
	}
	
	
	
	/*////////////////////////////
	 *	리뷰 데이터 입력
	 *////////////////////////////
	
	@RequestMapping("reviewinsert")
    public String reviewinsert(MultipartHttpServletRequest mtfRequest, Model model) {
		reviewInsertDao dao = sqlSession.getMapper(reviewInsertDao.class);
		
		String filename = null;
		
        List<MultipartFile> fileList = mtfRequest.getFiles("files");

        String path = "/Users/tj/Documents/yh_spring/Mango_Spring/src/main/webapp/resources/img_review/";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            String separator = File.separator;
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
            filename = System.currentTimeMillis() + originFileName;
            String safeFile = path + filename;
            System.out.println("image : " + filename);
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        String member_id_user = mtfRequest.getParameter("member_id_user");
		String user_name = mtfRequest.getParameter("user_name");
		String user_img = mtfRequest.getParameter("user_img");
		String r_seq = mtfRequest.getParameter("r_seq");
		String reviewcontent = mtfRequest.getParameter("reviewcontent");
		String rating = mtfRequest.getParameter("rating");
		String image = filename;
		
        dao.ReviewinsertDao(member_id_user, r_seq, reviewcontent, rating, image, user_img, user_name);
        model.addAttribute("seq",Integer.parseInt(mtfRequest.getParameter("seq")));
        return "redirect:restaurants";
    }
		

	
}
