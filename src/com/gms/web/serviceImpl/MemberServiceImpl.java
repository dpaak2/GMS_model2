package com.gms.web.serviceImpl;


import java.util.List;
import java.util.Map;

import com.gms.web.DAO.MemberDAO;
import com.gms.web.DAOImpl.MemberDAOImpl;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;




public class MemberServiceImpl implements MemberService {
	MemberBean member;
	Map<String, MemberBean> map; // key 값은 String으로 주고 object(instance) =
									// MemberBean이다
	List<MemberBean> list;
	
	
	private MemberDAO dao=MemberDAOImpl.getInstance();
	
	public static MemberServiceImpl getInstance() {
		return new MemberServiceImpl();
	}

	private MemberServiceImpl(){}

	@Override
	public String addMember(MemberBean bean) {
		String result="";
		
			MemberDAO dao=new MemberDAOImpl();
			result= (!dao.insertMember(bean).equals("1"))?"회원가입이 실패하였습니다.":"회원가입성공 되었습니다.";
			System.out.println("service impl:"+result);
		
		return result;
	}

	@Override
	public String countMembers() {
		return new MemberDAOImpl().countMembers(); // memberList.length;
	}

	@Override
	public List<MemberBean> getMembers() {
		list=dao.selectAll();
		return list; // ArrayList가 된다
	}

	@Override
	public MemberBean findById(String id) {
		MemberBean member = new MemberBean();
		member = dao.selectById(id);
		return member;
	}

	@Override
	public List<MemberBean> findByName(String name) {
		return dao.selectByName(name);
	}

	@Override
	public String modifiyProfile(MemberBean bean) {
		String result = "";
		// findById(bean.getPw()).setPw(bean.getPw());

		MemberBean mem = findById(bean.getId());

		if (!bean.getName().equals("")) {
			mem.setName(bean.getName());
		}
		if (!bean.getPw().equals("")) {
			mem.setPw(bean.getPw());
		}
		if (!bean.getSsn().equals("")) {
			mem.setSsn(bean.getSsn());
		}
		System.out.println("serviceImpl*****" + mem.toString());
		return result;
	}

	@Override
	public String removeUser(String id) {
		String removeResult = "";
		for (MemberBean m : list) {
			if (id.equals(m.getId())) {
				// list.get(i)=list[count-1];
				map.remove(id);
				break;
			}
		}
		// list.get(i)=null;
		// count--;
		return removeResult;
	}

}