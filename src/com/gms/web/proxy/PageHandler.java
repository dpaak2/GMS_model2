package com.gms.web.proxy;
/*public class PageHandler{
	public static int[] attr(PageProxy pxy) {
		int []result= new int[2];
		int startRow=0,endRow=0;
		
		if(pxy.getPageNumber() <= pxy.getTheNumberOfRows()/pxy.getPageSize()+ 1){
			if(pxy.getPageNumber()==1){
				startRow=1;
				endRow=pxy.getPageSize();
			}else{
				startRow=(pxy.getPageNumber() -1)* pxy.getPageSize()+1;
				endRow=pxy.getPageNumber()*pxy.getPageSize();
				
			}
		}
		result[0]=startRow;
		result[1]=endRow;
		System.out.println("start Row "+result[0]);
		System.out.println("endRow"+result[1]);
		return result;

	}

}
*/

import javax.servlet.http.HttpServletRequest;

import com.gms.web.command.Command;

public class PageHandler extends PageProxy {

	public PageHandler(HttpServletRequest request) {
		super(request);
	}

	// int를 객체로 바꿔서 사용
	public static Command attr(PageProxy pxy) {
		/* 전부 내장된 객체이다 , 보안이 강화 된다 */
		Command cmd = new Command();

		if (pxy.getPageNumber() <= pxy.getTheNumberOfRows() / pxy.getPageSize() + 1) {
			if (pxy.getPageNumber() == 1) {
				cmd.setStartRow("1");
				cmd.setEndRow(String.valueOf(pxy.getPageSize()));
			} else {
				cmd.setStartRow(String.valueOf((pxy.getPageNumber() - 1) * pxy.getPageSize() + 1));
				cmd.setEndRow(String.valueOf(pxy.getPageNumber() * pxy.getPageSize()));
			}
		}
		return cmd;
	}
}