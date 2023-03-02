package com.studycafe.food.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;

public interface FoodRepository {
	
	//전체 목록 조회
	public List<Food> getFoodList() throws DataAccessException;
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws DataAccessException;
	
	//장바구니 조회
	public List<Cart> getCart(int user_number) throws DataAccessException;
}
