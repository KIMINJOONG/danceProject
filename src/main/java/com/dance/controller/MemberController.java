package com.dance.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dance.service.MemberService;
import com.dance.vo.MemberVo;
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVo member = (MemberVo)session.getAttribute("member");
		if(member == null) {
			mav.addObject("member",null);
			mav.setViewName("main");
		} else {
			mav.addObject("member",member);
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping("join.do")
	public ModelAndView join(MemberVo memberVo, ModelAndView mav) throws Exception {
		System.out.println("------------post방식입니다.-------------------");
		service.insert(memberVo);
		mav.setViewName("main");
		return mav;
	}
	@RequestMapping("login.do")
	public ModelAndView login(MemberVo memberVo, HttpSession session) throws Exception	{
		System.out.println("login.do----------------------");
		int isLogin = service.login(memberVo, session);
		session.setAttribute("ID", memberVo.getId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("isLogin", isLogin);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="logout.do", produces="application/json;charset=utf8")
	public ModelAndView logOut(HttpSession session) {
		System.out.println("logout.do---------------------------------");
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","로그아웃 되었습니다.");
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("gesi.do")
	public ModelAndView gesi() {
		System.out.println("gesi.do-------------------------------");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gesipanEx");
		return mav;
	}
}
