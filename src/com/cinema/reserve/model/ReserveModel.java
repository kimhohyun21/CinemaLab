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
		
		//��¥ ���
		int i,j,a;
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
		
		int year=Integer.parseInt(sy);
		int month=Integer.parseInt(sm);
		int day=Integer.parseInt(sd);
		
		String[] strWeek={"��","��","ȭ","��","��","��","��"};
		for(i=0; i<=6; i++){
			if(ss.equals(strWeek[i])){
				break;
			}	
		}
		for(int b=0; b<=6; b++){
			strWeek2[b]=strWeek[i];
			i++;
			if(i==7){
				i=0;
			}
		}
		for(j=0; j<=6; j++){
			day7[j]=day;
			day++;
		}
		int total=(year-1)*365+(year-1)/4-(year-1)/100+(year-1)/400;
		
		if((year%4==0 && year%100!=0)||(year%400==0))
			lastDay[1]=29;
		else
			lastDay[1]=28;
		
		for(a=0; a<month-1; a++){
			total+=lastDay[a];
		}
		total++;
		
		int week=total%7;
		int z=0;
		
		//���� ����
		String local=request.getParameter("local");
		String[] aList={"�ŵ���","������","ȫ���Ա�"};
		String[] bList={"����","�Ȼ�","����"};
		String[] cList={"�˴�","����","��õ"};
		String[] dList={"����","����","����"};
		String[] eList={"�λ�","����","�ؿ��"};
		if(local==null){
			local="����";
		}
		if(local.equals("����")){
			request.setAttribute("aList", aList);
		}
		else if(local.equals("���")){
			request.setAttribute("bList", bList);
		}
		else if(local.equals("��õ")){
			request.setAttribute("cList", cList);
		}
		else if(local.equals("�뱸")){
			request.setAttribute("dList", dList);
		}
		else if(local.equals("�λ�")){
			request.setAttribute("eList", eList);
		}
		
		//��ȭ ����
		String tname=request.getParameter("tname");
		if(tname==null) tname=" ";
		System.out.println("1."+tname);
		List<ReserveVO> movieList=ReserveDAO.movieData(tname);
		/*for(ReserveVO vo:movieList){
			System.out.println("4."+vo.getTitle());
		}*/
		
		//��ȭ �� �ð�
		String title=request.getParameter("title");
		if(title==null) title=" ";
		System.out.println("2."+title);
		List<ReserveVO> timeList=ReserveDAO.timeData(title);
		System.out.println(timeList==null);
		for(ReserveVO vo:timeList){
			System.out.println("4."+vo.getMovietime());
		}
		
	
		request.setAttribute("z", z);
		request.setAttribute("local", local);
		request.setAttribute("tname", tname);
		request.setAttribute("title", title);
		request.setAttribute("strWeek2", strWeek2);
		request.setAttribute("day7", day7);
		request.setAttribute("lastDay", lastDay);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("total", total);
		request.setAttribute("week", week);
		request.setAttribute("movieList", movieList);
		request.setAttribute("timeList", timeList);
	
		return "reserve/reserve1.jsp";
	}
}
















































