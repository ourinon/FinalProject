package com.study.game;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.study.game.dto.GameDto;
import com.study.game.dto.MemberDTO;
import com.study.game.serviceImpl.GameServiceImpl;
import com.study.game.serviceImpl.MemberServiceImpl;


@Controller
@RequestMapping(value = "/myPage")
public class MemberController {
	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyPage(HttpServletRequest req) {
		req.setAttribute("memberList", memberService.getAllMember());
		return "member/myPage/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(HttpSession session, MemberDTO member,HttpServletRequest req) {
		memberService.modifyNT(member, session, req);
		return "redirect:/myPage";
	}
	
	@RequestMapping(value = "/passwordModify", method = RequestMethod.GET)
	public String passwordModifyPage() {
		return "member/myPage/passwordModify";
	}
	
	
	
	@RequestMapping(value = "/passwordModify", method = RequestMethod.POST)
	public String passwordModify(HttpSession session, MemberDTO member) {
		memberService.modifyPW(member, session);
		return "redirect:/myPage";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage() {
		return "member/myPage/profile";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String profile(MemberDTO member, HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException {
		Date date = new Date();
		StringBuilder sb = new StringBuilder();
		System.out.println("요청왔음:"+member.getImg());
		MultipartFile uploadFile = member.getImg();
		String saveDirectory = session.getServletContext().getRealPath("resources/img/profile");
		
		if(!uploadFile.isEmpty()) {
			sb.append(date.getTime());
			sb.append(uploadFile.getOriginalFilename());
		}else {
			sb.append("none");
		}
		
		String imgPath = saveDirectory + "\\" + sb.toString();
		String imgName;
		uploadFile.transferTo(new File(imgPath));
		if(!uploadFile.isEmpty()) {
			imgName = req.getContextPath()+"/resources/img/profile/"+sb.toString();
			System.out.println(imgName);
		}else {
			imgName = "";
		}
		MemberDTO loginMember = (MemberDTO)session.getAttribute("member");
		loginMember.setM_img(imgName);
		memberService.modifyPP(loginMember, session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removePage() {
		return "member/myPage/remove";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(HttpSession session, MemberDTO member, HttpServletRequest req) {
		memberService.delete(member, session);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/myWrite", method = RequestMethod.GET)
	public String myWritePage() {
		return "member/myPage/myWrite";
	}
	
	@RequestMapping(value = "/adminRemove", method = RequestMethod.POST)
	public String adminRemove(MemberDTO member, HttpServletRequest req) {
		memberService.adminDelete(member);
		return "redirect:./read";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String memberLookupPage(HttpServletRequest req) {
		req.setAttribute("memberList",memberService.getAllMember());
		System.out.println(memberService.getAllMember());
		return "member/myPage/memberLookup";
	}
}
