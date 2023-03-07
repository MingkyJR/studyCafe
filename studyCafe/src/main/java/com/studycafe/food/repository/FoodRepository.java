package com.studycafe.food.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;

public interface FoodRepository {
	
	//전체 목록 조회
	public List<Food> getFoodList() throws DataAccessException;
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws DataAccessException;
	
	//장바구니 조회
	public List<Cart> getCart(int u_number) throws DataAccessException;
	
	//장바구니 상품 존재하는지
	public Cart existCart(Cart cart) throws DataAccessException;
	
	//장바구니에 상품 추가
	public void addCart(Cart cart) throws DataAccessException;
	
	//장바구니 상품 수량+
	public void upQuantity(Cart cart) throws DataAccessException;
	
	//장바구니 상품 수량-
	public void downQuantity(Cart cart) throws DataAccessException;
	
	//장바구니 상품 삭제
	public void deleteCart(Cart cart) throws DataAccessException;
	
	//장바구니 상품 전부 삭제
	public void deleteAllCart(int u_number) throws DataAccessException;
	
	//결제 완료 후 주문추가
	public void insertOrder(Map<String, Object> map) throws DataAccessException;
	
	//결제 완료 후 상세 주문 추가
	public void insertDetail(Map<String, Object> map) throws DataAccessException;
	
}
