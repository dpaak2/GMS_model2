package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;
import com.gms.web.command.Command;
import com.gms.web.factory.CommandFactory;

public class Separator {
	public static Command cmd= new Command(); /*객체를 생성하고 단 하나만 만들게 된다.*/
	public static void init(HttpServletRequest request){
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		String servletPath=request.getServletPath();
		System.out.println("separator servletPath: "+servletPath);
		String dir =servletPath.substring(1,servletPath.indexOf("."));
		System.out.println("separator directory: "+dir);
		cmd=CommandFactory.createCommand(dir, action, page);
	}
}
