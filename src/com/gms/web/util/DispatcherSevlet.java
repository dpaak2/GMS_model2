package com.gms.web.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherSevlet {
	public static void send(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String action=request.getParameter("action");
		System.out.println("DispatcherSevlet action: "+action);
		String page=request.getParameter("page");
		System.out.println("DispatcherSevlet page: "+page);
		String dest="/WEB-INF/view"+Separator.init(request)+"/"+page+".jsp";
		System.out.println("DispatcherSevlet dest: /WEB-INF/view"+dest);
		request.getRequestDispatcher(dest).forward(request, response);
	}
}
