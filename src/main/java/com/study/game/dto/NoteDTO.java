package com.study.game.dto;

import java.sql.Date;

public class NoteDTO {
	int seq, receiver, sender;
	String rnick, snick;
	Date sdate;
	String content;
	int state;
	
	@Override
	public String toString() {
		return "NoteDTO [seq=" + seq + ", receiver=" + receiver + ", sender=" + sender + ", rnick=" + rnick + ", snick="
				+ snick + ", sdate=" + sdate + ", content=" + content + ", state=" + state + "]";
	}

	public NoteDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoteDTO(int seq, int receiver, int sender, String rnick, String snick, Date sdate, String content,
			int state) {
		this.seq = seq;
		this.receiver = receiver;
		this.sender = sender;
		this.rnick = rnick;
		this.snick = snick;
		this.sdate = sdate;
		this.content = content;
		this.state = state;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public String getRnick() {
		return rnick;
	}

	public void setRnick(String rnick) {
		this.rnick = rnick;
	}

	public String getSnick() {
		return snick;
	}

	public void setSnick(String snick) {
		this.snick = snick;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
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
