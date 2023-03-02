package com.studycafe.food.domain;

public class Cart {
	
	private int cart_no;
	private int user_number;
	private int food_no;
	private int quantity;
	
	private String food_name;
	private int food_price;
	
	public Cart() {}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getUser_number() {
		return user_number;
	}

	public void setUser_number(int user_number) {
		this.user_number = user_number;
	}

	public int getFood_no() {
		return food_no;
	}

	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", user_number=" + user_number + ", food_no=" + food_no + ", quantity="
				+ quantity + ", food_name=" + food_name + ", food_price=" + food_price + "]";
	}

	

	
	
	

}
