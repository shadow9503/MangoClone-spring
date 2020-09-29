package com.springlec.mango.dto;


public class ReviewClickDto {
	
	String r_name;
	String content;
	String date;
	String rating;
	String r_image;
	String name;
	String m_image;
	int r_seq;
	
	public ReviewClickDto() {
		// TODO Auto-generated constructor stub
	}

	//	리뷰 클릭시 해당 리뷰 정보
	public ReviewClickDto(String r_name, String content, String date, String rating, String r_image,
			String name, String m_image, int r_seq) {
		super();
		this.r_name = r_name;
		this.content = content;
		this.date = date;
		this.rating = rating;
		this.r_image = r_image;
		this.name = name;
		this.m_image = m_image;
		this.r_seq = r_seq;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getR_image() {
		return r_image;
	}

	public void setR_image(String review_image) {
		this.r_image = review_image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getM_image() {
		return m_image;
	}

	public void setM_image(String member_image) {
		this.m_image = member_image;
	}

	public int getR_seq() {
		return r_seq;
	}

	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
}