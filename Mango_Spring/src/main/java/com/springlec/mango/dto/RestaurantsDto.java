package com.springlec.mango.dto;

public class RestaurantsDto {
	
	private String seq;
	private String category;
	private String r_name;
	private String r_gu;
	private String r_dong;
	private String addr;
	private String tel;
	private String kind;
	private String rating;
	private String open_time;
	private String holiday;
	private String menu;
	private String r_code;
	private String img;
	
	public RestaurantsDto() {
		// TODO Auto-generated constructor stub
	}
	
	

	public RestaurantsDto(String seq, String category, String r_name, String r_gu, String r_dong, String addr,
			String tel, String kind, String rating, String open_time, String holiday, String menu, String r_code,
			String img) {
		
		
		super();
		this.seq = seq;
		this.category = category;
		this.r_name = r_name;
		this.r_gu = r_gu;
		this.r_dong = r_dong;
		this.addr = addr;
		this.tel = tel;
		this.kind = kind;
		this.rating = rating;
		this.open_time = open_time;
		this.holiday = holiday;
		this.menu = menu;
		this.r_code = r_code;
		this.img = img;
	}
	public RestaurantsDto(String addr) {
		super();
		this.addr = addr;
		
	}



	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_gu() {
		return r_gu;
	}

	public void setR_gu(String r_gu) {
		this.r_gu = r_gu;
	}

	public String getR_dong() {
		return r_dong;
	}

	public void setR_dong(String r_dong) {
		this.r_dong = r_dong;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getOpen_time() {
		return open_time;
	}

	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	

}
