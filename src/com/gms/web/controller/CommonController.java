package com.gms.web.controller;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherSevlet;
import com.gms.web.util.Separator;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@WebServlet({"/home.do","/common.do"})
public class CommonController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean memberBean=new MemberBean();
		
		System.out.println("^^^^^^^^^^CommonController do get 진입");
		Separator.init(request);
		switch (Separator.cmd.getAction()) {
		case Action.MOVE:
			DispatcherSevlet.send(request, response);
			break;
			
		case Action.LOGIN:
			memberBean=new MemberBean();
			MemberService service= MemberServiceImpl.getInstance();
			memberBean.setId(request.getParameter("input_id"));
			memberBean.setPw(request.getParameter("input_pass"));
			System.out.println("requested id & pass form JSP::: id= "+memberBean.getId()+" pass= "+memberBean.getPw());
			Map<String,Object> login=service.login(memberBean);
			System.out.println("page :::: "+login);
			if(login.get("page").equals("main")){
				session.setAttribute("user",login.get("user"));
			} /*main일 경우 session을 가동시키고 아니면 안한다 */
			
			Separator.cmd.setPage(String.valueOf(login.get("page")));  /*object로 넘어와서 String type으로 맞춰줘야 한다*/
			Separator.cmd.process();
			DispatcherSevlet.send(request, response);
			break;
		case Action.LOGOUT:
			session.invalidate();
			DispatcherSevlet.send(request, response);
			break;
			
		default:break;
		}
	}
	

}
