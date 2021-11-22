package com.study.game.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.game.dto.MemberDTO;


@Repository
public class MemberDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<MemberDTO> memberList() {
		return mybatis.selectList("com.study.game.MemberMapper.MemberList");
	}
	
	public MemberDTO memberSelectById(int MemberId) {
		return mybatis.selectOne("com.study.game.MemberMapper.MemberOneId", MemberId);
	}
	
	public MemberDTO memberSelectByEmail(String MemberEmail) {
		return mybatis.selectOne("com.study.game.MemberMapper.MemberOneEmail", MemberEmail);
	}
	
	public void memberRemove(int MemberId) {
		mybatis.delete("com.study.game.MemberMapper.MemberDelete", MemberId);
	}

	public void memberCreate(MemberDTO member) {
		mybatis.insert("com.study.game.MemberMapper.MemberInsert", member);
	}
	
	public void memberUpdatePP(MemberDTO member) {
		mybatis.update("com.study.game.MemberMapper.MemberUpdatePP", member);
	}
	public void memberUpdateNT(MemberDTO member) {
		mybatis.update("com.study.game.MemberMapper.MemberUpdateNT", member);
	}
	public void memberUpdatePW(MemberDTO member) {
		mybatis.update("com.study.game.MemberMapper.MemberUpdatePW", member);
	}
//	@Autowired
//	SqlSessionTemplate mybatis;
//	
//	
//	public List<MemberDTO> selectAll(){
//		System.out.println("회원조회 기능 실행");
//		System.out.println(mybatis);
//		List<MemberDTO> list = mybatis.selectList("org.samzo.cafe.UserMapper.selectAll");
//		System.out.println(list);
//		if(list == null) {
//			return null;
//		}else {
//			return list;
//		}
//	}
//	
//	public MemberDTO  selectOne(MemberDTO dto) {
//		System.out.println("회원매칭 기능 실행");
//		dto = mybatis.selectOne("org.samzo.cafe.UserMapper.selectOne",dto);
//		System.out.println(dto);
//		if(dto == null) {
//			return null;
//		}else {
//			return mybatis.selectOne("org.samzo.cafe.UserMapper.selectOne",dto);
//		}
//		
//	}
//	
//	public void insert(MemberDTO dto) {
//		System.out.println("회원가입 기능 실행");
//		mybatis.insert("org.samzo.cafe.UserMapper.insert",dto);
//	}
//	
//	public void update(MemberDTO dto) {
//		System.out.println("회원정보 수정 기능 실행");
//		mybatis.update("org.samzo.cafe.UserMapper.update",dto);
//	}
//	
//	public void delete(MemberDTO dto) {
//		System.out.println("회원 탈퇴 기능 실행");
//		mybatis.delete("org.samzo.cafe.UserMapper.delete",dto);
//	}
//	
//	public MemberDTO adminSelect(MemberDTO dto) {
//		System.out.println("관리자 권한으로 회원 조회기능 실행");
//		return mybatis.selectOne("org.samzo.cafe.UserMapper.adminSelect",dto);
//	}
}

