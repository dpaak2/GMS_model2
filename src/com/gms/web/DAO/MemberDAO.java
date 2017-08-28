package com.gms.web.DAO;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.domain.MemberBean;

public interface MemberDAO {
	public String insertMember(Map<?, ?> map);
	public List<?> selectAll(Command cmd);
	public String count(Command cmd);
	public MemberBean selectById(Command cmd);
	public List<?> selectByName(Command cmd);
	public String updateProfile(MemberBean bean);
	public String deleteUser(Command cmd);

}
