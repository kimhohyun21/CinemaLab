package com.cinema.main.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;

public class MainDAO {
	private static SqlSessionFactory ssf; //�����ϸ� db connection
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//��� �߰� ==> ���� �������� �ʿ��� ��ȭ ���� ��������
	public static List<MainVO> getListData(Map map){
		SqlSession session=ssf.openSession();
		List<MainVO> list=session.selectList("getListData", map);
		session.close();
		
		return list;
	}
}
