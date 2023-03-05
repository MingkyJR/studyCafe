package com.studycafe.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaPage;
import com.studycafe.qna.domain.SearchPage;
import com.studycafe.qna.domain.User;
import com.studycafe.qna.domain.WriteRequest;
import com.studycafe.qna.repository.QnaRepository;

@Service
public class QnaServiceImpl implements QnaService {

		@Autowired
		private QnaRepository qnaRepository;

		@Override
		public QnaPage getQnaPage(Page page) {
			int total = qnaRepository.selectCount();//전체 게시물수 
			//int calNo=(pageNo-1)*size;
			List<Qna> qnaList = qnaRepository.select(page); 
			return new QnaPage(total, page.getPageNo(), page.getRowSize(), qnaList);
		}
			
		@Override
		public QnaPage getQnaPage(SearchPage sPage) { //리턴 유형이 바뀜
			int sTotal = qnaRepository.searchSelectCount(sPage);//q_title전체 게시물수 
			//int calNo=(pageNo-1)*size;
			System.out.println("sPage : "+sPage);
			List<Qna> sQnaList = qnaRepository.searchSelect(sPage); 
			System.out.println("sNoticeList결과값은 무엇인가요"+sQnaList);
			return new QnaPage(sTotal, sPage.getPageNo(), sPage.getRowSize(), sQnaList);
		}

//		@Override
//		public List<QnaFile> listFile() {
//				List<QnaFile> qnaFile = qnaRepository.listFile();
//				return qnaFile;
//
//		}

		
		@Override
		public Qna getQnaDetail(int no, boolean increaseReadCount) {
			
				Qna qna = qnaRepository.selectById(no);
				if(qna==null) { //qna테이블에서 특정글번호에 해당하는 레코드 존재X
					throw new QnaNotFoundException();
				}
				//특정글번호 상세조회시 조회수 증가
				if(increaseReadCount) {
					qnaRepository.increaseReadCount(no);
				}
				return qna;
		}
		
		public int addQnaWrite(WriteRequest writeReq, User user) {
			return 0;
			
		}
}
