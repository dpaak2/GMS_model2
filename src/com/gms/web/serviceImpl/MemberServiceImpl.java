package com.gms.web.serviceImpl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gms.web.DAO.MemberDAO;
import com.gms.web.DAOImpl.MemberDAOImpl;
import com.gms.web.command.Command;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;
import com.gms.web.util.Separator;

public class MemberServiceImpl implements MemberService {
	MemberBean member;
	Map<String, MemberBean> map; // key 값은 String으로 주고 object(instance) =
									// MemberBean이다
	List<StudentBean> list;
	
	
	private MemberDAO dao=MemberDAOImpl.getInstance();
	
	public static MemberServiceImpl getInstance() {
		return new MemberServiceImpl();
	}

	private MemberServiceImpl(){}
	

	@Override
	public Map<String,Object> login(MemberBean bean) {
		System.out.println("MemberServiceImpl login entered!!!!");
		Map<String,Object> map= new HashMap<>();
		Command cmd= new Command();
		cmd.setSearch(bean.getId());
	    MemberBean m = dao.login(cmd);
	    String page=(m!=null)?(bean.getPw().equals(m.getPw()))?"main":"login_fail":"join";
	    map.put("page", page);
	    map.put("user", m);
		return map;
	
	}
	
	@Override
	public String addMember(Map<String, Object> map) {
		System.out.println("Member serviceImpl entered");
		String result="";
		MemberBean m = (MemberBean) map.get("member");
		System.out.println("넘어온 학생 회원정보 ==="+ m.toString());
		@SuppressWarnings("unchecked")
		List<MajorBean> list= (List<MajorBean>) map.get("major");
		System.out.println("넘어온 과목들 !!!"+list.toString());
		result= dao.insertMember(map);
		Separator.cmd.setDir("home");
		Separator.cmd.setPage("main");
		Separator.cmd.process();
		return result;
	}

	@Override
	public String count(Command cmd) {
		return dao.count(cmd);// memberList.length;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<?> list(Command cmd) {
		list=(List<StudentBean>) dao.selectAll(cmd);
		System.out.println("list to string servicd"+list.toString());
		return list; // ArrayList가 된다
	}

	@Override
	public StudentBean findById(Command cmd) {
		StudentBean stu = new StudentBean();
		stu = dao.selectById(cmd);
		return stu;
	}

	@Override
	public List<?> findByName(Command cmd) {
		System.out.println("findByName:: "+cmd.getSearch()+"::");
		return dao.selectByName(cmd);
	}

	@Override
	public String modifiyProfile(MemberBean bean) {
		String result = "";
		// findById(bean.getPw()).setPw(bean.getPw());
		Command cmd=new Command();
		cmd.setSearch(bean.getId());
		MemberBean mem =dao.login(cmd);
		if (!bean.getName().equals("")) {
			mem.setName(bean.getName());
		}
		if (!bean.getPw().equals("")) {
			mem.setPw(bean.getPw());
		}
		if (!bean.getSsn().equals("")) {
			mem.setSsn(bean.getSsn());
		}
		System.out.println("serviceImpl*****" + mem);
		return result;
	}

	@Override
	public String removeUser(Command cmd) {
		String removeResult = "";
		for (StudentBean m : list) {
			if (cmd.equals(m.getId())) {
				// list.get(i)=list[count-1];
				map.remove(cmd);
				break;
			}
		}
		// list.get(i)=null;
		// count--;
		return removeResult;
	}


}