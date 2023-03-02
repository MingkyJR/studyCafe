package com.studycafe.scafe.qna.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.scafe.qna.domain.Qna;
import com.studycafe.scafe.qna.domain.QnaFile;
import com.studycafe.scafe.qna.domain.QnaPage;
import com.studycafe.scafe.qna.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {

		@Autowired
		private QnaRepository qnaRepository;

		@Override
		public QnaPage getQnaPage(int pageNo, int size) { //원래소스

			int total = qnaRepository.selectCount();//전체 게시물수 //원래소스
			List<Qna> qnaList = qnaRepository.select((pageNo-1)*size, size); //원래소스
			
			return new QnaPage(total, pageNo, size, qnaList);
			
		}
			
		@Override
		public QnaPage getQnaPage(String choice, String keyword, int pageNo, int size) { //리턴 유형이 바뀜
				
			int sTotal = qnaRepository.searchSelectCount(choice, keyword);//전체 게시물수 
			List<Qna> sNoticeList = qnaRepository.searchSelect(choice, keyword, (pageNo-1)*size, size); 
			
			return new QnaPage(sTotal, pageNo, size, sNoticeList);
		}


		public List<QnaFile> listFile() {
				List<QnaFile> qnaFile = qnaRepository.listFile();
				return qnaFile;

		}
	
}
