package com.dance.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dance.vo.MemberVo;

@Repository
public class MemberDaoImpl implements memberDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "com.dance.mapper.MemberMapper";
	
	@Override
	public void insert(MemberVo memberVo) throws Exception {
		sqlSession.insert(namespace + ".insert", memberVo);
	}
	
	public int login(MemberVo memberVo, HttpSession session) throws Exception {
		return sqlSession.selectOne(namespace + ".login", memberVo);
	}
}
