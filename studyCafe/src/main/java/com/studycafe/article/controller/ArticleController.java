package com.studycafe.article.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.article.domain.Article;
import com.studycafe.article.domain.ArticleComment;
import com.studycafe.article.domain.ArticlePage;
import com.studycafe.article.domain.Login;
import com.studycafe.article.domain.Page;
import com.studycafe.article.service.ArticleService;

@Controller
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	
	@GetMapping("/login")
	public String login(Model model) throws Exception {
		return "example/login";
	}
	@GetMapping("/logined")
	public String logined(Login login,Model model,HttpServletRequest request) throws Exception {
		Login loginUser = articleService.getLogin(login);
		if(loginUser==null) {
			return null;
		}
		HttpSession session = request.getSession();
		session.setAttribute("AUTHUSER", loginUser);
		//model.addAttribute("AUTHUSER", loginUser);
		return "forward:/article/articleList";
	}
	
	
	//게시글전체조회
	@GetMapping("/article/articleList")
	public String articleList(Model model,HttpServletRequest request) throws Exception {
		
		
		String strPageNo = request.getParameter("pageNo"); //보고싶은페이지
		int pageNo = 1;   
		if(strPageNo!=null) {
			pageNo = Integer.parseInt(strPageNo);			
		}
		Page page = new Page(pageNo);
		
		ArticlePage articlePage  = articleService.getArticlePage(page);
		model.addAttribute("articlePage", articlePage);
		return "article/articleList";
	}
	
	//특정글 상세조회
	@GetMapping("/article/articleDetail")
	public String articleDetail(Model model,@RequestParam("no") int no) throws Exception{
		Article article = articleService.getArticleDetail(no);
		List<ArticleComment> articleCommemt = articleService.getCommentList(no);
		model.addAttribute("article",article);
		model.addAttribute("commemt",articleCommemt);
		return "article/articleDetail";
	}
	
	//특정글 검색
	@GetMapping("/article/searchTitle")
	public String searchTitle(Model model,String searchTitle) throws Exception {
		List<Article> articleList = articleService.getSearchTitle(searchTitle);
		model.addAttribute("articleList",articleList);
		return "article/searchTitle";
	}
	
	@GetMapping("/article/addArticleForm")
	public String addArticleForm(Model model) throws Exception{
		return "article/addArticleForm";
	}
	@GetMapping("/article/addArticle")
	public String addArticle(Article article) throws Exception{
		articleService.addArticle(article);
		return "redirect:/article/articleList";
	}
	@GetMapping("/article/modifyArticleForm")
	public String modifyArticleForm(@RequestParam("a_no") int a_no,Model model) throws Exception {
		Article article = articleService.getArticleDetail(a_no);
		model.addAttribute("article", article);
		return "article/modifyArticleForm";
	}
	
	@GetMapping("/article/modifyArticle")
	public String modifyArticle(@RequestParam("a_no") int a_no,
			@RequestParam("a_title") String a_title, 
			@RequestParam("a_content") String a_content,
			Model model) throws Exception {
		Article article = new Article();
		article.setA_no(a_no);
		article.setA_title(a_title);
		article.setA_content(a_content);
		
		articleService.modifyArticle(article);
		return "redirect:/article/articleDetail?no="+a_no;
	}
	
	@GetMapping("/article/deleteArticle")
	public String deleteArticle(@RequestParam("a_no") int a_no) throws Exception{
		articleService.deleteArticle(a_no);
		return "redirect:/article/articleList";
		
	}
	
	@GetMapping("/article/addComment")
	public String addComment(ArticleComment articleComment) throws Exception{
		articleService.addComment(articleComment);
		return "redirect:/article/articleDetail?no="+articleComment.getA_no();
	}
	
	
	@GetMapping("/article/modiCommentForm")
	public String articleModiComment(Model model,@RequestParam("no") int no,int ac_no) throws Exception{
		Article article = articleService.getArticleDetail(no);
		
		ArticleComment articleCommemt1 = articleService.getComment(ac_no);
		model.addAttribute("article",article);
		model.addAttribute("commemt",articleCommemt1);
		return "article/articleModiComment";
	}
	@GetMapping("/article/modiComment")
	public String modiComment(Model model,ArticleComment articleComment) throws Exception{
		System.out.println("articleComment="+articleComment);
		articleService.modiComment(articleComment);
		return "redirect:/article/articleDetail?no="+articleComment.getA_no();
	}
	
	
}
