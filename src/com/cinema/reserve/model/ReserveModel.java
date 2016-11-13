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
		
		//���� ��¥ ���
		String today=new SimpleDateFormat("yyyy-M-d-E").format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String sy=st.nextToken(); 
		int year=Integer.parseInt(sy);   //��
		String sm=st.nextToken(); 
		int month=Integer.parseInt(sm);  //��
		String sd=st.nextToken(); 
		int day=Integer.parseInt(sd);    //��		
		String ss=st.nextToken();        //����
		
		//������ ���Ϻ��� 7�ϱ����� �迭�� �־��ֱ�
		String[] strWeek={"��","��","ȭ","��","��","��","��"}; //���� �迭
		String[] strWeek2={"","","","","","",""}; 		   //����� ���� �迭
		for(int i=0; i<=6; i++){							   //���� ������ ���Ͽ� ���� �迭�� �ֱ�
			if(ss.equals(strWeek[i])){ 
				for(int a=0; a<=6; a++){
					strWeek2[a]=strWeek[i];
					i++;
					if(i==7)i=0;
				}
				break;
			}
		}
				
		//���� ������ ��¥ ����
		int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31}; // ���� ������ ��¥ �迭 
		if((year%4==0 && year%100!=0)||(year%400==0)){       // ���޿� ���� 2�� ������ �� ����
			lastDay[1]=29;
		}else{
			lastDay[1]=28;
		}		
		int lastDay2=lastDay[month-1];						// �ش� ���� ������ �� �� ����
		
		//���� ��¥���� 7�ϱ����� �迭�� �ֱ�
		int[] day7={0,0,0,0,0,0,0};							 // ��¥ �迭	
		for(int j=0; j<=6; j++){							 		
			day7[j]=day;
			day++;
			if(day>lastDay2) day=1;
		}
		
		//��¥ ����� ���� ����
		int z=0;
		
		//���õ� ��¥ �� ���� �� �ޱ�
		String checkedDay=request.getParameter("checkedDay");
		if(checkedDay==null)checkedDay=sd; //������ ���� ��� �ʱⰪ
		String checkedDay2=request.getParameter("checkedDay2");
		if(checkedDay2==null)checkedDay2=ss; //������ ���� ��� �ʱⰪ
		
		//���� ����Ʈ �ޱ� 
		List<ReserveVO> localList=ReserveDAO.localData();
		
		//���õ� ���� �� �ޱ�
		String local=request.getParameter("local");
		if(local==null) local="����";	 //������ ���� ��� �ʱⰪ	
		//���õ� ������ ���� ���� ����Ʈ �ޱ�
		List<ReserveVO> theaterList=ReserveDAO.theaterData(local);
		
		//��ȭ�� ���� �� �ޱ�
		String tname=request.getParameter("tname");
		if(tname==null) tname="�ŵ���"; //������ ���� ��� �ʱⰪ	
		if(local=="���") tname="����";  //������ �ʱⰪ	
		if(local=="��õ") tname="�˴�";  //������ �ʱⰪ	
		if(local=="�뱸") tname="����";  //������ �ʱⰪ	
		if(local=="�λ�") tname="�ؿ��"; //������ �ʱⰪ		
		//��ȭ�� ���ÿ� ���� ��ȭ ����Ʈ �ޱ�
		List<ReserveVO> movieList=ReserveDAO.movieData(tname);
		
		//��ȭ ���ð� �ޱ�
		String title=request.getParameter("title");
		if(title==null) title="���� ��Ʈ������";  //������ ���� ��� �ʱⰪ		
		//��ȭ�� �� ��ȭ ���ÿ� ���� ��ȭ �󿵰� �� �󿵽ð� �ޱ�
		Map map=new HashMap();
		map.put("tname", tname);
		map.put("title", title);
		int theaterNo2=ReserveDAO.theaterNoData(map);
		List<ReserveVO> timeList=ReserveDAO.timeData(map);		
		
		//������ ���� �� �ޱ� 
		String grade=request.getParameter("grade");
		if(grade==null)grade="12";
		String theaterNo=request.getParameter("theaterNo");
		if(theaterNo==null)theaterNo="1";
		String poster=request.getParameter("poster");
		if(poster==null)poster="http://movie.phinf.naver.net/20161014_50/147640824152266AVn_JPEG/movie_image.jpg";
		String payment=request.getParameter("payment");
		if(payment==null)payment="0";
		String movietime=request.getParameter("movietime");
		
		//���� ������ �ּ� ȹ��
		String url=request.getHeader("referer");
		
		request.setAttribute("url", url);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("strWeek2", strWeek2);
		request.setAttribute("day7", day7);
		request.setAttribute("z", z);
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
		request.setAttribute("jsp2", "../reserve/reserve1_Local.jsp");
		request.setAttribute("jsp3", "../reserve/reserve1_Theater.jsp");
		request.setAttribute("jsp4", "../reserve/reserve1_MovieList.jsp");
		request.setAttribute("jsp5", "../reserve/reserve1_MovieTime.jsp");
		request.setAttribute("jsp6", "../reserve/reserve1_Result.jsp");
	
		return "main/main.jsp";
	}
}