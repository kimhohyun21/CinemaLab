package com.cinema.join.model;

import javax.servlet.http.HttpServletRequest;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.*;

@Controller
public class MemberJoinOkModel {
	
	@RequestMapping("join_ok.do") //ȸ�����
	public String join_ok(HttpServletRequest request){
		try{
			request.setCharacterEncoding("EUC-KR");
			String id=request.getParameter("id"); 
			String pwd=request.getParameter("pwd");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String birth=request.getParameter("birth");
			
			//��,���� ��� ���߱�  ex) 1984-11-29
			phone=phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			birth=birth.substring(0, 4)+"-"+birth.substring(4,6)+"-"+birth.substring(6,8);
						
			MemberVO vo=new MemberVO();
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setPhone(phone);
			vo.setBirth(birth);
			
			//�ѹ��� �ߺ�üũ
			int check=MemberDAO.memberOverlab(id);
			
			//�ߺ����������
			if(check==0){
				MemberDAO.memberInsert(vo);
				request.setAttribute("join", "���Լ���");			
			}else{
				//�ߺ��ϰ��
				request.setAttribute("join", "�ߺ�");
			}
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		request.setAttribute("jsp", "../login/login.jsp");

		return "main/main.jsp";
	}
}
