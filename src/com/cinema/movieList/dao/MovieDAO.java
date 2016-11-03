package com.cinema.movieList.dao;

import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.CreateSqlSessionFactory;

public class MovieDAO {
	private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static List<MovieVO> getmovieList(int a){
		SqlSession session = ssf.openSession();
		System.out.println(a);
		List<MovieVO> list = session.selectList("caca",a);
		session.close();
		
		return list;
	}
	
	public static MovieVO getmoviedetail(int b){
		SqlSession session = ssf.openSession();
		System.out.println(b);
		MovieVO vo = session.selectOne("caca2",b);
		session.close();
		
		return vo;
	}
	
	public static List<MovieVO> getmoviecharacter(int b){
		SqlSession session = ssf.openSession();
		System.out.println(b);
		List<MovieVO> list = session.selectList("sasasa",b);
		session.close();
		
		return list;
	}
}
