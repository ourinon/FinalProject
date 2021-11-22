package com.study.game.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.study.game.dto.GameDto;
import com.study.game.dto.GameMatchingDTO;

@Repository
public class GameDao {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<GameDto> getAllList() {
		return mybatis.selectList("com.study.game.GameMapper.GameList");
	}
	
	public List<GameDto> getSearchList(GameDto game) {
		return mybatis.selectList("com.study.game.GameMapper.GameSearch", game);
	}
	
	public List<GameDto> getGameByPcList(GameDto game){
		return mybatis.selectList("com.study.game.GameMapper.GamebyPc", game);
	}

	public void insertGame(GameDto game) {
		mybatis.selectList("com.study.game.GameMapper.GameInsert", game);
	}

	public GameDto getGameByID(int SIBAL) {
		return mybatis.selectOne("com.study.game.GameMapper.GameOneId", SIBAL);
	}
	
	public List<GameDto> getGameSelect1(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect1",dto);
	}
	
	public List<GameDto> getGameSelect2(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect2",dto);
	}
	
	public List<GameDto> getGameSelect3(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect3",dto);
	}
	
	public List<GameDto> getGameSelect4(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect4",dto);
	}
	
	public List<GameDto> getGameSelect5(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect5",dto);
	}
	
	public List<GameDto> getGameSelect6(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect6",dto);
	}
	
	public List<GameDto> getGameSelect7(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect7",dto);
	}
	
	public List<GameDto> getGameSelect8(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect8",dto);
	}
	
	public List<GameDto> getGameSelect9(GameMatchingDTO dto){
		return mybatis.selectList("com.study.game.GameMapper.GameSelect9",dto);
	}
	
	public void getGameRate(int game_id) {
		int sum, count;
		GameDto dto = new GameDto();
		try {
			sum = mybatis.selectOne("com.study.game.GameMapper.GameRateSum", game_id);
			count = mybatis.selectOne("com.study.game.GameMapper.GameRateCount", game_id);
		} catch (NullPointerException e) {
			sum = 0;
			count = 0;
		}
		dto.setGameId(game_id);
		dto.setRate(Math.round((float)sum/count*10)/10.0);
		if(sum == 0 || count == 0)
			mybatis.update("GameUpdateRate", dto);
		else {
			mybatis.update("GameUpdateRate", dto);
		}
	}
	
	public List<Integer> getGameRates(int game_id) {
		List<Integer> asd = new ArrayList<Integer>();
		asd.add(mybatis.selectOne("com.study.game.GameMapper.GameRate1", game_id));
		asd.add(mybatis.selectOne("com.study.game.GameMapper.GameRate2", game_id));
		asd.add(mybatis.selectOne("com.study.game.GameMapper.GameRate3", game_id));
		asd.add(mybatis.selectOne("com.study.game.GameMapper.GameRate4", game_id));
		asd.add(mybatis.selectOne("com.study.game.GameMapper.GameRate5", game_id));
		System.out.println(asd);
		return asd;
	}
	
	public void updateViews(GameDto game) {
		mybatis.selectList("com.study.game.GameMapper.GameUpdateViews", game);
		mybatis.selectList("com.study.game.GameMapper.GameUpdateRecommend", game);
	} 
	
	//게임랭킹 조회수 순
	public List<GameDto> getGameRankingViews(){
		return mybatis.selectList("com.study.game.GameMapper.GameRankingViews");
	}
	
	//추천순 게임랭킹
	public List<GameDto> getGameRankingReco(){
		return mybatis.selectList("com.study.game.GameMapper.GameRankingReco");
	}
}