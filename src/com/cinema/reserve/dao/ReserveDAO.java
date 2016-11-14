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
	
	//지역 리스트 받아오기
	public static List<ReserveVO> localData(){
		SqlSession session=ssf.openSession();
		List<ReserveVO> localList=session.selectList("localData");
		session.close();
		return localList;
	}
	
	//지역별 영화관 정보 가져오기
	public static List<ReserveVO> theaterData(String local){
		SqlSession session=ssf.openSession();
		List<ReserveVO> theaterList=session.selectList("theaterData",local);
		session.close();
		return theaterList;
	}	
	
	//영화관별 영화 정보 가져오기
	public static List<ReserveVO> movieData(String tname){
		SqlSession session=ssf.openSession();
		List<ReserveVO> movieList=session.selectList("movieData", tname);
		session.close();
		return movieList;
	}
	
	//영화별 상영관 정보 가져오기
	public static int theaterNoData(Map map){
		SqlSession session=ssf.openSession();
		int theaterNo2=session.selectOne("theaterNoData",map);
		session.close();
		return theaterNo2;
	}
	
	//영화별 상영시간 정보 가져오기
	public static List<ReserveVO> timeData(Map map){
		SqlSession session=ssf.openSession();
		List<ReserveVO> timeList=session.selectList("timeData", map);
		session.close();
		return timeList;
	}
	
	//예약된 좌석번호 가져오기
	public static List<ReserveVO> reserveData(Map map){
		SqlSession session=ssf.openSession();
		List<ReserveVO> rlist=session.selectList("reserveData",map);
		session.close();
		return rlist;
	}
	
	//상영관 번호 가져오기
	public static int getTno(Map map){
		SqlSession session=ssf.openSession();
		int tno=session.selectOne("getTno", map);
		session.close();
		
		return tno;
	}
	
	//예매 데이터 업데이트
	public static void regReserve(Map map){
		SqlSession session=ssf.openSession();
		session.insert("regReserve", map);
		session.commit();
		session.close();
	}
	
	//전체 예매 수 가져오기
	public static int getTotalReserve(){
		SqlSession session=ssf.openSession();
		int totalReserve=session.selectOne("getTotalReserve");
		session.close();
		
		return totalReserve;
	}
	
	//특정 영화의 예매 수 가져오기
	public static int getReserveNum(String title){
		SqlSession session=ssf.openSession();
		int reserveNum=session.selectOne("getReserveNum", title);
		session.close();
		
		return reserveNum;
	}
	
	//예매율 업데이트
	public static void updateRank(Map map){
		SqlSession session=ssf.openSession();
		session.update("updateRank", map);
		session.commit();
		session.close();
	}
	
	//취소 정보 가져오기
	public static ReserveVO getReserveData(int rNo){
		SqlSession session=ssf.openSession();
		ReserveVO vo=session.selectOne("getReserveData", rNo);
		session.close();
		
		return vo;
	}	

	//예약 번호 가져오기
	public static int getRno(String pid){
		SqlSession session=ssf.openSession();
		int rNo=session.selectOne("getRno", pid);
		session.close();
		
		return rNo;
	}
	
	//취소 정보 업데이트
	public static void updateCancel(int rNo){
		SqlSession session=ssf.openSession();
		session.update("updateCancel", rNo);
		session.commit();
		session.close();
	}
}
















