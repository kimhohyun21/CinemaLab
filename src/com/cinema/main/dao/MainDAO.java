package com.cinema.main.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;

public class MainDAO {
	private static SqlSessionFactory ssf; //�����ϸ� db connection
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//��� �߰� ==> ���� �������� �ʿ��� ��ȭ ���� ��������
	
}
