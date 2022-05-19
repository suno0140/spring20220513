package com.choong.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choong.spr.domain.BoardDto;

public interface Ex05Mapper {

	int countBoard();

	String selectCustomerNameById(int id);

	String selectEmployeeFirstNameById(int id);

	List<BoardDto> selectBoard(@Param("from") int from, @Param("row") int row);

	BoardDto getBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int insertBoard(BoardDto board);


}