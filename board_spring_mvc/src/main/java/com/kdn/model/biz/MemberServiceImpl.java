package com.kdn.model.biz;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kdn.model.dao.MemberDaoImpl;
import com.kdn.model.domain.Member;
import com.kdn.model.domain.UpdateException;
import com.kdn.model.domain.PageBean;
import com.kdn.util.DBUtil;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public Member search(int mno) {
		Member member = null;
		try {
			System.out.println("test 출력 : " + mno);
			member = dao.search(mno);
		} catch(Exception  s){
			throw new UpdateException("DB 1");
		} 
		if(member == null){
			System.out.println(member);
			throw new UpdateException("2");
		}else{
			return member;
		}
		
	}

	public List<Member> searchAll(PageBean bean) {
		List<Member> members= null;
		try {
			int count = dao.getCount( bean);
			return dao.searchAll(bean);
		} catch(Exception  s){
			throw new UpdateException("DB error");
		}
	}

	public boolean login(int mno, String passwrod) {
		Member member = null;
		try {
			member = dao.search(mno);
		} catch(Exception  s){
			throw new UpdateException("DB login");
		} 
		if(member == null){
			throw new UpdateException("login.");
		}
		if(passwrod ==null || !passwrod.equals(member.getPassword())){
			throw new UpdateException("lo.");
		}
		return true;
	}

	public void update(Member member) {
		try {
			Member find= dao.search(member.getMno());
			if(find == null){
				throw new UpdateException("111");
			}else{
				dao.update( member);
				System.out.println("여긴 되네요");
			}
		} catch(Exception  s){
			throw new UpdateException("DB 222");
		} 
	}
	
	public void add(Member member) {
		try {
			Member find= dao.search(member.getMno());
			if(find != null){
				throw new UpdateException("add.");
			}else{
				dao.add(member);
			}
		} catch(Exception  s){
			throw new UpdateException("DB add");
		} 
	}
}
