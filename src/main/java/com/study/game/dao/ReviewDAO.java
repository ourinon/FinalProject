package com.study.game.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.game.dto.GameDto;
import com.study.game.dto.ReviewDTO;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ReviewDTO> getAllList(int gameId) {
		return mybatis.selectList("com.study.game.GameMapper.ReviewList",gameId);
	}

	public void insertReview(ReviewDTO review) {
		mybatis.insert("com.study.game.GameMapper.ReviewInsert", review);
	}
	
	public void UpdateReview(ReviewDTO review) {
		mybatis.update("com.study.game.GameMapper.ReviewUpdate", review);
	}

	public ReviewDTO getReviewByID(int ReviewId) {
		return mybatis.selectOne("com.study.game.GameMapper.ReviewOneId", ReviewId);
	}
	
	public void deleteReview(ReviewDTO review) {
		mybatis.selectList("com.study.game.GameMapper.ReviewDelete", review);
	}
}
