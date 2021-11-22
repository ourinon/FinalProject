package com.study.game.serviceImpl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.study.game.dao.BoardDao;
import com.study.game.dto.BoardDTO;
import com.study.game.dto.ReviewDTO;
import com.study.game.service.BoardService;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao dao;
	
	//공지사항 전체 출력
	public ModelAndView getAllList(int gi_id) {
		ModelAndView mnv = new ModelAndView();
		List<BoardDTO> boardList = dao.getAllList(gi_id);
		/* req.setAttribute(null, wnick); */
		System.out.println("전체게시글" + boardList);
		mnv.addObject("boardList", boardList);
		if(gi_id == 0) {
		mnv.setViewName("board/noticeList");
		}else {
			mnv.setViewName("Detail/Community");
		}
		return mnv;
	}

	//공지사항 하나만 출력
	public ModelAndView noticeById(BoardDTO dto, HttpServletRequest req) {
		ModelAndView mnv = new ModelAndView();
		BoardDTO board = dao.BoardOneId(dto);
		board.setViews((board.getViews() + 1)); // 좋아요 기능
		dao.BoardUpdateViews(board); // 좋아요 추가 쿼리 실행
		mnv.addObject("board", board);
		mnv.addObject("GameId", req.getParameter("GameId"));
		mnv.setViewName("board/noticeDetail");
		return mnv;
	}

	// 추가 페이지로 이동
	public ModelAndView noticeInput() {
		ModelAndView mnv = new ModelAndView();
		
		mnv.setViewName("board/noticeInput");
		return mnv;
	}

	//추가
	public ModelAndView noticeInput1(BoardDTO dto) {
		ModelAndView mnv = new ModelAndView();
		
		dao.BoardInsert(dto);
//		System.out.println(dto);
		System.out.println("인풋 포스트 넘어옴");
		if(dto.getTarget() == 0 ) {
			mnv.setViewName("redirect:/board/notice");
			
		}else {
			mnv.setViewName("redirect:/gameInfo/community?GameId=" + dto.getTarget());
		}
		return mnv;
	}

	
	//업데이트 페이지로 이동
	public ModelAndView noticeUpdate(BoardDTO dto, HttpServletRequest req) {
		ModelAndView mnv = new ModelAndView();
		BoardDTO board = dao.BoardOneId(dto);
		mnv.addObject("board", board);
		mnv.addObject("GameId", req.getParameter("GameId"));
		mnv.setViewName("board/noticeUpdate");
		return mnv;
	}

	
	//업데이트
	public ModelAndView noticeUpdate2(BoardDTO dto) {
		ModelAndView mnv = new ModelAndView();
		dao.BoardUpdate(dto);
		
		System.out.println(dto.getTarget());
		
		if(dto.getTarget() == 0 ) {
			mnv.setViewName("redirect:notice?seq=" + dto.getSeq());
			
			
		}else {
			mnv.setViewName("redirect:/gameInfo/community?GameId=" + dto.getTarget() + "&seq=" + dto.getSeq());
			
		}
		

		
		return mnv;
	}

	
	//삭제
	public ModelAndView noticeDelete(BoardDTO dto) {
		ModelAndView mnv = new ModelAndView();
		
		System.out.println("삭제 dto 타켓 : " + dto);
		
		dao.BoardDelete(dto);
		
		if(dto.getTarget() == 0 ) {
			mnv.setViewName("redirect:/board/notice");
			System.out.println("공지사항 삭제 리다이렉트");
			
		}else {
			mnv.setViewName("redirect:/gameInfo/community?GameId=" + dto.getTarget());
			System.out.println("커뮤ㅜ니티 삭제 리다이렉트");
		}
		
		return mnv;
	}

	
	/*
	 * //별점 보여주기 public ModelAndView getStarAllList() { ModelAndView mnv = new
	 * ModelAndView(); List<ReviewDTO> starList = dao.getStarAllList();
	 * mnv.addObject("starList", starList); mnv.setViewName("board/noticeList");
	 * return mnv; }
	 */
	
	/*
	 * //별점 추가 public ModelAndView starInsert(ReviewDTO dto) { ModelAndView mnv =
	 * new ModelAndView();
	 * 
	 * dao.starInsert(dto); mnv.setViewName("redirect:/board/notice"); return mnv; }
	 */


}
