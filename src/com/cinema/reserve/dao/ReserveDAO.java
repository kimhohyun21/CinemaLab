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
	
	public static int theaterNoData(Map map){
		SqlSession session=ssf.openSession();
		int theaterNo2=session.selectOne("theaterNoData",map);
		session.close();
		return theaterNo2;
	}
	
	public static List<ReserveVO> reserveData(Map map){
		SqlSession session=ssf.openSession();
		List<ReserveVO> rlist=session.selectList("reserveData",map);
		session.close();
		return rlist;
	}
	
	public static int getTno(Map map){
		SqlSession session=ssf.openSession();
		int tno=session.selectOne("getTno", map);
		session.close();
		
		return tno;
	}
	
	public static void regReserve(Map map){
		SqlSession session=ssf.openSession();
		session.insert("regReserve", map);
		session.commit();
		session.close();
	}
	
	public static int getTotalReserve(){
		SqlSession session=ssf.openSession();
		int totalReserve=session.selectOne("getTotalReserve");
		session.close();
		
		return totalReserve;
	}
	
	public static int getReserveNum(String title){
		SqlSession session=ssf.openSession();
		int reserveNum=session.selectOne("getReserveNum", title);
		session.close();
		
		return reserveNum;
	}
	
	public static void updateRank(Map map){
		SqlSession session=ssf.openSession();
		session.update("updateRank", map);
		session.commit();
		session.close();
	}
	
	public static ReserveVO getReserveData(int rNo){
		SqlSession session=ssf.openSession();
		ReserveVO vo=session.selectOne("getReserveData", rNo);
		session.close();
		
		return vo;
	}
	
	public static void updateCancel(int rNo){
		SqlSession session=ssf.openSession();
		session.update("updateCancel", rNo);
		session.commit();
		session.close();
	}
}
















