package com.gms.web.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.constant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherSevlet;
import com.gms.web.util.Separator;



@WebServlet("/common.do")
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("^^^^^^^^^^CommonController do get 진입");
		Separator.init(request);
		MemberBean memberBean=null;
		
		switch (request.getParameter(Action.CMD)) {
		case Action.MOVE:
			DispatcherSevlet.send(request, response);
			break;
			
		case Action.LOGIN:
			memberBean=new MemberBean();
			MemberService service= MemberServiceImpl.getInstance();
			memberBean.setId(request.getParameter("id"));
			memberBean.setPw(request.getParameter("pass"));
			System.out.println("requested id & pass form JSP::: id= "+memberBean.getId()+" pass= "+memberBean.getPw());
			String page=service.login(memberBean);
			System.out.println("page :::: "+page);
			Separator.cmd.setPage(page);
			Separator.cmd.process();
			DispatcherSevlet.send(request, response);
			break;
			
		default:break;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("^^^^^^^^^^CommonController do post 진입");
	}

}
