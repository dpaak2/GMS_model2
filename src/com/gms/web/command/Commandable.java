package com.gms.web.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Commandable  {
	public void process(HttpServletRequest request,HttpServletResponse response);
}
