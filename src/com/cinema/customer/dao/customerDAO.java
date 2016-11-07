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
	
	public static int customerTotalPage() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("qnatotal");
		session.close();
		
		return total;
		
	}

	public static List<customerVO> getfaqList(){
		SqlSession session = ssf.openSession();  
		List<customerVO> list = session.selectList("faqlist");
		session.close();
		
		return list;
	}
	


}