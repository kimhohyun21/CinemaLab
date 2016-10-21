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
	public String main(HttpServletRequest request){
		
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
		
		//int total=(year-1)*365+(year-1)/4-(year-1)/100+(year-1)/400;
	
		int z=0;
		
		String checkedDay=request.getParameter("checkedDay");
		String checkedDay2=request.getParameter("checkedDay2");
		
		//극장 선택
		String local=request.getParameter("local");
		String[] aList={"신도림","영등포","홍대입구"};
		String[] bList={"수원","안산","용인"};
		String[] cList={"검단","부평","인천"};
		String[] dList={"상인","성서","율하"};
		String[] eList={"부산","서면","해운대"};
		if(local==null){
			local="서울";
		}
		if(local.equals("서울")){
			request.setAttribute("aList", aList);
		}
		else if(local.equals("경기")){
			request.setAttribute("bList", bList);
		}
		else if(local.equals("인천")){
			request.setAttribute("cList", cList);
		}
		else if(local.equals("대구")){
			request.setAttribute("dList", dList);
		}
		else if(local.equals("부산")){
			request.setAttribute("eList", eList);
		}
		
		//영화 선택
		String tname=request.getParameter("tname");
		if(tname==null) tname=" ";
		List<ReserveVO> movieList=ReserveDAO.movieData(tname);
		
		//영화 상영 시간
		String title=request.getParameter("title");
		if(title==null) title=" ";
		
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		List<ReserveVO> timeList=ReserveDAO.timeData(map);
		
		String grade=request.getParameter("grade");
		String theaterNo=request.getParameter("theaterNo");
		String movietime=request.getParameter("movietime");
		
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
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
	
		return "reserve/reserve1.jsp";
	}
}
















































