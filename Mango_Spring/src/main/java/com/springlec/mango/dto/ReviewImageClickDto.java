package com.springlec.mango.dto;

public class ReviewImageClickDto {
	
	String content;
	String date;
	String rating;
	String r_image;
	String name;
	String m_image;
	
	public ReviewImageClickDto() {
		// TODO Auto-generated constructor stub
	}

	public ReviewImageClickDto(String content, String date, String rating, String r_image, String name,
			String m_image) {
		super();
		this.content = content;
		this.date = date;
		this.rating = rating;
		this.r_image = r_image;
		this.name = name;
		this.m_image = m_image;
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

	public void setR_image(String r_image) {
		this.r_image = r_image;
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

	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
}