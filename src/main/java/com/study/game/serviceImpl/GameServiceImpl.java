package com.study.game.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.game.dao.GameDao;
import com.study.game.dao.ReviewDAO;
import com.study.game.dto.GameDto;
import com.study.game.dto.GameMatchingDTO;
import com.study.game.dto.ReviewDTO;
import com.study.game.service.GameService;

@Service
public class GameServiceImpl implements GameService{
   @Autowired
   GameDao dao;
   
   @Autowired
   ReviewDAO rDao;
   
   //getGameList
   public List<GameDto> getAllList(){
      return dao.getAllList();
   }
   
   public List<GameDto> gameByParameterList(GameDto game){
	   GameMatchingDTO dto = new GameMatchingDTO();
	   int[] plTgCheck = {game.getPc(),game.getMobile(),game.getConsole(),
			   			  game.getAction(),game.getAdventureAndCasual(),game.getRolePlaying(),
			   			  game.getSimulation(),game.getStrategy(),game.getSportsAndracing()};
	   int checkCount = 0;
	   String[] dbColName = {"pl_pc","pl_mobile","pl_console",
			   				 "gn_action","gn_AnC","gn_rpg",
			   				 "gn_simul","gn_tactic","gn_SnR"};
	   
//	   String[] dtoName = {"pc","console","mobile","action",
//			   			   "adventureAndCasual","rolePlaying",
//			   			   "simulation","strategy","sportsAndracing"};
	   
	   for(int i = 0; i < dbColName.length; i++) {
		   if(plTgCheck[i] == 1) {
			   ++checkCount;
			   if(checkCount == 1) {
				   dto.setDtoParameter1(plTgCheck[i]);
				   dto.setDbColParameter1(dbColName[i]);
			   }else if(checkCount == 2) {
				   dto.setDtoParameter2((plTgCheck[i]));
				   dto.setDbColParameter2(dbColName[i]);
			   }else if(checkCount == 3) {
				   dto.setDtoParameter3((plTgCheck[i]));
				   dto.setDbColParameter3(dbColName[i]);
			   }else if(checkCount == 4) {
				   dto.setDtoParameter4((plTgCheck[i]));
				   dto.setDbColParameter4(dbColName[i]);
			   }else if(checkCount == 5) {
				   dto.setDtoParameter5((plTgCheck[i]));
				   dto.setDbColParameter5(dbColName[i]);
			   }else if(checkCount == 6) {
				   dto.setDtoParameter6((plTgCheck[i]));
				   dto.setDbColParameter6(dbColName[i]);
			   }else if(checkCount == 7) {
				   dto.setDtoParameter7((plTgCheck[i]));
				   dto.setDbColParameter7(dbColName[i]);
			   }else if(checkCount == 8) {
				   dto.setDtoParameter8((plTgCheck[i]));
				   dto.setDbColParameter8(dbColName[i]);
			   }else if(checkCount == 9) {
				   dto.setDtoParameter9((plTgCheck[i]));
				   dto.setDbColParameter9(dbColName[i]);
			   }
		   }  
	   }
	   
	   if(checkCount == 1) {
		   System.out.println("여기 실행함 1개짜리");
		   System.out.println("db컬럼:"+dto.getDbColParameter1());
		   System.out.println("dto항목:"+dto.getDtoParameter1());
		   return dao.getGameSelect1(dto);
	   }else if(checkCount == 2) {
		   return dao.getGameSelect2(dto);
	   }else if(checkCount == 3) {
		   return dao.getGameSelect3(dto);
	   }else if(checkCount == 4) {
		   return dao.getGameSelect4(dto);
	   }else if(checkCount == 5) {
		   return dao.getGameSelect5(dto);
	   }else if(checkCount == 6) {
		   return dao.getGameSelect6(dto);
	   }else if(checkCount == 7) {
		   return dao.getGameSelect7(dto);
	   }else if(checkCount == 8) {
		   return dao.getGameSelect8(dto);
	   }else if(checkCount == 9) {
		   return dao.getGameSelect9(dto);
	   }
	   
	   return dao.getAllList();
   }
   
   //game insert
   public void createGame(GameDto game) {
      dao.insertGame(game);
   }
   
   public GameDto gameByID(int GameId) {
      return dao.getGameByID(GameId);
   }
   
   public List<Integer> gameRates(int GameId) {
      return dao.getGameRates(GameId);
   }
   
   
   @Override
   public void createReview(ReviewDTO review) {
	   rDao.insertReview(review);
   }

   	@Override
	public List<ReviewDTO> getAllReviewList(int asd) {
		return rDao.getAllList(asd);
	}

	@Override
	public void deleteReview(ReviewDTO review) {
		rDao.deleteReview(review);
	}

	@Override
   public List<GameDto> getSearchList(GameDto game) {
	   return dao.getSearchList(game);
   }

	public void updateReview(ReviewDTO review) {
		rDao.UpdateReview(review);
	}
	
	public void GameUpdateViews(GameDto game) {
		dao.updateViews(game);
	}
	
	public void GameUpdateRate(int gaid) {
		dao.getGameRate(gaid);
	}
	
	public List<GameDto> getViewsGameRanking(){
		return dao.getGameRankingViews();
	}
	
	public List<GameDto> getRecoGameRanking(){
		return dao.getGameRankingReco();
	}
}