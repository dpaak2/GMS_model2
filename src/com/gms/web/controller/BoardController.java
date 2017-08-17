package com.gms.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.util.DispatcherSevlet;
import com.gms.web.util.Separator;
@WebServlet("/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("@@@@@@@@@@@@@@ BoardController do get 진입");
		String action=request.getParameter("action");
		System.out.println("BoardController action: "+action);
		Separator.init(request);
		switch (action) {
		case "move": 
			System.out.println("======  진입");
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
}
