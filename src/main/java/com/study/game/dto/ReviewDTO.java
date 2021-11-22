package com.study.game.dto;

import java.sql.Date;

public class ReviewDTO {
	int rv_id, rv_target, tv_writer;
	String tv_wnic, tv_wimg;
	Date rv_date;
	String rv_content;
	int rv_reco, rv_star, rv_like, rv_dec, rv_state;

	@Override
	public String toString() {
		return "ReviewDTO [rv_id=" + rv_id + ", rv_target=" + rv_target + ", tv_writer=" + tv_writer + ", tv_wnic="
				+ tv_wnic + ", tv_wimg=" + tv_wimg + ", rv_date=" + rv_date + ", rv_content=" + rv_content
				+ ", rv_reco=" + rv_reco + ", rv_star=" + rv_star + ", rv_like=" + rv_like + ", rv_dec=" + rv_dec
				+ ", rv_state=" + rv_state + "]";
	}

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rv_id, int rv_target, int tv_writer, String tv_wnic, String tv_wimg, Date rv_date,
			String rv_content, int rv_reco, int rv_star, int rv_like, int rv_dec, int rv_state) {
		super();
		this.rv_id = rv_id;
		this.rv_target = rv_target;
		this.tv_writer= tv_writer;
		this.tv_wnic = tv_wnic;
		this.tv_wimg = tv_wimg;
		this.rv_date = rv_date;
		this.rv_content = rv_content;
		this.rv_reco = rv_reco;
		this.rv_star = rv_star;
		this.rv_like = rv_like;
		this.rv_dec = rv_dec;
		this.rv_state = rv_state;
	}

	public int getRv_id() {
		return rv_id;
	}

	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
	}

	public int getRv_target() {
		return rv_target;
	}

	public void setRv_target(int rv_target) {
		this.rv_target = rv_target;
	}

	public int getTv_writer() {
		return tv_writer;
	}

	public void setTv_writer(int tv_writer) {
		this.tv_writer = tv_writer;
	}

	public String getTv_wnic() {
		return tv_wnic;
	}

	public void setTv_wnic(String tv_wnic) {
		this.tv_wnic = tv_wnic;
	}

	public String getTv_wimg() {
		return tv_wimg;
	}

	public void setTv_wimg(String tv_wimg) {
		this.tv_wimg = tv_wimg;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_reco() {
		return rv_reco;
	}

	public void setRv_reco(int rv_reco) {
		this.rv_reco = rv_reco;
	}

	public int getRv_star() {
		return rv_star;
	}

	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}

	public int getRv_like() {
		return rv_like;
	}

	public void setRv_like(int rv_like) {
		this.rv_like = rv_like;
	}

	public int getRv_dec() {
		return rv_dec;
	}

	public void setRv_dec(int rv_dec) {
		this.rv_dec = rv_dec;
	}

	public int getRv_state() {
		return rv_state;
	}

	public void setRv_state(int rv_state) {
		this.rv_state = rv_state;
	}
}
