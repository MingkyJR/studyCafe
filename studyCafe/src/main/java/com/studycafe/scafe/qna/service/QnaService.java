package com.studycafe.scafe.qna.service;

import com.studycafe.scafe.qna.domain.QnaPage;

public interface QnaService {

	
	public QnaPage getQnaPage(int pageNo, int size);
	
	public QnaPage getQnaPage(String choice, String keyword, int pageNo, int size);
	
	

	
	
}
