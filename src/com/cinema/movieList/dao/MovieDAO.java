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
	
	//´ñ±Û Ãâ·Â
	public static List<MovieVO> getReplyData(Map map){
		SqlSession session=ssf.openSession();
		List<MovieVO> replyList=session.selectList("getReplyData",map);
		session.close();
		
		return replyList;
	}
	
	//´ñ±Û »ðÀÔ
	public static void replyInsert(MovieVO vo){
		SqlSession session=ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	
	//´ñ±Û ÃÑ ÆäÀÌÁö
	public static int replyTotalPage(int mNo){
		SqlSession session=ssf.openSession();
		int totalpage=session.selectOne("replyTotalPage",mNo);
		session.close();
		
		return totalpage;
	}
	
	//ÃÑ ´ñ±Û Ä«¿îÆ®
	public static int replyCount(int mNo){
		SqlSession session=ssf.openSession();
		int count=session.selectOne("replyCount",mNo);
		session.close();
		
		return count;
	}
	
	//´ñ±Û »èÁ¦
	public static void replyDelete(int reNo){
		SqlSession session=ssf.openSession();
		session.delete("replyDelete",reNo);
		session.commit();
		session.close();
	}
	
	//´ñ±Û ÃÑÆòÁ¡
	public static int replyTotalScore(int mNo){
		SqlSession session=ssf.openSession();
		int totalScore=session.selectOne("replyTotalScore", mNo);
		session.close();
		
		return totalScore;
	}
	
	//´ñ±Û ÆòÁ¡ ¾÷µ¥ÀÌÆ®
	public static void movieLikeUpdate(Map map){
		SqlSession session=ssf.openSession();
		session.update("movieLikeUpdate", map);
		session.commit();
		session.close();
	}
	
	public static int replyRecordCheck(Map map){
		SqlSession session=ssf.openSession();
		//ÇØ´ç ¿µÈ­¿¡ ´ñ±Û ÀÛ¼ºÇÑÀû ÀÖÀ¸¸é
		int count=session.selectOne("replyRecordCheck",map);
		System.out.println("Ã¼Å©"+count);
		//ÇØ´ç ¿µÈ­¿¡ ´ñ±Û ÀÛ¼ºÇÑ Àû ¾øÀ¸¸é
		session.close();
		
		return count;
	}
}





















