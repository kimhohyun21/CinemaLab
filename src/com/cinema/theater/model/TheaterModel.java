package com.cinema.theater.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.reserve.dao.ReserveDAO;
import com.cinema.reserve.dao.ReserveVO;
import com.cinema.theater.dao.*;

@Controller
public class TheaterModel {
	@RequestMapping("theater.do")
	public String main(HttpServletRequest request){
		
		//���� ����
		String local = request.getParameter("local");
		if (local == null)
			local = "����";
	
		List<TheaterVO> localList = TheaterDAO.localData2();
		
		//���� ����
		List<TheaterVO> theaterList=TheaterDAO.theaterData2(local);
		
		//���� ����
		String theater=request.getParameter("theater");
		if(theater==null && local.equals("����")) theater="�ŵ���";
		if(theater==null && local.equals("���")) theater="����";
		if(theater==null && local.equals("��õ")) theater="�˴�";
		if(theater==null && local.equals("�뱸")) theater="����";
		if(theater==null && local.equals("�λ�")) theater="�ؿ��";
		int num=(int) (Math.random()*4+1);
		
		//��¥ ���
		int i, j, a, b;
		int[] day7 = { 0, 0, 0, 0, 0, 0, 0 };
		String[] strWeek2 = { "", "", "", "", "", "", "" };
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d-E");
		String today = sdf.format(date);

		StringTokenizer st = new StringTokenizer(today, "-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken();
		String ss = st.nextToken();

		int[] lastDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int lastDay2;

		int year = Integer.parseInt(sy);
		int month = Integer.parseInt(sm);
		int day = Integer.parseInt(sd);
		int day2 = day;

		// ������ ���Ϻ��� 7�ϱ����� �ٸ� �迭�� �־��ֱ�
		String[] strWeek = { "��", "��", "ȭ", "��", "��", "��", "��" };
		for (i = 0; i <= 6; i++) {
			if (ss.equals(strWeek[i])) {
				break;
			}
		}

		for (b = 0; b <= 6; b++) {
			strWeek2[b] = strWeek[i];
			i++;
			if (i == 7) {
				i = 0;
			}
		}

		// ������ �Ϻ��� 7�ϱ����� �ٸ� �迭�� ���� �־��ֱ�
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
			lastDay[1] = 29;
		else
			lastDay[1] = 28;

		a = 0;
		while (a == month - 1) {
			a++;
		}
		lastDay2 = lastDay[a];

		for (j = 0; j <= 6; j++) {
			day7[j] = day2;
			day2++;
			if (day2 > lastDay2)
				day2 = 1;
		}
		int z = 0;

		String checkedDay = request.getParameter("checkedDay");
		String checkedDay2 = request.getParameter("checkedDay2");
		
		//��ȭ ����
		List<TheaterVO> movieList = TheaterDAO.movieData2(theater);
		
		//��ȭ �� �ð� ����
		String title=request.getParameter("title");

		if(title==null) title="����Ǯ Deadpool";
				
		// ��ȭ �� �ð� �� �󿵰�
		List<TheaterVO> movieList2=new ArrayList<>();
		for(TheaterVO vo : movieList){
			title=vo.getTitle();
			Map map = new HashMap();
			map.put("theater", theater);
			map.put("title", title);
			List<TheaterVO> timeList = TheaterDAO.timeData2(map);
			int theaterNo2 = TheaterDAO.theaterNoData2(map);
				
			vo.setTheaterNo(theaterNo2);
			vo.setTimeList(timeList);	
			
			movieList2.add(vo);
		}
		
		String grade = request.getParameter("grade");
		String theaterNo = request.getParameter("theaterNo");
		String movietime = request.getParameter("movietime");
		String click=request.getParameter("click");
		
		request.setAttribute("click", click);
		request.setAttribute("movieList", movieList);
		request.setAttribute("movieList2", movieList2);
		request.setAttribute("movietime", movietime);
		request.setAttribute("theaterNo", theaterNo);
		request.setAttribute("grade", grade);
		request.setAttribute("title", title);
		request.setAttribute("theater", theater);
		request.setAttribute("num", num);
		request.setAttribute("local", local);
		request.setAttribute("localList", localList);
		request.setAttribute("theaterList", theaterList);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("checkedDay", checkedDay);
		request.setAttribute("checkedDay2", checkedDay2);
		request.setAttribute("z", z);
		request.setAttribute("strWeek2", strWeek2);
		request.setAttribute("day7", day7);
		request.setAttribute("day", day);
		request.setAttribute("jsp", "../theater/theater.jsp");
		
		return "main/main.jsp";
	}
}
