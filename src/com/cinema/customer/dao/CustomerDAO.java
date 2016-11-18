package com.cinema.customer.dao;

import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.*;

public class CustomerDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//������ ����Ʈ �ҷ�����
	public static List<CustomerVO> getcustomerList(Map map){
		SqlSession session = ssf.openSession();
		List<CustomerVO> list = session.selectList("CList", map);
		session.close();
		
		return list;
	}
	
	//�� ������ ǥ���Ͽ� ����� �� �ְ� ���ֱ�
	public static int customerTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("CTotal");
		session.close();
		
		return total;
		
	}
	
	//QnA �۾���
	public static void customerInsert(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("CInsert", vo);
		session.commit();
		session.close();
	}
	
	//QnA������ ���뺸��
	public static CustomerVO customerContent(int no){
		SqlSession session = ssf.openSession();
		//Ŭ���� ��ȸ���� �ϳ��� �÷���
		session.update("CHit", no);
		session.commit();
		CustomerVO vo = session.selectOne("CContent", no);
		session.close();
		return vo;
	}
	
	//QnA �����ϱ⿡�� insert�� ���� ���
	public static CustomerVO customerUpdate(int no){
		SqlSession session = ssf.openSession();
		CustomerVO vo = session.selectOne("CContent", no);
		session.commit();
		session.close();
		return vo;
	}
	
	//�����ϱ������� DB�� �����Ͽ� �������ִ� ���
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
	
	//���� ���
	public static void customerDelete(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.delete("CDelete", vo);
		session.commit();
		session.close();
	}
	
	//�亯���� insert�� ���� ���
	public static void customerReply(CustomerVO vo){
		SqlSession session = ssf.openSession();
		session.insert("CReply", vo);
		session.commit();
		session.close();
	}
	
	//�θ�� �����ϴ� ���
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