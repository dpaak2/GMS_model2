package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;

public class Separator {
	public static String init(HttpServletRequest request){
		String servletPath=request.getServletPath();
		System.out.println("separator servletPath: "+servletPath);
		String directory =servletPath.substring(0,servletPath.indexOf("."));
		System.out.println("separator directory: "+directory);
		return directory;
	}
}
