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
		List<customerVO> list = session.selectList("CList", map);
		session.close();
		
		return list;
	}
	
	public static int customerTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("CTotal");
		session.close();
		
		return total;
		
	}

	public static void customerInsert(customerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("CInsert", vo);
		session.commit();
		session.close();
	}
	
	public static customerVO customerContent(int no){
		SqlSession session = ssf.openSession();
		session.update("CHI", no);
		session.commit();
		customerVO vo = session.selectOne("CContent", no);
		session.close();
		return vo;
	}
	
	public static customerVO customerUpdate(int no){
		SqlSession session = ssf.openSession();
		customerVO vo = session.selectOne("CContent", no);
		session.commit();
		session.close();
		return vo;
	}
	
	public static void customerUpdate_ok(customerVO vo){
		SqlSession session = ssf.openSession();
		session.update("CUpdate", vo);
		session.commit();
		session.close();
	}
	
	public static List<customerVO> getfaqList(){
		SqlSession session = ssf.openSession();
		List<customerVO> list = session.selectList("faqlist");
		session.close();
		
		return list;
	}
	
	public static void customerDelete(customerVO vo){
		SqlSession session = ssf.openSession();
		session.delete("CDelete", vo);
		session.commit();
		session.close();
	}
	
	public static void customerReply(int no, customerVO vo){
		SqlSession session = ssf.openSession();
		customerVO vo2=session.selectOne("GroupData", no);
		vo.setGroup_id(vo2.getGroup_id());
		vo.setGroup_step(vo2.getGroup_step()+1);
		vo.setGroup_tab(vo2.getGroup_tab()+1);
		session.insert("CReply", vo);
		session.commit();
		session.close();
	}
}