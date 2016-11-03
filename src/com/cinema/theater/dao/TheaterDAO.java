package com.cinema.theater.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;
import com.cinema.reserve.dao.ReserveVO;

public class TheaterDAO {
private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<TheaterVO> localData2(){
		SqlSession session=ssf.openSession();
		List<TheaterVO> localList=session.selectList("localData2");
		session.close();
		return localList;
	}
	
	public static List<TheaterVO> theaterData2(String local){
		SqlSession session=ssf.openSession();
		List<TheaterVO> theaterList=session.selectList("theaterData2",local);
		session.close();
		return theaterList;
	}
	
	public static List<TheaterVO> movieData2(String theater){
		SqlSession session=ssf.openSession();
		List<TheaterVO> movieList=session.selectList("movieData2", theater);
		session.close();
		return movieList;
	}
	
	public static List<TheaterVO> timeData2(Map map){
		SqlSession session=ssf.openSession();
		List<TheaterVO> timeList=session.selectList("timeData2", map);
		session.close();
		return timeList;
	}
	
	public static int theaterNoData2(Map map){
		SqlSession session=ssf.openSession();
		int theaterNo2=session.selectOne("theaterNoData2",map);
		session.close();
		return theaterNo2;
	}
}
