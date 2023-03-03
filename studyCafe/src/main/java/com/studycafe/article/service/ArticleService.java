package com.studycafe.article.service;

import java.util.List;


import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Page;

public interface ArticleService {
	
	public ArticlePage getArticlePage(Page pageNo) throws Exception;

	public Article getArticleDetail(int no) throws Exception;

	public List<Article> getSearchTitle(String searchTitle) throws Exception;

	public void addArticle(Article article) throws Exception;

	public void modifyArticle(Article article) throws Exception;

	public void deleteArticle(int a_no) throws Exception;

	public List<ArticleComment> getCommentList(int no) throws Exception;

	public void addComment(ArticleComment articleComment) throws Exception;


}
