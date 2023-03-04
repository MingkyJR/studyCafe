package com.studycafe.food.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;
import com.studycafe.food.repository.FoodRepository;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Autowired
	FoodRepository foodRepository; 
	
	//전체 목록 조회
	public List<Food> getFoodList() throws Exception{
		return foodRepository.getFoodList();
	}
	
	//특정 종류 조회
	public List<Food> getTypeFoodList(int type) throws Exception{
		return foodRepository.getTypeFoodList(type);
	}
	
	//장바구니 조회
	public List<Cart> getCart(int u_number) throws Exception{
		return foodRepository.getCart(u_number);
	}
	
	//장바구니에 상품 추가
	public void addCart(Cart cart) throws Exception {
		foodRepository.addCart(cart);
	}
	
	//장바구니 상품 수량+
	public void upQuantity(Cart cart) throws Exception {
		foodRepository.upQuantity(cart);
	}
	
	//장바구니 상품 수량-
	public void downQuantity(Cart cart) throws Exception {
		foodRepository.downQuantity(cart);
	}
	
	//장바구니 상품 삭제
	public void deleteCart(Cart cart) throws Exception {
		foodRepository.deleteCart(cart);
	}
}
