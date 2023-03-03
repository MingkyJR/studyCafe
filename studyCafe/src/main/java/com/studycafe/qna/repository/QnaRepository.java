package com.studycafe.qna.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.qna.domain.Qna;
import com.studycafe.qna.domain.QnaFile;

public interface QnaRepository {

	public int selectCount() throws DataAccessException;

	public List<Qna> select(int calNo, int size) throws DataAccessException;

	public int searchSelectCount(String choice, String keyword) throws DataAccessException;

	public List<Qna> searchSelect(String choice, String keyword, int i, int size) throws DataAccessException;

	public List<QnaFile> listFile() throws DataAccessException;
	
}
