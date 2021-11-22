package com.study.game;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.game.dto.GameDto;
import com.study.game.dto.MemberDTO;
import com.study.game.service.GameService;
import com.study.game.serviceImpl.GameServiceImpl;
import com.study.game.serviceImpl.MemberServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	GameServiceImpl gameListService;
	@Autowired
	MemberServiceImpl memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	//home
	@RequestMapping(value = "",produces = "application/text; charset=UTF-8", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		if(req.getParameter("projectName") != null) {
			GameDto game = new GameDto();
			game.setProjectName(req.getParameter("projectName"));
			System.out.println(req.getParameter("projectName"));
			req.setAttribute("gameList", gameListService.getSearchList(game));
		}else {
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("gameList", gameListService.getAllList());
		}
		return "home";
	}
	
	//loginPage
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "member/login";
	}
	
	
	//login
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO dto, HttpSession session, HttpServletRequest req) {
		MemberDTO member = memberService.matching(dto);
		if(member != null) {
			session.setAttribute("member",member);
			return "redirect:/";
		}
		req.setAttribute("result", "false");
		return "member/login";
	}
	
	
	//logout
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPage(HttpServletRequest req) {
		req.setAttribute("memberList", memberService.getAllMember());
		return "member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDTO member) {
		memberService.registerMember(member);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPasswordPage(HttpServletRequest req) {
		req.setAttribute("memberList", memberService.getAllMember());
		return "member/findPassword";
	}
	
	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String findPassword(MemberDTO member) {
		memberService.findPw(member);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public String memoPage() {
		return "/Note/note";
	}
	
	@RequestMapping(value = "/search",produces = "application/text; charset=utf8" ,method = RequestMethod.POST)
	public String doSearch(HttpServletRequest req,HttpServletResponse response) throws UnsupportedEncodingException {
		System.out.println("검색 키워드 :" + req.getParameter("keyword"));
		String keyword = req.getParameter("keyword");
		keyword = URLEncoder.encode(keyword, "UTF-8"); 
				
		if(req.getParameter("keyword") != null || req.getParameter("keyword") != "") {
			System.out.println("redirect:/?projectName="+req.getParameter("keyword"));
			return "redirect:/?projectName="+keyword;
		}else {
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/test" ,produces = "application/text; charset=utf8",method = RequestMethod.POST)
	public String test(@RequestParam String keyword, GameDto game) throws JsonProcessingException {
		List<GameDto> list = gameListService.gameByParameterList(game);
		ObjectMapper mapper = new ObjectMapper();
		if(keyword != "") {
			List<GameDto> filterList = new ArrayList<GameDto>();
			String title;
			keyword = keyword.toLowerCase();
			for(int i = 0; i < list.size(); i++) {
				title = list.get(i).getProjectName().toLowerCase();
				if(title.contains(keyword)) {
					filterList.add(list.get(i));
				}
			}
			list = filterList;
		}
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	
	
	@RequestMapping(value = "/myWrite", method = RequestMethod.GET)
	public String myWrite() {
		return "/member/myPage/myWrite";
	}
}
