package com.gms.web.factory;
import com.gms.web.command.Command;
import com.gms.web.command.*;
import com.gms.web.constant.Action;

public class CommandFactory {
	public static Command createCommand(String dir, String action, String page){
		Command cmd=null;
		switch (action) {
		case Action.MOVE: case Action.LOGIN:cmd= new MoveCommand(dir, action, page);
		break;
		default:/*이게 찍히면 시스템 종료다 */System.out.println("Command Failed!!!!!");break;
		}
		return cmd; 
	}
}
