package com.study.game.serviceImpl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.study.game.dao.MemberDAO;
import com.study.game.dto.GameDto;
import com.study.game.dto.MemberDTO;
import com.study.game.service.MemberService;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("service")
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public MemberDTO matching(MemberDTO member) {
		List<MemberDTO> list = dao.memberList();
		
		for(int i = 0; i < list.size(); i++) {
			if(member.getM_email().equals(list.get(i).getM_email()) &&
					member.getM_pw().equals(list.get(i).getM_pw())) {
				return list.get(i);
			}
		}
		return null;
	}
	
	@Override 
	public void modifyPP(MemberDTO member,HttpSession session) {
		MemberDTO dto = dao.memberSelectById(member.getM_id());
		dto.setM_img(member.getM_img());
		session.setAttribute("member", dto);
		dao.memberUpdatePP(dto);
	}
	
	//회원정보 수정
	@Override 
	public void modifyNT(MemberDTO member,HttpSession session, HttpServletRequest req) {
		int m_id = Integer.parseInt(req.getParameter("m_id"));
		member.setM_id(m_id);
		MemberDTO dto = dao.memberSelectById(member.getM_id());
		dto.setM_nickname(member.getM_nickname());
		dto.setM_tel(member.getM_tel());
		session.setAttribute("member", dto);
		dao.memberUpdateNT(dto);
	}
	
	@Override 
	public void modifyPW(MemberDTO member,HttpSession session) {
		MemberDTO member2 = (MemberDTO)session.getAttribute("member");
		member.setM_id(member2.getM_id());
		MemberDTO dto = dao.memberSelectById(member.getM_id());
		
		dto.setM_pw(member.getM_pw());
		session.setAttribute("member", dto);
		dao.memberUpdatePW(dto);
	}

	@Override
	public void delete(MemberDTO member, HttpSession session) {
		MemberDTO member2 = (MemberDTO)session.getAttribute("member");
		member.setM_id(member2.getM_id());
		dao.memberRemove(member.getM_id());
		session.invalidate();
	}
	
	@Override
	public void adminDelete(MemberDTO member) {
		dao.memberRemove(member.getM_id());
	}

	@Override
	public List<MemberDTO> getAllMember() {
		return dao.memberList();
	}

	@Override
	public void registerMember(MemberDTO member) {
		dao.memberCreate(member);
	}

	@Override
	public void findPw(MemberDTO member) {
		MemberDTO existingMember = dao.memberSelectByEmail(member.getM_email());
		existingMember.setM_pw(member.getM_pw());
		dao.memberUpdatePW(existingMember);
	}
	
	

