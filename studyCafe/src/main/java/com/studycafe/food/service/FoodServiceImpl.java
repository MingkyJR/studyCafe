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
	public List<Cart> getCart(int user_number) throws Exception{
		return foodRepository.getCart(user_number);
	}
}
