package com.study.game.dao;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadDto {
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private String platform;
	private int cnt;
	private MultipartFile uploadFile;
	private String serviceState;
	
	public FileUploadDto(String title, String platform, String writer, String serviceState,
			MultipartFile uploadFile) {
		System.out.println("FileUploadDto 생성 ...");
		this.title = title;
		this.platform = platform;
		this.writer = writer;
		this.serviceState = serviceState;
		this.uploadFile = uploadFile;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public String getServiceState() {
		return serviceState;
	}

	public void setServiceState(String serviceState) {
		this.serviceState = serviceState;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "BoardDTO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", cnt=" + cnt + "]";
	}
}
