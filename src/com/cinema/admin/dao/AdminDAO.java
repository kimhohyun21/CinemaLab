package com.cinema.admin.dao;

import java.util.ArrayList;
import java.util.List;

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
}
