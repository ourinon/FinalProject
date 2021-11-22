package com.study.game.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.study.game.dto.MemberDTO;
import org.springframework.web.servlet.ModelAndView;


public interface MemberService {

	MemberDTO matching(MemberDTO member);
	
	void modifyPP(MemberDTO member,HttpSession session);
	void modifyNT(MemberDTO member,HttpSession session,HttpServletRequest req);
	void modifyPW(MemberDTO member,HttpSession session);
	void findPw(MemberDTO member);
	
	void delete(MemberDTO member, HttpSession session);
	
	List<MemberDTO> getAllMember();
	
	void registerMember(MemberDTO member);
	
	void adminDelete(MemberDTO member);
	
//	//로그인 페이지
//	ModelAndView loginPage(HttpSession session);
//	
//	//회원가입 페이지
//	ModelAndView joinPage();
//	
//	//회원정보수정 페이지
//	ModelAndView memberModifyPage();
//	
//	//회원탈퇴 페이지
//	ModelAndView memberSecessionPage();
//	
//	//회원정보 조회
//	ModelAndView memberSelect();
//	
//	//로그인
//	ModelAndView memberMaching(MemberDTO dto,HttpSession session);
//	
//	//회원가입
//	ModelAndView memberJoin(MemberDTO dto);
//	
//	//회원정보수정
//	ModelAndView memberModify(HttpSession session, HttpServletRequest req);
//	
//	//회원탈퇴
//	ModelAndView memberSecession(HttpSession session);
//	
//	//로그아웃
//	ModelAndView logout(HttpSession session);
//	
//	//관리자 권한으로 회원정보 수정 페이지
//	ModelAndView adminModifyPage(HttpServletRequest req);
//	
//	//관리자 권한으로 회원정보 수정하기
//	ModelAndView adminModify(HttpServletRequest req);
//	
//	//관리자 권한으로 회원정보 삭제하기
//	ModelAndView adminDelete(HttpServletRequest req);

}