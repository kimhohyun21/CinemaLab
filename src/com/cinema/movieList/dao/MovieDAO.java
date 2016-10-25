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
		System.out.println(a+"요기");
		List<MovieVO> list = session.selectList("caca",a);
		session.close();
		
		return list;
	}
	
	public static MovieVO getmoviedetail(int a){
		SqlSession session = ssf.openSession();
		System.out.println(a+"요기");
		MovieVO vo = session.selectOne("caca2",a);
		session.close();
		
		return vo;
	}
}
