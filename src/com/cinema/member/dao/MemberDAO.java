package com.cinema.member.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.cinema.dao.CreateSqlSessionFactory;

public class MemberDAO {
private static SqlSessionFactory ssf;
	
	static{
		try{
			//SqlSessionBuilder를 사용해서 SqlSession 객체 생성
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
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
		session.selectOne("memberDelete",vo.getNo());
		session.commit();
		session.close();	
	}
	
	public static List<MemberVO> memberOverlab(){
		SqlSession session=ssf.openSession();
		List<MemberVO> id=session.selectList("memberOverlab");
		session.close();
		return id;
	}

}
