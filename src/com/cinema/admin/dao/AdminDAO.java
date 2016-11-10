package com.cinema.admin.dao;

import java.util.*;
import com.cinema.reserve.dao.ReserveVO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.cinema.dao.CreateSqlSessionFactory;
import com.cinema.movieList.dao.MovieVO;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<MovieVO> adminMovieAllList(){
		SqlSession session=ssf.openSession();		
		List<MovieVO> list=session.selectList("adminMovieAllList");
		session.close();
		
		return list;
	}
	
	public static List<ReserveListVO> reserveList(Map map){
		SqlSession session = ssf.openSession();
		List<ReserveListVO> list = session.selectList("RList", map);
		session.close();
		return list;
	}
	
	public static int reserveTotal() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("RTotal");
		session.close();
		
		return total;
		
	}
}
