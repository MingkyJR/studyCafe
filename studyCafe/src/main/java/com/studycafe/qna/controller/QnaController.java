package com.studycafe.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.studycafe.qna.domain.QnaFile;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;

	//qna 게시글 전체 조회
	@RequestMapping(value="/qna/list", method=RequestMethod.GET)
	public String qnaList(Model model,HttpServletRequest request) throws Exception {
		
		//1.파라미터 얻기(향후 보고싶은 페이지)
		String strPageNo = request.getParameter("pageNo");//보고싶은 페이지
		int pageNo = 1;
		if(strPageNo!=null) {
			pageNo=Integer.parseInt(strPageNo);
		}

		String strRowSize = request.getParameter("rowSize");//한페이지당 보여지는 게시물 수
		int rowSize = 3;
		if(strRowSize!=null) {
			rowSize = Integer.parseInt(strRowSize);			
		}

		//?choice=title&keyword=~~
		String strChoice = request.getParameter("choice");//view페이지 내에 select 태그 id
		String choice = "";
		if(strChoice!=null) {
			choice=strChoice;
		}
		String strKeyword = request.getParameter("keyword");//유저 검색 키워드
		String keyword = "";
		if(strKeyword!=null) {
			keyword=strKeyword;
		}
		
		System.out.println("초이스는"+choice);
		System.out.println("검색어는는"+keyword);
		
		//2.비즈니스 로직 수행 -> Service -> DAO -> DB -> DAO -> Service -> 비즈니스 로직 수행(되돌아 온다)
		QnaPage qnaPage = null;
		if(keyword==null || keyword=="") {
			qnaPage = qnaService.getQnaPage(pageNo, rowSize);	//원래소스
		}else {
			qnaPage = qnaService.getQnaPage(choice, keyword, pageNo, rowSize);
		}
		List<QnaFile> qnaFile = qnaService.listFile();

		model.addAttribute("qnaPage", qnaPage);
		model.addAttribute("qnaFile", qnaFile);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("rowSize", rowSize);
		model.addAttribute("choice", choice);
		model.addAttribute("keyword", keyword);
		System.out.println("List 결과"+qnaFile);
		
		//4.View지정
		return "qna/listQna";
	}

}