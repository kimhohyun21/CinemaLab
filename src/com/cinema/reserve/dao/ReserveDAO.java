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
	
	public static List<ReserveVO> movieData(String tname){
		SqlSession session=ssf.openSession();
		List<ReserveVO> movieList=session.selectList("movieData", tname);
		//System.out.println(tname);
		session.close();
		return movieList;
	}
	
	public static List<ReserveVO> timeData(String title){
		SqlSession session=ssf.openSession();
		List<ReserveVO> timeList=session.selectList("timeData", title);
		System.out.println("3."+title);
		session.close();
		return timeList;
	}
}
