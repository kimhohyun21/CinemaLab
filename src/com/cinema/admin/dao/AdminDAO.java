package com.cinema.admin.dao;

import java.util.*;
import com.cinema.reserve.dao.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.*;
import com.cinema.movieList.dao.*;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<MovieVO> adminMovieAllList(){
		SqlSession session=ssf.openSession();		
		List<MovieVO> list=session.selectList("AMovieAllList");
		session.close();
		
		return list;
	}
	
	
	//예매 리스트 불러오기
	public static List<ReserveListVO> reserveList(Map map){
		SqlSession session = ssf.openSession();
		List<ReserveListVO> list = session.selectList("RList", map);
		session.close();
		return list;
	}
	
	//총 페이지 수 불러오기
	public static int reserveTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("RTotal");
		session.close();
		
		return total;
	}
	
	//예매 내역 컨텐츠 불러오기
	public static ReserveListVO reserveContent(int no){
		SqlSession session = ssf.openSession();
		ReserveListVO vo = session.selectOne("RContent",no);
		session.close();

		return vo;
	}
	
	
	public static MovieVO adminMovieData(int no){
		SqlSession session = ssf.openSession();
		MovieVO vo=session.selectOne("AMovieData",no);
		session.close();
		return vo;
	}
	
	public static void adminMovieModify(MovieVO vo){
		SqlSession session = ssf.openSession();
		session.update("AMovieModify",vo);
		session.commit();
		session.close();
	}
	
	public static void adminMovieInsert(MovieVO vo){
		SqlSession session= ssf.openSession();
		session.insert("AMovieInsert",vo);
		session.commit();
		session.close();
	}
	
	public static int adminMovieCount(){
		SqlSession session = ssf.openSession();
		int count=session.selectOne("AMovieCount");
		session.close();
		return count;
	}
}
