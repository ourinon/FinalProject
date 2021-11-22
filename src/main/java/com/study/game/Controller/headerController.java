package com.study.game.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/header")
public class headerController {
	
	// 게임 정보로 이동
	@RequestMapping(value = "/game", method = RequestMethod.GET)
	public String game() {
		return "header/Game information";
	}
	
	// 장르 정보로 이동
	@RequestMapping(value = "/genre", method = RequestMethod.GET)
	public String genre() {
		return "header/Genre information";
	}
	
	// 공지사항으로 이동
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "header/Notice";
	}
	
	// 랭킹으로 이동
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public String ranking() {
		return "header/Ranking";
	}

}
