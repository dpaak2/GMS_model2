package com.gms.web.domain;

import java.io.Serializable;

public class ArticleBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String id,title, content,regdate;
	private int articleSeq, hitCount;
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getArticleSeq() {
		return articleSeq;
	}

	public void setArticleSeq(int articleSeq) {
		this.articleSeq = articleSeq;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	@Override
	public String toString() {
		return "ArticleBean [articleSeq="+articleSeq+ ", id=" + id + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+  ", hitCount=" + hitCount + "] \n";
	}
}
