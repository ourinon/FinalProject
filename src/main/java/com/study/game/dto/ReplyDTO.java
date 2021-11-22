package com.study.game.dto;

import java.sql.Date;

public class ReplyDTO {
	int seq, target_b, target_r, writer_id;
	String wnick, wimg;
	Date wdate;
	String content;
	int state;

	@Override
	public String toString() {
		return "ReplyDTO [seq=" + seq + ", target_b=" + target_b + ", target_r=" + target_r + ", writer_id=" + writer_id
				+ ", wnick=" + wnick + ", wimg=" + wimg + ", wdate=" + wdate + ", content=" + content + ", state="
				+ state + "]";
	}

	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(int seq, int target_b, int target_r, int writer_id, String wnick, String wimg, Date wdate,
			String content, int state) {
		this.seq = seq;
		this.target_b = target_b;
		this.target_r = target_r;
		this.writer_id = writer_id;
		this.wnick = wnick;
		this.wimg = wimg;
		this.wdate = wdate;
		this.content = content;
		this.state = state;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getTarget_b() {
		return target_b;
	}

	public void setTarget_b(int target_b) {
		this.target_b = target_b;
	}

	public int getTarget_r() {
		return target_r;
	}

	public void setTarget_r(int target_r) {
		this.target_r = target_r;
	}

	public int getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
	}

	public String getWnick() {
		return wnick;
	}

	public void setWnick(String wnick) {
		this.wnick = wnick;
	}

	public String getWimg() {
		return wimg;
	}

	public void setWimg(String wimg) {
		this.wimg = wimg;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
