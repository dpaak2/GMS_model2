package com.gms.web.command;

public class ListCommand extends Command {
	public ListCommand(String dir,String action,String page, String pageNumber){
		setDir(dir);
		setAction(action);
		setPage(page);
		setPageNumber(pageNumber);
		/*기본값 주기 위해서 널 체크를 하고 있다*/
		process();
	}
}
