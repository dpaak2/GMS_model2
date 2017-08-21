package com.gms.web.proxy;
/*
public class BlockHandler {
	public static int[]attr(PageProxy pxy){
		int[]result= new int [6];
		int theNumberOfPages=0,startPage=0,endPage=0;
		
		theNumberOfPages =(pxy.getTheNumberOfRows() % pxy.getPageSize())==0? pxy.getTheNumberOfRows() / pxy.getPageSize():
			pxy.getTheNumberOfRows()/pxy.getPageSize() +1;
		startPage= pxy.getPageNumber() - ((pxy.getPageNumber()-1)%pxy.getBlockSize());
		endPage=(startPage+pxy.getBlockSize() -1<= theNumberOfPages)?startPage+pxy.getBlockSize()-1
				:theNumberOfPages;
		result[0]=pxy.getPageNumber();
		result[1]=theNumberOfPages;
		result[2]=startPage;
		result[3]=endPage;
		result[4]=startPage-(theNumberOfPages/pxy.getBlockSize());   //prevBlock
		result[5]=startPage+(theNumberOfPages/pxy.getBlockSize());   //nextBlock
		return result;
	}
}
*/

public class BlockHandler{
	   
	   public static int[] attr(PageProxy pxy){
	      int[] result = new int[6];
	      int theNumberOfPage = 0, startPage=0, endPage = 0;
	      
	      theNumberOfPage = (pxy.getTheNumberOfRows() % pxy.getPageSize())==0 ? pxy.getTheNumberOfRows() / pxy.getPageSize() : pxy.getTheNumberOfRows() / pxy.getPageSize() + 1;
	      startPage = pxy.getPageNumber() -((pxy.getPageNumber()-1)%pxy.getBlockSize());
	      endPage = (startPage + pxy.getBlockSize() - 1 <= theNumberOfPage) ?  startPage+pxy.getBlockSize()-1 : theNumberOfPage;
	      
	      result[0]=pxy.getPageNumber();
	      result[1]=theNumberOfPage;
	      result[2]=startPage;
	      result[3]=endPage;
	      result[4]=startPage-(theNumberOfPage/pxy.getBlockSize()); //prevBlock
	      result[5]=startPage+(theNumberOfPage/pxy.getBlockSize()); //nextBlock
	      
	      System.out.println("pxy.getPageNumber()"+result[0]);
	      System.out.println("pxy.theNumberOfPage()"+result[1]);
	      System.out.println("pxy.startPage()"+result[2]);
	      System.out.println("pxy.endPage()"+result[3]);
	      System.out.println("pxy.prevBlock()"+result[4]);
	      System.out.println("pxy.nextBlock()"+result[5]);
	      return result;
	   }
	}
