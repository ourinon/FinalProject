package com.study.game.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GameDto {
	// 공통 게임 정보
	int GameId;
	String projectName, developer, provider;
	Date releaseDate;
	String titleImg, Introduce;
	double rate;
	int reco, views, state;

	// ImgGet
	MultipartFile img;

	// 플랫폼
	int pc, mobile, console;

	// 장르
	int action, adventureAndCasual, rolePlaying, simulation, strategy, sportsAndracing;

	@Override
	public String toString() {
		return "GameDto [GameId=" + GameId + ", projectName=" + projectName + ", developer=" + developer + ", provider="
				+ provider + ", releaseDate=" + releaseDate + ", titleImg=" + titleImg + ", Introduce=" + Introduce
				+ ", rate=" + rate + ", reco=" + reco + ", views=" + views + ", state=" + state + ", img=" + img
				+ ", pc=" + pc + ", mobile=" + mobile + ", console=" + console + ", action=" + action
				+ ", adventureAndCasual=" + adventureAndCasual + ", rolePlaying=" + rolePlaying + ", simulation="
				+ simulation + ", strategy=" + strategy + ", sportsAndracing=" + sportsAndracing + "]";
	}

	public GameDto() {
		// TODO Auto-generated constructor stub
	}

	// 게임 전체
	public GameDto(int gameId, String projectName, String developer, String provider, Date releaseDate, String titleImg,
			String introduce, double rate, int reco, int views, int state, int pc, int mobile, int console, int action,
			int adventureAndCasual, int rolePlaying, int simulation, int strategy, int sportsAndracing) {
		GameId = gameId;
		this.projectName = projectName;
		this.developer = developer;
		this.provider = provider;
		this.releaseDate = releaseDate;
		this.titleImg = titleImg;
		Introduce = introduce;
		this.rate = rate;
		this.reco = reco;
		this.views = views;
		this.state = state;
		this.pc = pc;
		this.mobile = mobile;
		this.console = console;
		this.action = action;
		this.adventureAndCasual = adventureAndCasual;
		this.rolePlaying = rolePlaying;
		this.simulation = simulation;
		this.strategy = strategy;
		this.sportsAndracing = sportsAndracing;
	}

	public int getGameId() {
		return GameId;
	}

	public void setGameId(int gameId) {
		GameId = gameId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDeveloper() {
		return developer;
	}

	public void setDeveloper(String developer) {
		this.developer = developer;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getIntroduce() {
		return Introduce;
	}

	public void setIntroduce(String introduce) {
		Introduce = introduce;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getReco() {
		return reco;
	}

	public void setReco(int reco) {
		this.reco = reco;
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

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}

	public int getPc() {
		return pc;
	}

	public void setPc(int pc) {
		this.pc = pc;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public int getConsole() {
		return console;
	}

	public void setConsole(int console) {
		this.console = console;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public int getAdventureAndCasual() {
		return adventureAndCasual;
	}

	public void setAdventureAndCasual(int adventureAndCasual) {
		this.adventureAndCasual = adventureAndCasual;
	}

	public int getRolePlaying() {
		return rolePlaying;
	}

	public void setRolePlaying(int rolePlaying) {
		this.rolePlaying = rolePlaying;
	}

	public int getSimulation() {
		return simulation;
	}

	public void setSimulation(int simulation) {
		this.simulation = simulation;
	}

	public int getStrategy() {
		return strategy;
	}

	public void setStrategy(int strategy) {
		this.strategy = strategy;
	}

	public int getSportsAndracing() {
		return sportsAndracing;
	}

	public void setSportsAndracing(int sportsAndracing) {
		this.sportsAndracing = sportsAndracing;
	}
}