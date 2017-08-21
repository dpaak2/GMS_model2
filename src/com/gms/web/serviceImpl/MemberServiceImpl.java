package com.gms.web.serviceImpl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.gms.web.DAO.MemberDAO;
import com.gms.web.DAOImpl.MemberDAOImpl;
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
		Map<String,Object> map= new HashMap<>();
		System.out.println("MemberServiceImpl login entered!!!!");
	    MemberBean m = findById(bean.getId());
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
		Separator.cmd.setDirectory("common");
		Separator.cmd.setPage("main");
		Separator.cmd.process();
		return result;
	}

	@Override
	public String count() {
		return dao.count();// memberList.length;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<?> list(Object o) {
		list=(List<StudentBean>) dao.selectAll(o);
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
		System.out.println("serviceImpl*****" + mem);
		return result;
	}

	@Override
	public String removeUser(String id) {
		String removeResult = "";
		for (StudentBean m : list) {
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