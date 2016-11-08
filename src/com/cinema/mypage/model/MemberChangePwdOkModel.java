package com.cinema.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cinema.controller.Controller;
import com.cinema.controller.RequestMapping;
import com.cinema.member.dao.MemberDAO;
import com.cinema.member.dao.MemberVO;

@Controller
public class MemberChangePwdOkModel {
	@RequestMapping("changepwd_ok.do")
	public String ChangePwdOk(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		String strno=request.getParameter("no");		
		int no=Integer.parseInt(strno);
		MemberVO vo=MemberDAO.memberGetAllImfor(no);
		//�Է°� ��������
		String pwd = request.getParameter("pwd");
		
		// DB�� ��������
		String db_pwd = vo.getPwd();				
		System.out.println(pwd+"@@@@"+db_pwd);
		boolean pCheck = false;
		
		if (db_pwd.equals(pwd)) {
			pCheck = true;			
			// @@@@@@@@�̰žȵȴ� �½ľ�
			String change_pwd=request.getParameter("change_pwd");
			vo.setNo(no);
			vo.setPwd(change_pwd);
			System.out.println(vo.getPwd()+" ---- ���Դϴ�");
			MemberDAO.memberChangePwd(vo);
		} else {
			pCheck = false;
		}
		request.setAttribute("pCheck", pCheck);

		return "mypage/change_pwd_ok.jsp";
	}
}