package com.gms.web.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import com.gms.web.DAO.ArticleDAO;
import com.gms.web.DAOImpl.ArticleDAOImpl;
import com.gms.web.domain.ArticleBean;
import com.gms.web.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {
	private ArticleDAO dao=ArticleDAOImpl.getInstance();
	public static ArticleServiceImpl getInstance() {
		return new ArticleServiceImpl();
	}
	private ArticleServiceImpl(){}
	
	@Override
	public String addArticle(ArticleBean bean) {
		String addResult="";
		
		if(dao.insertArticle(bean).equals("1")){
			addResult="등록이 완료 되었습니다.";
		}else{
			addResult="등록이 실패되었습니다.";
		}
		 
		return addResult;
	}
	
	@Override
	public String countArticles() {
		
		return dao.countArticles();
	}

	@Override
	public ArticleBean findBySeq(int seqNo) {
		
		return dao.selectBySeq(seqNo);
	}

	@Override
	public List<ArticleBean> findById(String id) {
		List<ArticleBean> findByIdList =new ArrayList<>();
	
		findByIdList=dao.selectById(id);
		return findByIdList;
	}

	@Override
	public String updateArticle(ArticleBean update) {
		String updateArticle="";
		updateArticle=(dao.updateArticle(update).equals("1"))?"update success":"update fail";
		return updateArticle;
	}

	@Override
	public String deleteArticle(int seq) {
		String deleteArticle="";
	
		if(dao.deleteArticle(seq).equals("1")){
			deleteArticle="성공적으로 삭제되었습니다.";
		}else{
			deleteArticle="delete failed";
		}
		return deleteArticle;
	}

	@Override
	public List<ArticleBean> listArticles() {
		List<ArticleBean> listArticles= new ArrayList<>();
		listArticles=dao.listArticles();
		return listArticles;
	}



}
