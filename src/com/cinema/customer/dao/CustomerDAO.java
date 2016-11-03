package com.cinema.customer.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;
import com.cinema.member.dao.MemberVO;
import com.cinema.movieList.dao.MovieVO;


public class CustomerDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void faqInsert(CustomerVO vo){
		SqlSession session=ssf.openSession();
		session.insert("faqInsert",vo);
		session.commit();
		session.close();
	}
	
	list
	

}
