package com.gms.web.proxy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public abstract class Proxy {
	HttpServletRequest request;

	public Proxy(HttpServletRequest request) {
		this.request = request;
	}
	public abstract void execute(Map<?, ?> map);
	
}
