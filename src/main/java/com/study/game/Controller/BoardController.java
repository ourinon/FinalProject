package com.study.game.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.study.game.dto.BoardDTO;
import com.study.game.dto.ReviewDTO;
import com.study.game.serviceImpl.BoardServiceImpl;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Autowired
	BoardServiceImpl boardService;

	// 공지사항
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView notice(Model model) {

		/* model.addAttribute("boardList", boardService.getAllList(0)); */
		return boardService.getAllList(0);
	}

	// 게임 공지사항 GameId 값 넘겨주기

	@RequestMapping(value = "/noticeGame", method = RequestMethod.GET)
	public ModelAndView noticeGame(Model model, BoardDTO dto) {

		model.addAttribute("boardList", boardService.getAllList(dto.getTarget()));
		return boardService.getAllList(dto.getTarget());
	}

	// 공지사항 디테일로 이동
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public ModelAndView noticeById(BoardDTO dto, HttpServletRequest req) {

		return boardService.noticeById(dto, req);
	}

	// 공지사항 추가페이지로 이동
	@RequestMapping(value = "/noticeInput", method = RequestMethod.GET)
	public ModelAndView noticeInput() {

		return boardService.noticeInput();
	}

	// 공지사항 추가
	@RequestMapping(value = "/noticeInput", method = RequestMethod.POST)
	public ModelAndView noticeInput1(BoardDTO dto, HttpServletRequest req) {
		System.out.println("저장 들어옴");

		/*
		 * System.out.println("공지사항 저장 dto 어드민 : " + req.getParameter("writer_id123"));
		 */

		if (req.getParameter("writer_id123") != null) {
			dto.setWriter_id(Integer.parseInt(req.getParameter("writer_id123")));
		} else {
			dto.setWriter_id(0);

		}

		return boardService.noticeInput1(dto);
	}

	// 공지사항 수정 페이지로 이동
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(BoardDTO dto, HttpServletRequest req) {

		return boardService.noticeUpdate(dto, req);
	}

	// 공지사항 수정
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public ModelAndView noticeUpdate2(BoardDTO dto, HttpServletRequest req) {
		System.out.println("수정 post 뭐가 들어왔나 : " + req.getParameter("GameId"));

		if (req.getParameter("GameId") != null) {
			System.out.println("파스인트실행수정");
			dto.setTarget(Integer.parseInt(req.getParameter("GameId")));
		}
		return boardService.noticeUpdate2(dto);
	}

	// 공지사항 삭제
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	public ModelAndView noticeDelete(BoardDTO dto, HttpServletRequest req) {

		if (req.getParameter("GameId") != null) {

			dto.setTarget(Integer.parseInt(req.getParameter("GameId")));
		}
		return boardService.noticeDelete(dto);
	}

	/*
	 * //별점 표시
	 * 
	 * @RequestMapping(value = "/noticeStar", method = RequestMethod.GET) public
	 * ModelAndView StarList(Model model) {
	 * 
	 * model.addAttribute("starList", boardService.getStarAllList()); return
	 * boardService.getStarAllList(); }
	 */

	/*
	 * //별점 추가
	 * 
	 * @RequestMapping(value = "/starInsert", method = RequestMethod.POST) public
	 * ModelAndView Star(ReviewDTO dto) { return boardService.starInsert(dto); }
	 */

}
