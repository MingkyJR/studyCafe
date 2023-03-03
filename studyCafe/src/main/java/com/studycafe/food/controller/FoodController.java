package com.studycafe.food.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studycafe.food.domain.Cart;
import com.studycafe.food.domain.Food;
import com.studycafe.food.service.FoodService;


@Controller
public class FoodController {

	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	
	@Autowired
	FoodService foodService;
	
	//main페이지 호출
	@GetMapping("/food/main")
	public String reqMain(Model model,@RequestParam(name="type",required = false,defaultValue = "0")int type) throws Exception {
		List<Food> list = null;
		int user_number = 1;
		List<Cart> cartList = foodService.getCart(user_number);
		if(type==0) {
			list = foodService.getFoodList();
		}else {
			list = foodService.getTypeFoodList(type);
		}
				
		
		model.addAttribute("list", list);
		model.addAttribute("cartList", cartList);
		return "/food/main";
	}
	
	@GetMapping("/food/cart")
	public String reqCart(Model model, @RequestParam(name="user_number")int user_number) throws Exception {
		List<Cart> cartList = foodService.getCart(user_number);
		model.addAttribute("list", cartList);
	
		return "food/cart";
	}
	
	
	/*
	 * @GetMapping("/food/addCart") public String addCart(@RequestParam int food_no)
	 * { int user_number = 1;
	 * 
	 * }
	 */
	 
}

