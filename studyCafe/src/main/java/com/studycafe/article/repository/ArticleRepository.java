package com.studycafe.article.repository;

import java.util.List;


import org.springframework.dao.DataAccessException;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Login;
import com.studycafe.article.domain.Page;

public interface ArticleRepository {

	public int getArticleListCount() throws DataAccessException;
	
	public List<Article> getArticleAllList(Page pageNo) throws DataAccessException;

	public Article getArticleDetail(int no) throws DataAccessException;

	public List<Article> getSearchTitle(String searchTitle) throws DataAccessException;

	public void addArticle(Article article) throws DataAccessException;

	public void modifyArticle(Article article) throws DataAccessException;

	public void deleteArticle(int a_no) throws DataAccessException;

	public List<ArticleComment> getCommentList(int no) throws DataAccessException;

	public void addComment(ArticleComment articleComment) throws DataAccessException;

	public Login getLogin(Login login) throws DataAccessException;

}
