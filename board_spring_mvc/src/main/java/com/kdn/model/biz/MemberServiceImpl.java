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
	public Member search(String id) {
		Member member = null;
		try {
			member = dao.search( id);
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
			throw new UpdateException("DB �꽌踰� �삤瑜�");
		}
	}

	public boolean login(String id, String passwrod) {
		Member member = null;
		try {
			member = dao.search( id);
		} catch(Exception  s){
			throw new UpdateException("DB �꽌踰� �삤瑜�");
		} 
		if(member == null){
			throw new UpdateException("�빐�떦�븯�뒗 �븘�씠�뵒�뒗 議댁옱�븯吏� �븡�뒿�땲�떎.");
		}
		if(passwrod ==null || !passwrod.equals(member.getPassword())){
			throw new UpdateException("鍮꾨�踰덊샇媛� 留욎� �븡�뒿�땲�떎.");
		}
		if(member.getWithdraw().equals("Y")){
			throw new UpdateException("�깉�눜�븳 �쉶�썝 �븘�씠�뵒�엯�땲�떎.");
		}
		return true;
	}

	public void withdraw(String id) {
		Member member = null;
		try {
			member = dao.search(id);
			if(member == null){
				throw new UpdateException("�븘�씠�뵒�뿉 �빐�떦�븯�뒗 �쉶�썝�씠 �뾾�뼱 �깉�눜 泥섎━�븷 �닔 �뾾�뒿�땲�떎.");
			}else{
				dao.update(id);
			}
		} catch(Exception  s){
			throw new UpdateException("DB �꽌踰� �삤瑜�");
		}
	}


	public void update(Member member) {
		try {
			Member find= dao.search(member.getId());
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
			Member find= dao.search(member.getId());
			if(find != null){
				throw new UpdateException("�씠誘� �벑濡앸맂 �븘�씠�뵒 �엯�땲�떎.");
			}else{
				dao.add(member);
			}
		} catch(Exception  s){
			throw new UpdateException("DB �꽌踰� �삤瑜�");
		} 
	}
	
}
