package com.gms.web.service;
import java.util.List;

import com.gms.web.domain.ArticleBean;
import com.gms.web.domain.MemberBean;



public interface ArticleService {
	public String addArticle(ArticleBean bean);
	public String countArticles();
	public List<ArticleBean> listArticles(); 
	public ArticleBean findBySeq(int seqNo);
	public List<ArticleBean> findById(String id); 
	public String updateArticle(ArticleBean update);
	public String deleteArticle(int seq);
}
