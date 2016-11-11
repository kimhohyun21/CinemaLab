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
		List<MovieVO> list = session.selectList("Mlist",a);
		session.close();
		
		return list;
	}
	
	public static MovieVO getmoviedetail(int b){
		SqlSession session = ssf.openSession();
		System.out.println(b);
		MovieVO vo = session.selectOne("Mdetail",b);
		session.close();
		
		return vo;
	}
	
	public static List<MovieVO> getmoviecharacter(int b){
		SqlSession session = ssf.openSession();
		System.out.println(b);
		List<MovieVO> list = session.selectList("Mcharacter",b);
		session.close();
		
		return list;
	}
	
	//´ñ±Û
	public static List<MovieVO> getReplyData(Map map){
		SqlSession session=ssf.openSession();
		List<MovieVO> replyList=session.selectList("MReplyData",map);
		session.close();
		
		return replyList;
	}
	
	public static void replyInsert(MovieVO vo){
		SqlSession session=ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	
	public static int replyTotalPage(int mNo){
		SqlSession session=ssf.openSession();
		int totalpage=session.selectOne("replyTotalPage",mNo);
		session.close();
		
		return totalpage;
	}
	
	public static int replyCount(int mNo){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("replyCount",mNo);
		session.close();
		
		return count;
	}
	
	public static void replyDelete(int reNo){
		SqlSession session=ssf.openSession();
		session.delete("replyDelete",reNo);
		session.commit();
		session.close();
	}
	
	public static int replyTotalScore(int mNo){
		SqlSession session=ssf.openSession();
		int totalScore=session.selectOne("replyTotalScore", mNo);
		session.close();
		
		return totalScore;
	}
	
	public static void movieLikeUpdate(Map map){
		SqlSession session=ssf.openSession();
		session.update("movieLikeUpdate", map);
		session.commit();
		session.close();
	}
}





















