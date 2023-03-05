package com.studycafe.food.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int u_number = 1;
		List<Cart> cartList = foodService.getCart(u_number);
		if(type==0) {
			list = foodService.getFoodList();
		}else {
			list = foodService.getTypeFoodList(type);
		}
				
		
		model.addAttribute("list", list);
		model.addAttribute("cartList", cartList);
		model.addAttribute("type", type);
		return "/food/mainP";
	}
	
	//장바구니에 상품 추가
	@GetMapping("/food/addCart")
	public void addCart(int food_no,int type, HttpServletResponse res) throws Exception {
		int u_number = 1;
		Cart cart = new Cart(u_number, food_no);
		foodService.addCart(cart);
		if(type==0) {
			res.sendRedirect("/scafe/food/main");
		}else {
			res.sendRedirect("/scafe/food/main?type="+type);
		}
	}
	
	@GetMapping("/food/changeQ")
	public void changeQuantity(int pm, int food_no,int type, HttpServletResponse res) throws Exception {
		int u_number = 1;
		Cart cart = new Cart(u_number, food_no);
		if(pm == 1) {
			foodService.upQuantity(cart);
		}else {
			foodService.downQuantity(cart);
		}
		
		if(type==0) {
			res.sendRedirect("/scafe/food/main");
		}else {
			res.sendRedirect("/scafe/food/main?type="+type);
		}
	}
	
	@GetMapping("/food/deleteCart")
	public void deleteCart(int food_no,int type, HttpServletResponse res) throws Exception {
		int u_number = 1;
		Cart cart = new Cart(u_number, food_no);
		foodService.deleteCart(cart);
		if(type==0) {
			res.sendRedirect("/scafe/food/main");
		}else {
			res.sendRedirect("/scafe/food/main?type="+type);
		}
	}
	
	
	
	 
}