//	// 로그인 기능
//	@Override
//	public ModelAndView memberMaching(MemberDTO dto, HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		MemberDTO member = dao.selectOne(dto);
//		if (member != null) {
//			session.setAttribute("member", member);
//			if(member.getM_number() == 1000) {
//				mav.setViewName("member/complate");
//			}else {
//				mav.setViewName("member/main");
//			}
//		} else {
//			mav.setViewName("redirect:login.do");
//		}
//		return mav;
//	}
//
//	// 회원정보 목록
//	@Override
//	public ModelAndView memberSelect() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", dao.selectAll());
//		mav.setViewName("member/memberList");
//		return mav;
//	}
//
//	// 로그인 페이지
//	@Override
//	public ModelAndView loginPage(HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		if (session.getAttribute("member") != null) {
//			if(((MemberDTO)session.getAttribute("member")).getM_number() == 1000) {
//				mav.setViewName("member/complate");
//			}else {
//				mav.setViewName("member/main");
//			}
//		} else {
//			mav.setViewName("member/login");
//		}
//		return mav;
//	}
//
//	// 회원가입 페이지
//	@Override
//	public ModelAndView joinPage() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", dao.selectAll());
//		mav.setViewName("member/join");
//		return mav;
//	}
//
//	// 회원가입
//	@Override
//	public ModelAndView memberJoin(MemberDTO dto) {
//
//		// 멤버번호 생성 로직(멤버번호가 중복되지않게 로직으로 생성해서 넘겨준다)
//		// 1000까지 생성되어있으면 m_number가 1001이 된다
//		// 1000~1007까지 회원번호중에 1003번이 비어있다면 m_number가 1003번이 된다
//		int m_number = 1000; // 멤버번호
//
//		// 서버단 중복체크 변수
//		String overlab = "false";
//
//		// 회원가입 페이지에서 중복체크버튼을 안 누르고 계정생성을 눌렀을 경우 중복 값 체크를 위해
//		// 백엔드 중복체크
//		List<MemberDTO> list = dao.selectAll();
//		for (int i = 0; i < list.size(); i++) {
//			// id 중복체크
//			if (list.get(i).getM_id().equals(dto.getM_id())) {
//				overlab = "true";
//				break;
//				// 닉네임 중복체크
//			} else if (list.get(i).getM_nickname().equals(dto.getM_nickname())) {
//				overlab = "true";
//				break;
//				// 이메일 중복체크
//			} else if (list.get(i).getM_email().equals(dto.getM_email())) {
//				overlab = "true";
//				break;
//			}
//
//			// 이미 존재하는 회원번호라면 회원번호를 + 1 한다
//			if (list.get(i).getM_number() == m_number) {
//				++m_number;
//			} else {
//				break;
//			}
//		}
//		ModelAndView mav = new ModelAndView();
//
//		// id, 닉네임, 이메일 중 중복값이 없다면 로그인 화면으로
//		if (overlab.equals("false")) {
//			dto.setM_number(m_number);
//			dao.insert(dto);
//			mav.setViewName("redirect:login.do");
//
//			// id, 닉네임, 이메일 중 중복값이 하나라도 있다면 다시 회원가입 창으로
//		} else {
//			System.out.println(overlab);
//			mav.addObject("list", dao.selectAll());
//			mav.addObject("overlab", overlab);
//			mav.setViewName("member/join");
//		}
//		return mav;
//	}
//
//	// 회원정보 수정 페이지
//	@Override
//	public ModelAndView memberModifyPage() {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", dao.selectAll());
//		mav.setViewName("member/modify");
//		return mav;
//	}
//
//	// 회원정보 수정
//	@Override
//	public ModelAndView memberModify(HttpSession session, HttpServletRequest req) {
//
//		// 서버단 중복체크 변수
//		String overlab = "false";
//
//		int m_number = Integer.parseInt(req.getParameter("m_number"));
//		
//		MemberDTO member = (MemberDTO)session.getAttribute("member");
//		
//		ModelAndView mav = new ModelAndView();
//		MemberDTO dto = new MemberDTO();
//		dto.setM_number(m_number);
//		dto.setM_id(req.getParameter("m_id"));
//		dto.setM_pw(req.getParameter("m_pw"));
//		dto.setM_nickname(req.getParameter("m_nickname"));
//		dto.setM_email(req.getParameter("m_email"));
//		System.out.println(dto);
//		
//		
//		List<MemberDTO> list = dao.selectAll();
//		for (int i = 0; i < list.size(); i++) {
//			// id 중복체크
//			if (list.get(i).getM_id().equals(dto.getM_id())) {
//				if(!(member.getM_id().equals(dto.getM_id()))) {
//					overlab = "true";
//				}
//				// 닉네임 중복체크
//			} else if (list.get(i).getM_nickname().equals(dto.getM_nickname())) {
//				if(!(member.getM_nickname().equals(dto.getM_nickname()))) {
//					overlab = "true";
//				}
//				// 이메일 중복체크
//			} else if (list.get(i).getM_email().equals(dto.getM_email())) {
//				if(!(member.getM_email().equals(dto.getM_email()))) {
//					overlab = "true";
//				}
//			}
//		}
//		
//		System.out.println(overlab);
//		
//		if (overlab.equals("false")) {
//			dao.update(dto);
//			// 수정 전에 로그인 되어있던 정보를 없애고
//			session.removeAttribute("member");
//			// 수정된 정보를 저장한다
//			session.setAttribute("member", dto);
//			mav.setViewName("redirect:login.do");
//		}else {
//			System.out.println(overlab);
//			mav.addObject("list", dao.selectAll());
//			mav.addObject("overlab", overlab);
//			mav.setViewName("member/modify");
//		}
//		return mav;
//	}
//	
//	// 회원탈퇴 페이지
//	@Override
//	public ModelAndView memberSecessionPage() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("member/remove");
//		return mav;
//	}
//
//	// 회원탈퇴
//	@Override
//	public ModelAndView memberSecession(HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		MemberDTO dto = (MemberDTO) session.getAttribute("member");
//		dao.delete(dto);
//		session.invalidate();
//		mav.setViewName("redirect:login.do");
//		return mav;
//	}
//	
//	
//	// 로그아웃
//	@Override
//	public ModelAndView logout(HttpSession session) {
//		session.invalidate();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:login.do");
//		return mav;
//	}
//	
//	//관리자 권한으로 회원정보 수정 페이지
//	@Override
//	public ModelAndView adminModifyPage(HttpServletRequest req) {
//	
//		String m_id = req.getParameter("id");
//		MemberDTO user = new MemberDTO();
//		user.setM_id(m_id);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("user",dao.adminSelect(user));
//		mav.addObject("list", dao.selectAll());
//		mav.setViewName("member/adminModify");
//		return mav;
//	}
//	
//	//관리자 권한으로 회원정보 수정하기
//	@Override
//	public ModelAndView adminModify(HttpServletRequest req) {
//		// 서버단 중복체크 변수
//				String overlab = "false";
//
//				int m_number = Integer.parseInt(req.getParameter("m_number"));
//				
////				MemberDTO member = (MemberDTO)session.getAttribute("member");
//				
//				ModelAndView mav = new ModelAndView();
//				MemberDTO dto = new MemberDTO();
//				dto.setM_number(m_number);
//				dto.setM_id(req.getParameter("m_id"));
//				dto.setM_pw(req.getParameter("m_pw"));
//				dto.setM_nickname(req.getParameter("m_nickname"));
//				dto.setM_email(req.getParameter("m_email"));
//				System.out.println(dto);
//				
//				MemberDTO user = new MemberDTO();
//				user.setM_id(req.getParameter("id"));
//				user = dao.adminSelect(user);
//				
//				
//				List<MemberDTO> list = dao.selectAll();
//				for (int i = 0; i < list.size(); i++) {
//					// id 중복체크
//					if (list.get(i).getM_id().equals(dto.getM_id())) {
//						if(!(user.getM_id().equals(dto.getM_id()))) {
//							overlab = "true";
//						}
//						// 닉네임 중복체크
//					} else if (list.get(i).getM_nickname().equals(dto.getM_nickname())) {
//						if(!(user.getM_nickname().equals(dto.getM_nickname()))) {
//							overlab = "true";
//						}
//						// 이메일 중복체크
//					} else if (list.get(i).getM_email().equals(dto.getM_email())) {
//						if(!(user.getM_email().equals(dto.getM_email()))) {
//							overlab = "true";
//						}
//					}
//				}
//				
//				System.out.println(overlab);
//				
//				if (overlab.equals("false")) {
//					dao.update(dto);
//					mav.setViewName("redirect:memberList.do");
//				}else {
//					System.out.println(overlab);
//					mav.addObject("user",user);
//					mav.addObject("list", dao.selectAll());
//					mav.addObject("overlab", overlab);
//					mav.setViewName("member/adminModify");
//				}
//				return mav;
//	}
//	
//	//관리자 권한으로 회원 삭제하기
//	@Override
//	public ModelAndView adminDelete(HttpServletRequest req) {
//		int user = Integer.parseInt(req.getParameter("m_number"));
//		MemberDTO dto = new MemberDTO();
//		dto.setM_number(user);
//		dao.delete(dto);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", dao.selectAll());
//		mav.setViewName("redirect:memberList.do");
//		return mav;
//	}
}
