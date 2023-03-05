package com.studycafe.qna.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaFile;
import com.studycafe.qna.domain.SearchPage;

@Repository
public class QnaRepositoryImpl implements QnaRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectCount() {
		return sqlSession.selectOne("mapper.qna.qnaTotalCnt");
	}

	@Override
	public List<Qna> select(Page page) {
		List<Qna> pageResult = sqlSession.selectList("mapper.qna.qnaAllList", page);
		System.out.println("page"+page);
		System.out.println("pageresult"+pageResult);
		return pageResult;
	}

	@Override
	public int searchSelectCount(SearchPage sPage) {
		int sCntResult = sqlSession.selectOne("mapper.qna.qnaSearchTotalCnt", sPage);
		System.out.println("값시다 결과값 숫자"+sCntResult);
		return sCntResult;
	}

	@Override
	public List<Qna> searchSelect(SearchPage sPage) {
		System.out.println("asdasd sPage"+sPage);
		List<Qna> sPageResult = sqlSession.selectList("mapper.qna.qnaSearchAllList", sPage);
		System.out.println("갑시다 결과값"+sPageResult);
		return sPageResult;
	}

	@Override
	public List<QnaFile> listFile() {
		return null;
	}

	@Override
	public Qna selectById(int no) throws DataAccessException {
		Qna qnaDetailResult = sqlSession.selectOne("mapper.qna.qnaDetail", no);
		System.out.println("qnaDetailResult 야 넘어와라"+qnaDetailResult);
		return qnaDetailResult;
	}

	@Override
	public int increaseReadCount(int no) throws DataAccessException {
		int increCnt = sqlSession.update("mapper.qna.qnaReadCnt", no);
		System.out.println("increCnt야 넘어와라"+increCnt);
		return increCnt;
	}
}
