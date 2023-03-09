package com.studycafe.seat.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.domain.Member;
import com.studycafe.seat.domain.Seat;

@Repository
public class SeatRepositoryImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	public Member showLoginUser(String id) {
		return sqlSession.selectOne("mapper.seat.userInfo",id);
	}
	
	public List<Seat> showSeat(){
		
		return sqlSession.selectList("mapper.seat.seatList");
	}
	
	public History showUser(int hno) {
		
		return sqlSession.selectOne("mapper.seat.historySelect",hno);
	}
	public Seat findBySeat(int seatNumber) {
		
		
		return sqlSession.selectOne("mapper.seat.findBySeat",seatNumber);
	}
	
	public boolean reserveSeat(Seat seat) {
		
		int result=sqlSession.update("mapper.seat.choiceSeat",seat.getS_number());
		
		if(result==1) {
		return true;
		
		}else {
		return false;
		}//else끝
	}
	
	public void cancelSeat(int seatNumber) {
		sqlSession.update("mapper.seat.cancelSeat", seatNumber);
		
	}
	
	
	
}
