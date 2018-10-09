package com.dance.mapper;

import com.dance.vo.MemberVo;

public interface MemberMapper {
	public void insert(MemberVo vo) throws Exception;
	public int login(MemberVo vo) throws Exception;
}
