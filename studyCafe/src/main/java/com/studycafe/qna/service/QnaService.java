package com.studycafe.qna.service;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;
import com.studycafe.qna.domain.User;
import com.studycafe.qna.domain.WriteRequest;


public interface QnaService {

	
	public QnaPage getQnaPage(Page page) throws Exception;
	
	public QnaPage getQnaPage(SearchPage sPage) throws Exception;

	//public List<QnaFile> listFile() throws Exception;

	public Qna getQnaDetail(int no, boolean b) throws Exception;
	
	public int addQnaWrite(WriteRequest writeReq, User user) throws Exception;
	
	
	
	

	
	
}
