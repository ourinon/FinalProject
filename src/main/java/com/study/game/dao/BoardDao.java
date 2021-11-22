package com.study.game.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.study.game.dto.BoardDTO;
import com.study.game.dto.ReviewDTO;

@Repository
public class BoardDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	//전체 공지사항 출력
	public List<BoardDTO> getAllList(int gi_id) {
		//여기 들어옴
		return mybatis.selectList("com.study.game.BoardMapper.BoardList", gi_id);
		
	}
	
	//공지사항 한개 출력
	public BoardDTO BoardOneId(BoardDTO dto) {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardOneId", dto);
	}
	
	
	//공지사항 추가
	public BoardDTO BoardInsert(BoardDTO dto) {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardInsert", dto);
		
	}
	
	//공지사항 수정
	public BoardDTO BoardUpdate(BoardDTO dto) {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardUpdate", dto);
		
	}
	
	//공지사항 삭제
	public BoardDTO BoardDelete(BoardDTO dto) {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardDelete", dto);
		
	}
	
	//공지사항 조회수 수정
	public BoardDTO BoardUpdateViews(BoardDTO dto) {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardUpdateViews", dto);
		
	}
	
	//공지사항 좋아요 수정
	public BoardDTO BoardUpdateLikes() {
		return mybatis.selectOne("com.study.game.BoardMapper.BoardUpdateLikes");
		
	}	
}
