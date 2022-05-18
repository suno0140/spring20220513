package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.ReplyDto;

public interface Ex06Mapper {

	int insertReply(ReplyDto reply);

	List<ReplyDto> selectReplyByBoardId(int boardId);

	int deleteReplyById(int id);

	void deleteReplyByBoard(int boardId);

	int updateReply(ReplyDto reply);
}
