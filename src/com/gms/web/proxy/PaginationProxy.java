package com.gms.web.proxy;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import lombok.Setter;

public class PaginationProxy extends Proxy {
	public PaginationProxy(HttpServletRequest request) {
		super(request);
	}

	@Setter
	Integer pageSixe ,blockSize;
	private static BlcokHandler ph=new BlcokHandler();
	private static PageHandler rh=new PageHandler();
	

	@Override
	public void execute(Map<?, ?> map) {
		// TODO Auto-generated method stub
		
	}
	
}
