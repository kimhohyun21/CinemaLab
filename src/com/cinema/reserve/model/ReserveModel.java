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
		
		//오늘 날짜 얻기
		String today=new SimpleDateFormat("yyyy-M-d-E").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken(); 
		int year=Integer.parseInt(sy);   //년
		String sm=st.nextToken(); 
		int month=Integer.parseInt(sm);  //월
		String sd=st.nextToken(); 
		int day=Integer.parseInt(sd);    //일		
		String ss=st.nextToken();        //요일
		
		//오늘의 요일부터 7일까지만 배열에 넣어주기
		String[] strWeek={"일","월","화","수","목","금","토"}; //요일 배열
		String[] strWeek2={"","","","","","",""}; 		   //사용할 요일 배열
		for(int i=0; i<=6; i++){							   //오늘 요일을 비교하여 요일 배열에 넣기
			if(ss.equals(strWeek[i])){ 
				for(int a=0; a<=6; a++){
					strWeek2[a]=strWeek[i];
					i++;
					if(i==7)i=0;
				}
				break;
			}
		}
				
		//월별 마지막 날짜 지정
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31}; // 월별 마지막 날짜 배열 
		if((year%4==0 && year%100!=0)||(year%400==0)){       // 윤달에 따른 2월 마지막 날 설정
			lastDay[1]=29;
		}else{
			lastDay[1]=28;
		}		
		int lastDay2=lastDay[month-1];						// 해당 월의 마지막 날 값 지정
		
		//오늘 날짜부터 7일까지만 배열에 넣기
		int[] day7={0,0,0,0,0,0,0};							 // 날짜 배열	
		for(int j=0; j<=6; j++){							 		
			day7[j]=day;
			day++;
			if(day>lastDay2) day=1;
		}
		
		//날짜 출력을 위한 변수
		int z=0;
		
		//선택된 날짜 및 요일 값 받기
		String checkedYear=request.getParameter("checkedYear");
		if(checkedYear==null)checkedYear=sy; //선택이 없을 경우 초기값
		String checkedMonth=request.getParameter("checkedMonth");
		if(checkedMonth==null)checkedMonth=sm; //선택이 없을 경우 초기값
		String checkedDay=request.getParameter("checkedDay");
		if(checkedDay==null)checkedDay=sd; //선택이 없을 경우 초기값
		String checkedDay2=request.getParameter("checkedDay2");
		if(checkedDay2==null)checkedDay2=ss; //선택이 없을 경우 초기값
		
		//지역 리스트 받기 
		List<ReserveVO> localList=ReserveDAO.localData();
		
		//선택된 지역 값 받기
		String local=request.getParameter("local");
		if(local==null) local="서울";	 //선택이 없을 경우 초기값	
		//선택된 지역에 따른 극장 리스트 받기
		List<ReserveVO> theaterList=ReserveDAO.theaterData(local);
		
		//영화관 선택 값 받기
		String tname=request.getParameter("tname");
		if(tname==null) tname=theaterList.get(0).getTheater();	//선택이 없을 경우 초기값
		//영화관 선택에 따른 영화 리스트 받기
		List<ReserveVO> movieList=ReserveDAO.movieData(tname);
		
		//영화 선택값 받기
		String title=request.getParameter("title");
		if(title==null) title=movieList.get(0).getTitle();  //선택이 없을 경우 초기값	
		
		//영화관 및 영화 선택에 따른 영화 상영관 및 상영시간 받기
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=ReserveDAO.theaterNoData(map);
		List<ReserveVO> timeList=ReserveDAO.timeData(map);		
		
		//나머지 정보 값 받기 
		String grade=request.getParameter("grade");
		if(grade==null)grade=movieList.get(0).getGrade();
		String theaterNo=request.getParameter("theaterNo");
		String poster=request.getParameter("poster");
		if(poster==null)poster=movieList.get(0).getPoster();
		String payment=request.getParameter("payment");
		if(payment==null)payment="0";
		String movietime=request.getParameter("movietime");
		
		//Ajax 실행 구분 인자
		String rType=request.getParameter("rType");
		if(rType==null)rType="default";
		String movePage=null;
		if(rType.equals("default")){
			movePage="main/main.jsp";
		}else if(rType.equals("daycheck")){
			movePage="reserve/reserve1_Local.jsp";
		}else if(rType.equals("localcheck")){
			movePage="reserve/reserve1_Theater.jsp";
		}else if(rType.equals("theatercheck")){
			movePage="reserve/reserve1_MovieList.jsp";
		}else if(rType.equals("moviecheck")){
			movePage="reserve/reserve1_MovieTime.jsp";
		}else if(rType.equals("timecheck")){
			movePage="reserve/reserve1_Result.jsp";
		}		
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("strWeek2", strWeek2);
		request.setAttribute("day7", day7);
		request.setAttribute("z", z);
		request.setAttribute("checkedYear", checkedYear);
		request.setAttribute("checkedMonth", checkedMonth);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("localList", localList);
		request.setAttribute("local", local);
		request.setAttribute("theaterList", theaterList);
		request.setAttribute("tname", tname);
		request.setAttribute("movieList", movieList);
		request.setAttribute("title", title);
		request.setAttribute("theaterNo2", theaterNo2);
		request.setAttribute("timeList", timeList);
		request.setAttribute("grade", grade);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("poster", poster);
		request.setAttribute("payment", payment);
		request.setAttribute("movietime", movietime);
		
		request.setAttribute("jsp", "../reserve/reserve1.jsp");
	
		return movePage;
	}
}