package com.dance.service;

import javax.servlet.http.HttpSession;

import com.dance.vo.MemberVo;

public interface MemberService {
	public void insert(MemberVo memberVo) throws Exception;
	
	public int login(MemberVo memberVo, HttpSession session) throws Exception;
}
