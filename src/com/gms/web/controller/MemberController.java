package com.gms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.ParameterMap;

import com.gms.web.constant.Action;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.serviceImpl.MemberServiceImpl;
import com.gms.web.util.DispatcherSevlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separator;


@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("$$$$$$$$$$$$member Controller 진입");
		String action=request.getParameter("action");
		System.out.println("member controller action: "+action);
		Separator.init(request);
		MemberService service= MemberServiceImpl.getInstance();
		MemberBean member= new MemberBean();
		
		switch (action) {
		case "move": 
			System.out.println("======move 진입");
			System.out.println("member Controller action: "+action);
			DispatcherSevlet.send(request, response);
			break;
		
		case "login":
			System.out.println("login controller==========");
			DispatcherSevlet.send(request, response);
			break;
			
		case "list":
			System.out.println("list controller==========");
			DispatcherSevlet.send(request, response);
			break;
			
		case Action.JOIN:
			System.out.println("controller member==== join 진입");
			Map<?, ?> map=ParamsIterator.execute(request);
			member.setId((String)map.get("member_id"));
			member.setPw((String)map.get("password"));
			member.setName((String)map.get("name"));
			member.setSsn((String)map.get("birth"));
			member.setGender((String)map.get("gender"));
			member.setEmail((String)map.get("email"));
			member.setPhone((String)map.get("phone"));
			member.setMajor((String)map.get("major"));
			member.setProfile("profile.jpg");
			String[] subjects=((String) map.get("subject")).split(",");
			List<MajorBean> list= new ArrayList<>();
			MajorBean major=null;
			for(int i=0;i<subjects.length;i++){
				major=new MajorBean();
				major.setMajorId(String.valueOf((int)((Math.random() * 9999) + 1000)));
				major.setId((String)map.get("member_id"));
				major.setTitle((String)map.get("name"));
				major.setSubjId(subjects[i]);
				list.add(major);
			}
			Map<String, Object> temp= new HashMap<>();
			temp.put("member", member);
			temp.put("major", list);
			service.addMember(temp);
			major.setSubjId(subjects[0]);
			
			DispatcherSevlet.send(request, response);
			break;
			
		case"delete":
			System.out.println("controller member delete 진입");
			break;
			
		case"detail":
			System.out.println("controller member detail 진입");
			break;
			
		case"update":
			System.out.println("controller members update 진입");
			break;
		}
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("$$$$$$$$$$$$member controller ======== do post 진입");
	}

}
