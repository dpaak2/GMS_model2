package com.gms.web.DAOImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gms.web.DAO.ArticleDAO;
import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.ArticleBean;
import com.gms.web.factory.DatabaseFactory;


public class ArticleDAOImpl implements ArticleDAO{
	public static ArticleDAO instance= new ArticleDAOImpl();
	public static ArticleDAO getInstance(){
		try {
			Class.forName(DB.ORACLE_DRIVER);
		} catch (Exception e) {
			System.out.println("SYSTEM FAILED ");
			e.printStackTrace();
		}
		return instance;
	}
	private ArticleDAOImpl(){}

	@Override
	public String insertArticle(ArticleBean bean) {
		String insertArticle="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection().prepareStatement(SQL.ARTICLE_INSERT);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			insertArticle=String.valueOf(pstmt.executeUpdate());
					
		} catch (SQLException e) {
			System.out.println("====insertArticle Fail");
			e.printStackTrace();
		}
		return insertArticle;
	}

	@Override
	public String countArticles() {
		String countArticles="";
		try {
			ResultSet rs= DatabaseFactory.createDatabase(Vendor.ORACLE,DB.ID, DB.PW).getConnection().prepareStatement(SQL.ARTICLE_COUT).executeQuery();
			if(rs.next()){
				countArticles=rs.getString("article_count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countArticles;
	}

	@Override
	public List<ArticleBean> listArticles() {
		List<ArticleBean> listArticles=new ArrayList<>();
		ArticleBean listBean=null;
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.ID,DB.PW).getConnection().prepareStatement(SQL.ARTICLE_LIST).executeQuery();
			while (rs.next()) {
				listBean=new ArticleBean();
				listBean.setArticleSeq(rs.getInt("article_seq"));
				listBean.setId(rs.getString("id"));
				listBean.setTitle(rs.getString("title"));
				listBean.setContent(rs.getString("content"));
				listBean.setHitCount(rs.getInt("hitcount"));
				listBean.setRegdate(rs.getString("regdate"));
				listArticles.add(listBean);
			}
		} catch (SQLException e) {
			System.out.println("LIST ARTICLES FAILED");
			e.printStackTrace();
		}
		
		return listArticles;
	}

	@Override
	public ArticleBean selectBySeq(int seqNo) {
		ArticleBean bean=new ArticleBean();
		try {
			PreparedStatement pstmt= DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection().prepareStatement(SQL.ARTICLE_SELECTBYSEQ);
			pstmt.setInt(1, seqNo);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setArticleSeq(Integer.parseInt(rs.getString("article_seq")));
				bean.setId(rs.getString("id"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setHitCount(rs.getInt("hitcount"));
			}
		} catch (Exception e) {
			System.out.println("SELECT BY SEQ FAILE");
			e.printStackTrace();
		}
		return bean;
	}

	@Override
	public List<ArticleBean> selectById(String id) {
		List<ArticleBean> list= new ArrayList<>();
		ArticleBean temp= null;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.ID, DB.PW).getConnection().prepareStatement(SQL.ARTICLE_SELECTBYID);
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()) {
				temp=new ArticleBean();
				temp.setArticleSeq(rs.getInt("article_seq"));
				temp.setId(rs.getString("id"));
				temp.setTitle(rs.getString("title"));
				temp.setContent(rs.getString("content"));
				temp.setHitCount(rs.getInt("hitcount"));
				temp.setRegdate(rs.getString("regdate"));
				list.add(temp);
			}
		} catch (Exception e) {
		System.out.println("SELECT BY ID FAILED====");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String updateArticle(ArticleBean update) {
		ArticleBean temp=selectBySeq(update.getArticleSeq());
		String updateArticle="";
		String title=(update.getTitle().equals(""))?temp.getTitle():update.getTitle();
		String content=(update.getContent().equals(""))?temp.getContent():update.getContent();
		/*if(update.getTitle().equals("")){
			update.setTitle(selectBySeq(update.getArticleSeq()).getTitle());
		}
		if(update.getContent().equals("")){
			update.setContent(selectBySeq(update.getArticleSeq()).getContent());
		}*/
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.ID, DB.PW).getConnection().prepareStatement(SQL.ARTICLE_UPDATE);
			pstmt.setString(1,title);
			pstmt.setString(2,content);
			pstmt.setInt(3, update.getArticleSeq());
			updateArticle=String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			System.out.println("====updateArticle DAo failed===");
			e.printStackTrace();
		}
		
		return updateArticle;
	}

	@Override
	public String deleteArticle(int seq) {
		String deleteArticle="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE,DB.ID,DB.PW).getConnection().prepareStatement(SQL.ARTICLE_DELETE);
			pstmt.setInt(1, seq);
			//DELETE FROM table [WHERE conditions];
			deleteArticle =String.valueOf(pstmt.executeUpdate());
		} catch (Exception e) {
			System.out.println("DELETE DAOI ERROR");
			e.printStackTrace();
		}
		
		return deleteArticle;
	}

}
