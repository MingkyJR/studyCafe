package com.studycafe.userinfo.domain;

import java.util.Date;

public class User_info {

	//filed
	private int user_number;
	private String u_name;
	private String u_id;
	private String u_pass;
	private int u_grade;
	private String u_tell;
	private String u_gender;
	private Date u_credate;
	
	//construct
	public User_info() {
	}

	//get, set
	//회원 고유(식별) 번호
	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	//회원 이름
	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	//회원id
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	//회원 비밀번호
	public String getU_pass() {
		return u_pass;
	}


	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}

	//회원 등급
	public int getU_grade() {
		return u_grade;
	}

	public void setU_grade(int u_grade) {
		this.u_grade = u_grade;
	}

	//회원 전화번호
	public String getU_tell() {
		return u_tell;
	}

	public void setU_tell(String u_tell) {
		this.u_tell = u_tell;
	}

	//회원 성별
	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	//회원 가입일
	public Date getU_credate() {
		return u_credate;
	}

	public void setU_credate(Date u_credate) {
		this.u_credate = u_credate;
	}

	@Override
	public String toString() {
		return "User_info [user_number=" + user_number + ", u_name=" + u_name + ", u_id=" + u_id + ", u_pass=" + u_pass
				+ ", u_grade=" + u_grade + ", u_tell=" + u_tell + ", u_gender=" + u_gender + ", u_credate=" + u_credate
				+ "]";
	}

	

	
	
}
