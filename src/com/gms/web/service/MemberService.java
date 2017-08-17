package com.gms.web.service;

import java.util.List;
import java.util.Map;

import com.gms.web.domain.MemberBean;

public interface MemberService {
	public Map<String,Object> login(MemberBean bean); /*client를 */
	public String addMember(Map<String, Object> map);
	public List<MemberBean> getMembers();
	public String countMembers();
	public MemberBean findById(String id);
	public List<MemberBean> findByName(String name);
	public String modifiyProfile(MemberBean bean);
	public String removeUser(String id);
	
}
