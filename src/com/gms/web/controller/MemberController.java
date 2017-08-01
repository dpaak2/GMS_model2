package com.gms.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.util.DispatcherSevlet;


@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("$$$$$$$$$$$$member Controller ==== do get 진입");
		String action=request.getParameter("action");
		System.out.println("member controller action: "+action);
		switch (action) {
		case "move": 
			System.out.println("======move 진입");
			System.out.println("member Controller action: "+action);
			DispatcherSevlet.send(request, response);
			break;
		
		case "login":
			System.out.println("login controller==========");
			DispatcherSevlet.send(request, response);
			break;
			
		case "list":
			System.out.println("list controller==========");
			DispatcherSevlet.send(request, response);
			break;
			
		case"add":
			System.out.println("controller update 진입");
			DispatcherSevlet.send(request, response);
			break;
			
		case"delete":
			System.out.println("controller delete 진입");
			break;
			
		case"detail":
			System.out.println("controller detail 진입");
			break;
			
		case"update":
			System.out.println("controller update 진입");
			break;
		}
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("$$$$$$$$$$$$member controller ======== do post 진입");
	}

}
