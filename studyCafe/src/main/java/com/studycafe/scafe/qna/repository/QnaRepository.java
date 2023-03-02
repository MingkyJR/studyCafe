package com.studycafe.scafe.qna.repository;

import java.util.List;

import com.studycafe.scafe.qna.domain.Qna;
import com.studycafe.scafe.qna.domain.QnaFile;

public interface QnaRepository {

	public int selectCount();

	public List<Qna> select(int i, int size);

	public int searchSelectCount(String choice, String keyword);

	public List<Qna> searchSelect(String choice, String keyword, int i, int size);

	public List<QnaFile> listFile();
	
}
