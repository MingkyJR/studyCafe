package com.studycafe.qna.service;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;


public interface QnaService {

	
	public QnaPage getQnaPage(Page page) throws Exception;
	
	public QnaPage getQnaPage(SearchPage sPage) throws Exception;

	public Qna getQnaDetail(int no, boolean increaseReadCount) throws Exception;
	
	public void addQnaWrite(Qna qna) throws Exception;

	public void modifyQna(Qna qna) throws Exception;

	public void deleteQna(int no) throws Exception;
	
	

	
	
}
