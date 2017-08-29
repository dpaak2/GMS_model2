package com.gms.web.service;

import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;

public interface MemberService {
	public Map<String, Object> login(MemberBean bean); /*client를 */
	public String addMember(Map<String, Object> map);
	public List<?> list(Command cmd);
	public String count(Command cmd);
	public StudentBean findById(Command cmd);
	public List<?> findByName(Command cmd);
	public String modifiyProfile(MemberBean bean);
	public String removeUser(Command cmd);
	
}
