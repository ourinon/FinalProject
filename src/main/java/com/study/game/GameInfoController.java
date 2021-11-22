package com.study.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.study.game.dto.BoardDTO;
import com.study.game.dto.GameDto;
import com.study.game.dto.ReviewDTO;
import com.study.game.serviceImpl.BoardServiceImpl;
import com.study.game.serviceImpl.GameServiceImpl;

@Controller
@RequestMapping(value = "/gameInfo")
public class GameInfoController {
   @Autowired
   GameServiceImpl gameListService;
   
	@Autowired
	BoardServiceImpl boardService;
   
   @RequestMapping(value = "", method = RequestMethod.GET)
   public String gameInfo(HttpServletRequest req) {
      GameDto game = gameListService.gameByID(Integer.parseInt(req.getParameter("GameId")));
      game.setViews(game.getViews()+1);
      System.out.println(game);
      gameListService.GameUpdateViews(game);
      gameListService.GameUpdateRate(game.getGameId());
      
      req.setAttribute("game", game);
      req.setAttribute("list", gameListService.getAllReviewList(game.getGameId()));
      req.setAttribute("ratess", gameListService.gameRates(game.getGameId()));
      return "Detail/Detail";
   }
   
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public ModelAndView gameComm(HttpServletRequest req) {
		
		System.out.println("커뮤니티 요청");
		BoardDTO Board = new BoardDTO();
		GameDto game = gameListService.gameByID(Integer.parseInt(req.getParameter("GameId")));
		ModelAndView mnv = boardService.getAllList(Integer.parseInt(req.getParameter("GameId")));
		mnv.addObject("game", game);
		return mnv;
	}
   
   @RequestMapping(value = "/community/write", method = RequestMethod.GET)
   public String write(HttpServletRequest req) {
     
      return "Detail/community/write";
   }
   
   
   
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView commCreate(HttpServletRequest req) {
		ModelAndView mnv = new ModelAndView();
		GameDto game = gameListService.gameByID(Integer.parseInt(req.getParameter("GameId")));
		mnv.addObject("game", game);
		mnv.setViewName("Detail/communityCrud/create");

		return mnv;
	}
   
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public String rankPage(HttpServletRequest req) {
		req.setAttribute("viewsRankingList", gameListService.getViewsGameRanking());
		req.setAttribute("recoRankingList", gameListService.getRecoGameRanking());
		return "/Detail/ranking";
	}
	
	
	//review CRUD
	@RequestMapping(value = "/rvCreate", method = RequestMethod.POST)
	public String rvCreate(HttpServletRequest req) {
		ReviewDTO review = new ReviewDTO();
	    gameListService.GameUpdateRate(Integer.parseInt(req.getParameter("rv_target")));
		review.setTv_writer(Integer.parseInt(req.getParameter("tv_writer")));
		review.setRv_target(Integer.parseInt(req.getParameter("rv_target")));
		review.setTv_wimg(req.getParameter("tv_wimg"));
		review.setTv_wnic(req.getParameter("tv_wnic"));
//		System.out.println("rv_star:"+req.getParameter("rv_star"));
		review.setRv_star(Integer.parseInt(req.getParameter("rv_star")));
		if(req.getParameter("rv_reco") != null) {
			review.setRv_reco(Integer.parseInt(req.getParameter("rv_reco")));
		}
		review.setRv_content(req.getParameter("rv_content"));
		System.out.println(review);
		gameListService.createReview(review);
		return "redirect:/gameInfo?GameId="+req.getParameter("rv_target");
	}
	
	//review CRUD
	@RequestMapping(value = "/rvUpdate", method = RequestMethod.POST)
	public String rvUpdate(HttpServletRequest req) {
		ReviewDTO review = new ReviewDTO();
	    gameListService.GameUpdateRate(Integer.parseInt(req.getParameter("rv_target")));
//		System.out.println("rv_star:"+req.getParameter("rv_star"));
		review.setRv_star(Integer.parseInt(req.getParameter("rv_star")));
		if(req.getParameter("rv_reco") != null) {
			review.setRv_reco(Integer.parseInt(req.getParameter("rv_reco")));
		}
		review.setRv_content(req.getParameter("rv_content"));
		review.setRv_id(Integer.parseInt(req.getParameter("apply_id")));
		System.out.println(review);
		
		gameListService.updateReview(review);
		return "redirect:/gameInfo?GameId="+req.getParameter("rv_target");
	}
	
	
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
	public String rvDelete(HttpServletRequest req) {
		ReviewDTO review = new ReviewDTO();
	    gameListService.GameUpdateRate(Integer.parseInt(req.getParameter("rv_target")));
		review.setRv_id(Integer.parseInt(req.getParameter("rv_id")));
		gameListService.deleteReview(review);
		return "redirect:/gameInfo?GameId="+req.getParameter("rv_target");
	}
	
}