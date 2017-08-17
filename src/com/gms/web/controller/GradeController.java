package com.gms.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.constant.Action;
import com.gms.web.util.DispatcherSevlet;
import com.gms.web.util.Separator;
@WebServlet("/grade.do")
public class GradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("%%%%%%%%%% Grade controller ===== get 진입");
		String action=request.getParameter("action");
		System.out.println("GradeController action: "+action);
		Separator.init(request);
		switch (action) {
		case Action.MOVE:
			
			DispatcherSevlet.send(request, response);
			break;

		default:
			break;
		}
	}
}
