package model;

import java.util.Date;

public class MemberDTO {
	private String mem_id; //회원 아이디
	private String mem_pw; //회원 비밀번호
	
	private String mem_name; //회원이름
	private String mem_gender; //성별
	private String mem_birth; //생년월일
	private String mem_email; //이메일
	private String mem_phone; //전화번호
	private String mem_addr; //주소
	private String mem_addr2;//상세주소
	private String mem_zip; //우편번호
	private String mem_grade; //회원등급
	private Date mem_date;//회원가입일
	
	

	


	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_zip() {
		return mem_zip;
	}
	public void setMem_zip(String mem_zip) {
		this.mem_zip = mem_zip;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	
	
	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_gender, String mem_birth,
		String mem_phone, String mem_email, String mem_zip, String mem_addr, String mem_addr2,  String mem_grade,
		Date mem_date) {
	super();
	this.mem_id = mem_id;
	this.mem_pw = mem_pw;
	this.mem_name = mem_name;
	this.mem_gender = mem_gender;
	this.mem_birth = mem_birth;
	this.mem_phone = mem_phone;
	this.mem_zip = mem_zip;		
	this.mem_addr = mem_addr;
	this.mem_addr2 = mem_addr2;
	this.mem_email = mem_email;
	this.mem_grade = mem_grade;
	this.mem_date = mem_date;
}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
		
		
}
	
	



