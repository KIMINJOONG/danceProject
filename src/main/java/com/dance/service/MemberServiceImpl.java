package com.dance.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.dance.dao.memberDao;
import com.dance.vo.MemberVo;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private memberDao memberDao;
	
	@Override
	public void insert(MemberVo memberVo) throws Exception {
		memberDao.insert(memberVo);
	}
	
	public int login(MemberVo memberVo, HttpSession session) throws Exception {
		int isLogin =  memberDao.login(memberVo, session);
		if (isLogin == 1) {
			session.setAttribute("id", memberVo.getId());
		} 
		return isLogin;
	}
}
