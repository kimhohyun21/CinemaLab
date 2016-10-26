package com.cinema.reserve.dao;

import java.util.List;
import java.util.Map;

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
		session.close();
		return movieList;
	}
	
	public static List<ReserveVO> timeData(Map map){
		SqlSession session=ssf.openSession();
		List<ReserveVO> timeList=session.selectList("timeData", map);
		session.close();
		return timeList;
	}
	
	public static List<ReserveVO> localData(){
		SqlSession session=ssf.openSession();
		List<ReserveVO> localList=session.selectList("localData");
		session.close();
		return localList;
	}
	
	public static List<ReserveVO> theaterData(String local){
		SqlSession session=ssf.openSession();
		List<ReserveVO> theaterList=session.selectList("theaterData",local);
		session.close();
		return theaterList;
	}
}

