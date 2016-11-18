package com.cinema.customer.dao;

import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.*;

public class CustomerDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//고객센터 리스트 불러오기
	public static List<CustomerVO> getcustomerList(Map map){
		SqlSession session = ssf.openSession();
		List<CustomerVO> list = session.selectList("CList", map);
		session.close();
		
		return list;
	}
	
	//총 페이지 표시하여 출력할 수 있게 해주기
	public static int customerTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("CTotal");
		session.close();
		
		return total;
		
	}
	
	//QnA 글쓰기
	public static void customerInsert(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("CInsert", vo);
		session.commit();
		session.close();
	}
	
	//QnA컨텐츠 내용보기
	public static CustomerVO customerContent(int no){
		SqlSession session = ssf.openSession();
		//클릭시 조회수를 하나씩 늘려줌
		session.update("CHit", no);
		session.commit();
		CustomerVO vo = session.selectOne("CContent", no);
		session.close();
		return vo;
	}
	
	//QnA 수정하기에서 insert와 같은 기능
	public static CustomerVO customerUpdate(int no){
		SqlSession session = ssf.openSession();
		CustomerVO vo = session.selectOne("CContent", no);
		session.commit();
		session.close();
		return vo;
	}
	
	//수정하기했을때 DB와 연동하여 수정해주는 기능
	public static void customerUpdate_ok(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.update("CUpdate", vo);
		session.commit();
		session.close();
	}
	
	
	public static List<CustomerVO> getfaqList(){
		SqlSession session = ssf.openSession();
		List<CustomerVO> list = session.selectList("faqlist");
		session.close();
		
		return list;
	}
	
	//삭제 기능
	public static void customerDelete(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.delete("CDelete", vo);
		session.commit();
		session.close();
	}
	
	//답변에서 insert와 같은 기능
	public static void customerReply(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("CReply", vo);
		session.commit();
		session.close();
	}
	
	//부모글 구분하는 기능
	public static CustomerVO customerGroupData(int qno){
		SqlSession session = ssf.openSession();
		CustomerVO vo = session.selectOne("GroupData", qno);
		session.commit();
		session.close();
		return vo;
	}
	
	public static void StepUpdate(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.update("StepUpdate",vo);
		session.commit();
		session.close();
	}
}