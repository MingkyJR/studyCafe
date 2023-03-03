package com.studycafe.article.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Page;
import com.studycafe.article.repository.ArticleRepository;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleRepository articleRepository;
	
	@Override
	public ArticlePage getArticlePage(Page pageNo) throws Exception {
		
		int total = articleRepository.getArticleListCount();
		System.out.println(total);
		List<Article> articleAllList = articleRepository.getArticleAllList(pageNo);
		System.out.println(articleAllList);
		return new ArticlePage(total,pageNo.getPageNo(),5, articleAllList);
	}

	@Override
	public Article getArticleDetail(int no) throws Exception {
		return articleRepository.getArticleDetail(no);
	}
	@Override
	public List<ArticleComment> getCommentList(int no) throws Exception {
		return articleRepository.getCommentList(no);
	}

	@Override
	public List<Article> getSearchTitle(String searchTitle) throws Exception {
		return articleRepository.getSearchTitle(searchTitle);
	}

	@Override
	public void addArticle(Article article) throws Exception {
		articleRepository.addArticle(article);
	}

	@Override
	public void modifyArticle(Article article) throws Exception {
		articleRepository.modifyArticle(article);
	}

	@Override
	public void deleteArticle(int a_no) throws Exception {
		articleRepository.deleteArticle(a_no);
	}

	@Override
	public void addComment(ArticleComment articleComment) throws Exception {
		articleRepository.addComment(articleComment);
	}




}
