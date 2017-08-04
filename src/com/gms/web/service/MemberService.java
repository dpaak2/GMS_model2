package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.MemberBean;

public interface MemberService {
	public String login(MemberBean bean); /*client를 */
	public String addMember(MemberBean bean);
	public List<MemberBean> getMembers();
	public String countMembers();
	public MemberBean findById(String id);
	public List<MemberBean> findByName(String name);
	public String modifiyProfile(MemberBean bean);
	public String removeUser(String id);
}
