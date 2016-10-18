package com.cinema.main.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;

public class MainDAO {
	private static SqlSessionFactory ssf; //생성하면 db connection
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	//기능 추가 ==> 메인 페이지에 필요한 영화 정보 가져오기
	public static List<MainVO> getListData(Map map){
		SqlSession session=ssf.openSession();
		List<MainVO> list=session.selectList("getListData", map);
		session.close();
		
		return list;
	}
}
