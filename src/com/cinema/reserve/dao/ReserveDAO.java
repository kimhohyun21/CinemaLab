package com.cinema.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;

public class ReserveDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ReserveVO> movieData(String name){
		SqlSession session=ssf.openSession();
		List<ReserveVO> movieList=session.selectOne("movieData", name);
		session.close();
		return movieList;
	}
}
