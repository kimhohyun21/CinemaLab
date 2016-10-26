package com.cinema.controller;

import java.io.*;
import java.lang.reflect.Method;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<String> clsList=new ArrayList<>();
 
	@Override
	public void init(ServletConfig config) throws ServletException {
		String path=config.getInitParameter("contextConfigLocation");
		FileConfig fc=new FileConfig(path);
		clsList=fc.componentScan();
	}
	
	//login.do 요청
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getRequestURI();
		//==> http://localhost:8080/CinemaLab/login.do
		System.out.println(cmd);
		cmd=cmd.substring(request.getContextPath().length()+1);
		//==> login.do
		
		//?파라미터 값 구분
		String temp=cmd.substring(cmd.lastIndexOf(".")+1);
		if(!temp.equals("do") && !temp.equals("jsp")){
			cmd=cmd.substring(0, cmd.lastIndexOf("?"));
		}
		
		try{
			for(String strCls : clsList){
				Class clsName=Class.forName(strCls);
				if(clsName.isAnnotationPresent(Controller.class)==false){
					continue;
				}
				Object obj=clsName.newInstance();
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m: methods){
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(cmd.equals(rm.value())){
						String jsp=(String) m.invoke(obj, request);
						
						RequestDispatcher rd=request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}