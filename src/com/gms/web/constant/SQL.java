package com.gms.web.constant;

public class SQL {
	// id, pw,name,email,major,subject,phone,profile;
	public static final String MEMBER_INSERT = String.format("INSERT INTO %s(member_id, name, password,ssn,phone,email,profile,regdate) "
																	       + "VALUES(?,?,?,?,?,?,?,SYSDATE)", DB.TABLE_MEMBER);
	public static final String MEMBER_LIST = String.format("SELECT * FROM %s", "Member");
	public static final String MEMBER_FINDBYID=String.format("SELECT * FROM %s WHERE %s=?", DB.TABLE_MEMBER,DB.MEMBER_ID);
	public static final String MEMBER_COUNT=String.format("SELECT COUNT(*) as %s FROM %s",DB.MEMBER_COUNT,DB.TABLE_MEMBER);
	public static final String MEMBER_UPDATE=String.format("UPDATE %s SET %s=? WHERE %s=?", DB.TABLE_MEMBER,DB.MEMBER_PW,DB.MEMBER_ID);
	public static final String MEMBER_DELETE=String.format("DELETE FROM %s WHERE %s=?", DB.TABLE_MEMBER,DB.MEMBER_ID);
	public static final String ARTICLE_INSERT=String.format("INSERT INTO %s (article_seq,id,title,content,hitcount,regdate) VALUES (article_seq.nextval,?,?,?,0,SYSDATE)", DB.TABLE_BOARD);
	public static final String ARTICLE_COUT=String.format("SELECT COUNT(*) AS %s FROM %s",DB.ARTICLE_COUNT, DB.TABLE_BOARD);
	public static final String ARTICLE_LIST=String.format("SELECT * FROM %s", DB.TABLE_BOARD);
	public static final String ARTICLE_SELECTBYSEQ=String.format("SELECT * FROM %s WHERE %s=?", DB.TABLE_BOARD,DB.ARTICLE_SEQ);
	public static final String ARTICLE_SELECTBYID=String.format("SELECT * FROM %s WHERE %s=?", DB.TABLE_BOARD,DB.MEMBER_ID);
	public static final String ARTICLE_UPDATE=String.format("UPDATE %s SET %s=?,%s=? WHERE %s=?", DB.TABLE_BOARD,DB.TITLE,DB.ARTICLE_CONTENT,DB.ARTICLE_SEQ);
	public static final String ARTICLE_DELETE=String.format("DELETE FROM %s WHERE %s=?", DB.TABLE_BOARD,DB.ARTICLE_SEQ);
	public static final String MJAJOR_INSERT=String.format("INSERT INTO %s(%s,%s,%s,%s) VALUES(?,?,?,?)", DB.TABLE_MAJOR,DB.MAJOR_ID,DB.TITLE,DB.MEMBER_ID,DB.SUBJECT_ID);
														/* num,id,name,ssn,regdate,phone,email,title */			
	public static final String STUDENT_LIST=" select t2.* "
			+ "from (select rownum seq, t.*"
			+ " from( select * "
			+ "from student"
			+ " order  by num DESC )t)t2"
			+ " where t2.seq between ? and ?";

	
	public static final String STUDENT_FINDBYNAME="select t2.* "
			+ " from (select rownum seq, t.*"
			+ " from (select * "
			+ " from student where name like '%' || ? || '%' order by num DESC)t)t2 where t2.seq between 1 and 5";
	
	public static final String STUDENT_COUNT=String.format("SELECT COUNT(*) as student_count  FROM %s where name like ?",DB.TABLE_STUDENT);
	public static final String STUDNET_FINDBYID=String.format("select * from %s where id like ?", DB.TABLE_STUDENT);

}
