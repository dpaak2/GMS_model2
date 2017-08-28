package com.gms.web.proxy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lombok.Getter;
import lombok.Setter;

public class PageProxy extends Proxy {
    protected int 
	pageSize,blockSize,theNumberOfRows,pageNumber;
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTheNumberOfRows() {
		return theNumberOfRows;
	}

	public void setTheNumberOfRows(int theNumberOfRows) {
		this.theNumberOfRows = theNumberOfRows;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public PageProxy(HttpServletRequest request) {
		super(request);
	}
	
	public void execute(int[] arr, List<?>list) {
    		super.getRequest().setAttribute("pageNumber",arr[0]); //내가 원하는 페이지를 전송 -> default page number
			super.getRequest().setAttribute("theNumberOfPages", arr[1]);
			super.getRequest().setAttribute("startPage", arr[2]);
			super.getRequest().setAttribute("endPage",arr[3]);
			super.getRequest().setAttribute("prevBlock", arr[4]);
			super.getRequest().setAttribute("nextBlock", arr[5]);
			super.getRequest().setAttribute("list", list); // list 가져감
			
			System.out.println("pageNumber"+arr[0]);
			System.out.println("theNumberOfPages"+arr[1]);
			System.out.println("startPage"+arr[2]);
			System.out.println("endPage"+arr[3]);
			System.out.println("prevBlock"+arr[4]);
			System.out.println("nextBlock"+arr[5]);
	}
	
}
