package com.studycafe.qna.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.qna.domain.Page;
import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaFile;
import com.studycafe.qna.domain.SearchPage;

public interface QnaRepository {

	public int selectCount() throws DataAccessException;

	public List<Qna> select(Page page) throws DataAccessException;
	

	public int searchSelectCount(SearchPage sPage) throws DataAccessException;

	public List<Qna> searchSelect(SearchPage sPage) throws DataAccessException;

	public List<QnaFile> listFile() throws DataAccessException;

	public Qna selectById(int no) throws DataAccessException;

	public int increaseReadCount(int no) throws DataAccessException;
	
}
