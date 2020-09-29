package com.springlec.mango.dto;


public class ReviewDto {
	
	private String seq_review;
	private String member_id_user;
	private String r_seq;
	private String content;
	private String image;
	private String rating;
	private String user_img;
	private String user_name;
	private String date;

	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}


	public ReviewDto(String seq_review, String member_id_user, String r_seq, String content, String image,
			String rating, String user_img, String user_name, String date) {
		super();
		this.seq_review = seq_review;
		this.member_id_user = member_id_user;
		this.r_seq = r_seq;
		this.content = content;
		this.image = image;
		this.rating = rating;
		this.user_img = user_img;
		this.user_name = user_name;
		this.date = date;
	}


	public String getSeq_review() {
		return seq_review;
	}


	public void setSeq_review(String seq_review) {
		this.seq_review = seq_review;
	}


	public String getMember_id_user() {
		return member_id_user;
	}


	public void setMember_id_user(String member_id_user) {
		this.member_id_user = member_id_user;
	}


	public String getR_seq() {
		return r_seq;
	}


	public void setR_seq(String r_seq) {
		this.r_seq = r_seq;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getUser_img() {
		return user_img;
	}


	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	
	
}
