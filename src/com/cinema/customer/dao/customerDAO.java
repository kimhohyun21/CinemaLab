package com.cinema.customer.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.cinema.dao.CreateSqlSessionFactory;

public class customerDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<customerVO> getcustomerList(Map map){
		SqlSession session = ssf.openSession();
		List<customerVO> list = session.selectList("qnalist", map);
		session.close();
		
		return list;
	}
	
	public static int customerTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("qnatotal");
		session.close();
		
		return total;
		
	}

	public static void customerInsert(customerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("qnainsert", vo);
		session.commit();
		session.close();
	}
	
	public static List<customerVO> getfaqList(){
		SqlSession session = ssf.openSession();  
		List<customerVO> list = session.selectList("faqlist");
		session.close();
		
		return list;
	}
}