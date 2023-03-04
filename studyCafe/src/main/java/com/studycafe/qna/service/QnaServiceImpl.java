package com.studycafe.qna.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaFile;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {

		@Autowired
		private QnaRepository qnaRepository;

		@Override
		public QnaPage getQnaPage(int pageNo, int size) {
			int total = qnaRepository.selectCount();//전체 게시물수 
			int calNo=(pageNo-1)*size;
			List<Qna> qnaList = qnaRepository.select(calNo, size); 
			return new QnaPage(total, pageNo, size, qnaList);
		}
			
		@Override
		public QnaPage getQnaPage(String choice, String keyword, int pageNo, int size) { //리턴 유형이 바뀜
			int sTotal = qnaRepository.searchSelectCount(choice, keyword);//전체 게시물수 
			int calNo=(pageNo-1)*size;
			List<Qna> sNoticeList = qnaRepository.searchSelect(choice, keyword, calNo, size); 
			return new QnaPage(sTotal, pageNo, size, sNoticeList);
		}

		@Override
		public List<QnaFile> listFile() {
				List<QnaFile> qnaFile = qnaRepository.listFile();
				return qnaFile;

		}
	
}
