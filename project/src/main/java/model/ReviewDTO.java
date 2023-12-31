package model;

import java.sql.Timestamp;

public class ReviewDTO {
	
	int review_num;
	String mem_id;
	Timestamp review_date;//작성시간
	String review_subject;//제목
	String review_content;//본문
	String room_type;//룸타입
	int review_ref;
	int review_re_step;
	int review_re_level;
	
	
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	
	
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public int getReview_ref() {
		return review_ref;
	}
	public void setReview_ref(int review_ref) {
		this.review_ref = review_ref;
	}
	public int getReview_re_step() {
		return review_re_step;
	}
	public void setReview_re_step(int review_re_step) {
		this.review_re_step = review_re_step;
	}
	public int getReview_re_level() {
		return review_re_level;
	}
	public void setReview_re_level(int review_re_level) {
		this.review_re_level = review_re_level;
	}
	
	
}
