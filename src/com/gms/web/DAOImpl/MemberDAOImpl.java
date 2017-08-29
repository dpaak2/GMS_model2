package com.gms.web.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.DAO.MemberDAO;
import com.gms.web.command.Command;
import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;

public class MemberDAOImpl implements MemberDAO {
	public static MemberDAO instance = new MemberDAOImpl();
	Connection conn;

	/* sigleton */
	public static MemberDAO getInstance() {
		return instance;
	}

	public MemberDAOImpl() {
		conn = null;
	}

	@Override
	public String insertMember(Map<?, ?> map) {
		String insertMember = "";
		MemberBean bean = (MemberBean) map.get("member");
		@SuppressWarnings("unchecked")
		List<MajorBean> list = (List<MajorBean>) map.get("major");
		PreparedStatement pstmt = null;
		// catch에서 잡아 줘야 되서 밖으로 뺐다
		try {
			// transaction
			Connection conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(SQL.MEMBER_INSERT);
			System.out.println("member insert::" + SQL.MEMBER_INSERT);
			/*
			 * ("INSERT INTO %s(member_id, name,
			 * password,ssn,phone,email,profile,regdate)
			 */
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPw());
			pstmt.setString(4, bean.getSsn());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getProfile());
			pstmt.executeUpdate();
			for (int i = 0; i < list.size(); i++) {
				pstmt = conn.prepareStatement(SQL.MJAJOR_INSERT);
				pstmt.setString(1, list.get(i).getMajorId());
				System.out.println("DAOIMPL ::major+id" + list.get(i).getMajorId());
				pstmt.setString(2, list.get(i).getTitle());
				System.out.println("DAOIMPL ::major+title" + list.get(i).getTitle());
				pstmt.setString(3, list.get(i).getId());
				System.out.println("DAOIMPL ::major+id" + list.get(i).getId());
				pstmt.setString(4, list.get(i).getSubjId());
				System.out.println("DAOIMPL ::major+subjecid" + list.get(i).getSubjId());
				insertMember = String.valueOf(pstmt.executeUpdate());
				System.out.println("query::::" + SQL.MJAJOR_INSERT);
				System.out.println("$$$$$$$$$$ insert major result=" + insertMember);
			}
			conn.commit();
		} catch (Exception e) {
			System.out.println("DAO IMPL insert member error!!");
			e.printStackTrace();
			if (conn != null) { // conn이 유지 되고 있다는것이다
				try {
					conn.rollback();
				} catch (SQLException ex) {
					e.printStackTrace();
					System.out.println("sql transaction error!!!!! ");
				}
			}
		}
		System.out.println(insertMember);
		return insertMember;
	}

	@Override
	public List<?> selectAll(Command cmd) {
		List<StudentBean> memberList = new ArrayList<>();

		System.out.println("%%%%%query student List " + SQL.STUDENT_LIST);

		try {
			conn = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL.STUDENT_LIST);
			pstmt.setString(1, cmd.getStartRow());
			pstmt.setString(2, cmd.getEndRow());
			ResultSet rs = pstmt.executeQuery();
			StudentBean temp = null;
			while (rs.next()) {
				temp = new StudentBean();
				temp.setId(rs.getString(DB.STU_ID));
				temp.setName(rs.getString(DB.MEMBER_NAME));
				temp.setSsn(rs.getString(DB.MEMBER_SSN));
				temp.setEmail(rs.getString(DB.EMAIL));
				temp.setPhone(rs.getString(DB.PHONE));
				temp.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				temp.setNum(rs.getString(DB.NUM));
				temp.setTitle(rs.getString(DB.TITLE));
				memberList.add(temp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public String count(Command cmd) {
		int count = 0;
		try {
			String sql = "";
			String search = cmd.getSearch();
			sql = (search == null) ? "%" : "%" + search + "%";
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.STUDENT_COUNT);
			pstmt.setString(1, sql);
			System.out.println("SQL count::" + SQL.STUDENT_COUNT);
			System.out.println("sqL;;;;" + sql);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("student_count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("DB count: " + count);
		return String.valueOf(count);
	}

	@Override
	public StudentBean selectById(Command cmd) {
		StudentBean bean = null;
		String id = cmd.getSearch();
		System.out.println("search::" + id);
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.STUDNET_FINDBYID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new StudentBean();
				bean.setId(rs.getString(DB.STU_ID));
				bean.setName(rs.getString(DB.MEMBER_NAME));
				bean.setSsn(rs.getString(DB.MEMBER_SSN));
				bean.setEmail(rs.getString(DB.EMAIL));
				bean.setPhone(rs.getString(DB.PHONE));
				bean.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				bean.setNum(rs.getString(DB.NUM));
				bean.setTitle(rs.getString(DB.TITLE));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public List<StudentBean> selectByName(Command cmd) {

		List<StudentBean> nameList = new ArrayList<>();
		StudentBean temp = null;
		String name = cmd.getSearch();
		System.out.println("DAOIMPL select by name::" + name);
		System.out.println("DAOIMPL select by column::" + cmd.getColumn());
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.STUDENT_FINDBYNAME);
			pstmt.setString(1, "%" + name + "%");
			System.out.println("SQL query::" + SQL.STUDENT_FINDBYNAME);
			System.out.println("name ::: " + name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				temp = new StudentBean();
				temp.setId(rs.getString(DB.STU_ID));
				temp.setName(rs.getString(DB.MEMBER_NAME));
				temp.setSsn(rs.getString(DB.MEMBER_SSN));
				temp.setEmail(rs.getString(DB.EMAIL));
				temp.setPhone(rs.getString(DB.PHONE));
				temp.setRegdate(rs.getString(DB.MEMBER_REGDATE));
				temp.setNum(rs.getString(DB.NUM));
				temp.setTitle(rs.getString(DB.TITLE));
				nameList.add(temp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("nameLIST DAO: " + nameList.toString());
		return nameList;
	}

	@Override
	public String updateProfile(MemberBean bean) {
		String updateResult = "";
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.MEMBER_UPDATE);
			pstmt.setString(1, bean.getPw());
			pstmt.setString(2, bean.getId());
			updateResult = String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateResult;
	}

	@Override
	public String deleteUser(Command cmd) {
		String deleteUser = "";
		String id = cmd.getSearch();
		System.out.println("delete id : " + id);
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, id);
			deleteUser = String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteUser;
	}

	@Override
	public MemberBean login(Command cmd) {
		MemberBean bean = null;
		String id = cmd.getSearch();
		System.out.println("search::" + id);
		try {
			PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection()
					.prepareStatement(SQL.MEMBER_FINDBYID);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new MemberBean();
				// id, name, password,ssn,regdate
				bean.setId(rs.getString(DB.MEMBER_ID));
				bean.setName(rs.getString(DB.MEMBER_NAME));
				bean.setPw(rs.getString(DB.MEMBER_PW));
				bean.setSsn(rs.getString(DB.MEMBER_SSN));
				bean.setRegedate(rs.getString(DB.MEMBER_REGDATE));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
}
