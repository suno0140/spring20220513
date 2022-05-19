package com.choong.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.mapper.Ex05Mapper;
import com.choong.spr.mapper.Ex06Mapper;

@Service
public class Ex07Service {

	@Autowired
	private Ex05Mapper mapper;
	
	@Autowired
	private Ex06Mapper replyMapper;
	
	
	public String getCustomerNameById(int id) {
		return mapper.selectCustomerNameById(id);
	}

	public String getEmployeeFirstNameById(int id) {
		return mapper.selectEmployeeFirstNameById(id);
	}

	public List<BoardDto> listBoard(int page, int rowPerPage) {
		
		int from = (page-1) * rowPerPage;
		
		return mapper.selectBoard(from, rowPerPage);
	}

	public BoardDto getBoard(int id) {
		return mapper.getBoard(id);
	}

	public boolean updateBoard(BoardDto board) {
		int cnt = mapper.updateBoard(board);
		
		return cnt == 1;
	}

	@Transactional
	public boolean removeBoardById(int id) {
		// 댓글 지우기
		replyMapper.deleteReplyByBoard(id);
		// 게시물 지우기
		int cnt = mapper.deleteBoard(id);
		
		return cnt == 1;
	}

	public boolean addBoard(BoardDto board) {
		//board.setInserted(LocalDateTime.now());
		
		int cnt = mapper.insertBoard(board);
		
		return false;
	}

	public int countBoard() {		
		return mapper.countBoard();
	}
	
}