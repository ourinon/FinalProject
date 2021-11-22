package com.study.game.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.study.game.dto.BoardDTO;

public interface BoardService {
	
	public ModelAndView getAllList(int gi_id);

}
