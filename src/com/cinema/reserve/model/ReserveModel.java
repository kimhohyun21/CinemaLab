package com.cinema.reserve.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ReserveModel {
	@RequestMapping("reserve.do")
	public String reserve(HttpServletRequest request){
		
		//날짜 계산
		int i,j,a,b;
		int[] day7={0,0,0,0,0,0,0};
		String[] strWeek2={"","","","","","",""};
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d-E");
		String today=sdf.format(date);
		
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken();
		String sm=st.nextToken();
		String sd=st.nextToken();
		String ss=st.nextToken();
		
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31};
		int lastDay2;
		
		int year=Integer.parseInt(sy);
		int month=Integer.parseInt(sm);
		int day=Integer.parseInt(sd);
		int day2=day;
		
		//오늘의 요일부터 7일까지만 다른 배열에 넣어주기
		String[] strWeek={"일","월","화","수","목","금","토"};
		for(i=0; i<=6; i++){
			if(ss.equals(strWeek[i])){
				break;
			}	
		}
		
		for(b=0; b<=6; b++){
			strWeek2[b]=strWeek[i];
			i++;
			if(i==7){
				i=0;
			}
		}
		
		//오늘의 일부터 7일까지만 다른 배열에 따로 넣어주기
		if((year%4==0 && year%100!=0)||(year%400==0))
			lastDay[1]=29;
		else
			lastDay[1]=28;
		
		a=0;
		while(a==month-1){
			a++;
		}
		lastDay2=lastDay[a];
		
		for(j=0; j<=6; j++){
			day7[j]=day2;
			day2++;
			if(day2>lastDay2) day2=1;
		}
		int z=0;
		
		String checkedDay=request.getParameter("checkedDay");
		if(checkedDay==null)checkedDay=sd;
		String checkedDay2=request.getParameter("checkedDay2");
		if(checkedDay2==null)checkedDay2=ss;
		
		//지역 선택
		String local=request.getParameter("local");
		if(local==null) local="서울";
		List<ReserveVO> localList=ReserveDAO.localData();
		
		//극장 선택
		List<ReserveVO> theaterList=ReserveDAO.theaterData(local);
			
		//영화 선택
		String tname=request.getParameter("tname");
		if(tname==null) tname="신도림";
		if(local=="경기") tname="용인";
		if(local=="인천") tname="검단";
		if(local=="대구") tname="율하";
		if(local=="부산") tname="해운대";
		List<ReserveVO> movieList=ReserveDAO.movieData(tname);
		
		//영화 상영 시간 선택
		String title=request.getParameter("title");

		if(title==null) title="닥터 스트레인지";
		
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		List<ReserveVO> timeList=ReserveDAO.timeData(map);
		
		int theaterNo2=ReserveDAO.theaterNoData(map);
		
		String grade=request.getParameter("grade");
		if(grade==null)grade="12";
		String theaterNo=request.getParameter("theaterNo");
		String movietime=request.getParameter("movietime");
		String click=request.getParameter("click");
		String poster=request.getParameter("poster");
		if(poster==null)poster="http://movie.phinf.naver.net/20161014_50/147640824152266AVn_JPEG/movie_image.jpg";
		
		request.setAttribute("click", click);
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
		request.setAttribute("poster", poster);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("movietime", movietime);
		request.setAttribute("tname", tname);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("z", z);
		request.setAttribute("local", local);
		request.setAttribute("strWeek2", strWeek2);
		request.setAttribute("day7", day7);
		request.setAttribute("day", day);
		request.setAttribute("movieList", movieList);
		request.setAttribute("timeList", timeList);
		request.setAttribute("localList", localList);
		request.setAttribute("theaterList", theaterList);
		request.setAttribute("theaterNo2", theaterNo2);
		request.setAttribute("jsp", "../reserve/reserve1.jsp");
	
		return "main/main.jsp";
	}
}