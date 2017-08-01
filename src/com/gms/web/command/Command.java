package com.gms.web.command;

public class Command  {
	protected String directory,action, page;

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
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
	public String toString() {
		return "!!!!! Command [dest= WEB-INF/" +directory+"/"+page+"/" +action+"\n"+
			"DIRECTORY:::"+	directory +" , PAGE:::" + page + "]";
	}
	
	
}
