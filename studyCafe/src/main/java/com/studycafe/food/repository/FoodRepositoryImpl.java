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
	@Override
	public List<Food> getFoodList() throws DataAccessException {
		List<Food> list = sqlSession.selectList("mapper.food.listFood");
		return list;
	}
	
	//특정 종류 조회
	@Override
	public List<Food> getTypeFoodList(int type) throws DataAccessException {
		List<Food> list = sqlSession.selectList("mapper.food.listTypeFood", type);
		return list;
	}
	
	//장바구니 조회
	@Override
	public List<Cart> getCart(int u_number) throws DataAccessException {
		List<Cart> list = sqlSession.selectList("mapper.food.getCart", u_number);
		return list;
	}
	
	//장바구니 상품 존재하는지
	public Cart existCart(Cart cart) throws DataAccessException {
		Cart result = sqlSession.selectOne("mapper.food.existCart", cart);
		return result;
	}
	
	//장바구니에 상품 추가
	@Override
	public void addCart(Cart cart) throws DataAccessException {
		int cnt = sqlSession.insert("mapper.food.addCart", cart);
		System.out.println("insert결과="+cnt);
	}
	
	//장바구니 상품 수량+
	@Override
	public void upQuantity(Cart cart) throws DataAccessException {
		sqlSession.update("mapper.food.upQuantity", cart);
	}
	
	//장바구니 상품 수량-
	@Override
	public void downQuantity(Cart cart) throws DataAccessException {
		sqlSession.update("mapper.food.downQuantity", cart);
	}
	
	//장바구니 상품 삭제
	@Override
	public void deleteCart(Cart cart) throws DataAccessException {
		sqlSession.delete("mapper.food.deleteCart", cart);
	}
}
