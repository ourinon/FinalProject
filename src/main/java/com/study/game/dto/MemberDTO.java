package com.study.game.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	//member 테이블의 각 컬럼들
	int m_id;
	String m_email;
	int rt_id;
	String m_pw, m_name, m_nickname, m_tel, m_img;
	int m_admin;
	MultipartFile img;
	
	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_email=" + m_email + ", rt_id=" + rt_id + ", m_pw=" + m_pw + ", m_name="
				+ m_name + ", m_nickname=" + m_nickname + ", m_tel=" + m_tel + ", m_img=" + m_img + ", m_admin="
				+ m_admin + ", img=" + img + "]";
	}
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int m_id, String m_email, int rt_id, String m_pw, String m_name, String m_nickname, String m_tel,
			String m_img, int m_admin, MultipartFile img) {
		this.m_id = m_id;
		this.m_email = m_email;
		this.rt_id = rt_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_tel = m_tel;
		this.m_img = m_img;
		this.m_admin = m_admin;
		this.img = img;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public int getRt_id() {
		return rt_id;
	}

	public void setRt_id(int rt_id) {
		this.rt_id = rt_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	public int getM_admin() {
		return m_admin;
	}

	public void setM_admin(int m_admin) {
		this.m_admin = m_admin;
	}

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}
}
