package com.studycafe.qna.service;

import java.util.List;

import com.studycafe.qna.domain.QnaFile;
import com.studycafe.qna.domain.QnaPage;

public interface QnaService {

	
	public QnaPage getQnaPage(int pageNo, int size) throws Exception;
	
	public QnaPage getQnaPage(String choice, String keyword, int pageNo, int size) throws Exception;

	public List<QnaFile> listFile() throws Exception;
	
	

	
	
}
