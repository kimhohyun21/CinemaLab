package com.cinema.admin.dao;

import java.util.*;
import org.apache.ibatis.session.*;
import com.cinema.dao.*;
import com.cinema.reserve.dao.ReserveVO;

public class AdminDAO {
	
private static SqlSessionFactory ssf;
	
	static{
		ssf=CreateSqlSessionFactory.getSsf();
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
