package com.study.game.service;

import java.util.List;

import com.study.game.dto.GameDto;
import com.study.game.dto.ReviewDTO;

public interface GameService {
   //모든 게임 목록
   public List<GameDto> getAllList();
   
   //게임 검색 목록
   public List<GameDto> getSearchList(GameDto game);
   
   //pc장르 게임 목록
   public List<GameDto> gameByParameterList(GameDto game);
   
   //게임 추가
   public void createGame(GameDto dto);
   
   //게임 상세보기 정보
   public GameDto gameByID(int GameId);
   public List<Integer> gameRates(int GameId);
   
   //게임 리뷰 추가
   public void createReview(ReviewDTO review);
   
   //모든 게임 리뷰 목록
   public List<ReviewDTO> getAllReviewList(int asd);

   //게임 리뷰 삭제
   public void deleteReview(ReviewDTO review);
   
   //게임 리뷰 업데이트
   public void updateReview(ReviewDTO review);
}