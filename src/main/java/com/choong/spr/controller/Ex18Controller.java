package com.choong.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.Ex08Service;

@Controller
@RequestMapping("ex18")
public class Ex18Controller {

	@Autowired
	private Ex08Service service;
	
	@PostMapping("reply/add")
	public String addReply(ReplyDto reply) {
		boolean success = service.addReply(reply);
		
		return "redirect:/ex17/board/" + reply.getBoardId();
	}
	
	@PostMapping("reply/remove")
	public String removeReply(ReplyDto reply) {
		boolean success = service.removeReplyById(reply.getId());
		
		return "redirect:/ex17/board/" + reply.getBoardId();
	}
	@PostMapping("reply/modify")
	public String modifyReply(ReplyDto reply) {
		boolean success = service.modifyReply(reply);
		
		return "redirect:/ex17/board/" + reply.getBoardId();
	}
}

