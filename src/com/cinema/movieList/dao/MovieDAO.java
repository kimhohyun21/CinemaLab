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
		System.out.println(a+"¿ä±â");
		List<MovieVO> list = session.selectList("caca",a);
		session.close();
		
		return list;
	}
	
}
