package com.studycafe.food.domain;

public class Food {
	
	private int food_no;
	private String food_name;
	private String food_content;
	private int food_price;
	private String fileName;
	
	public Food() {}

	public int getFood_no() {
		return food_no;
	}

	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_content() {
		return food_content;
	}

	public void setFood_content(String food_content) {
		this.food_content = food_content;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Food [food_no=" + food_no + ", food_name=" + food_name + ", food_content=" + food_content
				+ ", food_price=" + food_price + ", fileName=" + fileName + "]";
	}

	
	

}
