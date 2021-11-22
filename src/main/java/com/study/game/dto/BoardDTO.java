package com.study.game.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	int seq, target;
	String hhead;
	int writer_id;
	String wnick, wimg;
	Date wdate;
	String title, content;
	int likes, views, state;

	@Override
	public String toString() {
		return "BoardDTO [seq=" + seq + ", target=" + target + ", hhead=" + hhead + ", writer_id=" + writer_id
				+ ", wnick=" + wnick + ", wimg=" + wimg + ", wdate=" + wdate + ", title=" + title
				+ ", content=" + content + ", likes=" + likes + ", views=" + views + ", state=" + state + "]";
	}

	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int seq, int target, String hhead, int writer_id, String wnick, String wimg, Date wdate,
			String title, String content, int likes, int views, int state) {
		this.seq = seq;
		this.target = target;
		this.hhead = hhead;
		this.writer_id = writer_id;
		this.wnick = wnick;
		this.wimg = wimg;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.views = views;
		this.state = state;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}

	public String gethhead() {
		return hhead;
	}

	public void sethhead(String hhead) {
		this.hhead = hhead;
	}

	public int getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
	}

	public String getwnick() {
		return wnick;
	}

	public void setwnick(String wnick) {
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}