package com.studycafe.food.service;

import java.util.List;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;

public interface FoodService {
	
	//전체 목록 조회
	public List<Food> getFoodList() throws Exception;
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws Exception;
	
	//장바구니 조회
	public List<Cart> getCart(int u_number) throws Exception;
	
	//장바구니에 상품 추가
	public void addCart(Cart cart) throws Exception;
	
	//장바구니 상품 수량+
	public void upQuantity(Cart cart) throws Exception;
	
	//장바구니 상품 수량-
	public void downQuantity(Cart cart) throws Exception;
	
	//장바구니 상품 삭제
	public void deleteCart(Cart cart) throws Exception;
}
