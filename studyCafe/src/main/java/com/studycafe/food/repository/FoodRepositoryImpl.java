package com.studycafe.food.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;

@Repository
public class FoodRepositoryImpl implements FoodRepository{
	
	@Autowired
	private SqlSession sqlSession;
	
	//음식 전체 목록조회
	public List<Food> getFoodList() throws DataAccessException {
		List<Food> list = sqlSession.selectList("mapper.food.listFood");
		return list;
	}
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws DataAccessException {
		List<Food> list = sqlSession.selectList("mapper.food.listTypeFood", type);
		return list;
	}
	
	//장바구니 조회
	public List<Cart> getCart(int user_number) throws DataAccessException {
		List<Cart> list = sqlSession.selectList("mapper.food.getCart", user_number);
		return list;
	}
}
