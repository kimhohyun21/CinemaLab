package com.cinema.member.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cinema.dao.CreateSqlSessionFactory;

public class MemberDAO {
	private static SqlSessionFactory ssf; //�����ϸ� db connection
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void memberInsert(MemberVO vo){
		SqlSession session=ssf.openSession();
		session.insert("memberInsert",vo);
		session.commit();
		session.close();
	}
	
	public static int memberIdCheck(String id){
		SqlSession session=ssf.openSession();
		int check=session.selectOne("memberIdCheck",id);
		session.close();
		return check;
	}
	
	public static MemberVO memberGetImfor(String id){
		SqlSession session=ssf.openSession();		
		MemberVO list=session.selectOne("memberImfor",id);		
		session.close();
		return list;		
	}
	
	public static String memberFindId(MemberVO vo){
		SqlSession session=ssf.openSession();
		String id=session.selectOne("memberFindId",vo);
		session.close();		
		return id;
		
	}
	
	public static String memberFindPwd(MemberVO vo){
		SqlSession session=ssf.openSession();
		String pwd=session.selectOne("memberFindPwd",vo);		
		session.close();		
		return pwd;
		
	}
	
	public static void memberDelete(MemberVO vo){
		SqlSession session=ssf.openSession();
		int i=session.delete("memberDelete",vo);
		System.out.println(i);
		session.commit();
		session.close();
	}
	
	public static int memberOverlab(String id){
		SqlSession session=ssf.openSession();
		int countid=session.selectOne("memberOverlab", id);
		session.close();
		return countid;
	}

}
