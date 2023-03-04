package com.studycafe.qna.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaFile;

@Repository
public class QnaRepositoryImpl implements QnaRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectCount() {
		return sqlSession.selectOne("mapper.qna.qnaTotalCnt" );
	}

	@Override
	public List<Qna> select(int calNo, int size) {
		return sqlSession.selectList("mapper.qna.qnaAllList");
	}

	@Override
	public int searchSelectCount(String choice, String keyword) {
		return 0;
	}

	@Override
	public List<Qna> searchSelect(String choice, String keyword, int i, int size) {
		return null;
	}

	@Override
	public List<QnaFile> listFile() {
		return null;
	}
}
