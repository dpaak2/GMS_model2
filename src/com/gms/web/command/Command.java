package com.gms.web.command;

import com.gms.web.constant.Extension;
import com.gms.web.constant.Path;

public class Command implements Commandable {
	protected String dir,action, page,view;

	public String getView() {
		return view;
	}

	public String getDirectory() {
		return dir;
	}

	public void setDirectory(String dir) {
		this.dir = dir;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	@Override
	public void process() {
		/*VIEW를 정해준다*/
		this.view=Path.VIEW+dir+Path.SEPARATOR+page+Extension.JSP;
		System.out.println("Command process:"+this.view);
	}
	
	@Override
	public String toString() {
		return "!!!!! Command [dest= WEB-INF/" +dir+"/"+page+"/" +action+"\n"+
			"DIRECTORY:::"+	dir +" , PAGE:::" + page + "]";
	}


	
	
}
