package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;
import com.gms.web.command.Command;
import com.gms.web.factory.CommandFactory;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

public class Separator {
	public static Command cmd= new Command(); /*객체를 생성하고 단 하나만 만들게 된다.*/
	public static void init(HttpServletRequest request){
		String servletPath=request.getServletPath();
		System.out.println("separator servletPath: "+servletPath);
		cmd=CommandFactory.createCommand(
				servletPath.substring(1,servletPath.indexOf(".")), 
				request.getParameter("action"),
				request.getParameter("page"),
				request.getParameter("pageNumber"),
				request.getParameter("column"),
				request.getParameter("search"));
		System.out.println("action !!!!"+request.getParameter("action"));
	}
}
