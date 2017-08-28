package com.gms.web.factory;
import com.gms.web.command.*;
import com.gms.web.constant.Action;

public class CommandFactory {
	public static Command createCommand(String dir, String action, String page,String pageNumber,String column,String search){
		Command cmd=null;
		if(action==null){
			action=Action.MOVE;
		}
			switch (action) {
			case Action.MOVE:
		    case Action.LOGIN:
			case Action.LOGOUT:
			case Action.JOIN :
			case Action.UPDATE:
			case Action.DETAIL:
			case Action.DELETE:
			     cmd= new MoveCommand(dir, action, page);
			break;
			case Action.LIST:
				cmd= new ListCommand(dir, action, page, pageNumber);
				break;
			
			case Action.SEARCH:
				cmd= new SearchCommand(dir, action, page, pageNumber, column, search);
				break;
			default:/*이게 찍히면 시스템 종료다 */System.out.println("Command Failed!!!!!");break;
			}
		
		return cmd; 
	}
}
