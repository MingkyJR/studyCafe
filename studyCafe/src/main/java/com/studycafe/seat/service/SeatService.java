package com.studycafe.seat.service;

import java.util.List;

import com.studycafe.seat.domain.History;
import com.studycafe.seat.domain.Member;
import com.studycafe.seat.domain.Seat;

public interface SeatService {

		public Member showLoginUser(String userId)throws Exception;
		
		public List<Seat> showSeat()throws Exception;
		
		public History showUser(int hno) throws Exception;
		

	    public boolean reserveSeat(int seatNumber,int hno) throws Exception;
	    
	 
	    public void cancelSeat(int seatNumber,int hno) throws Exception;
	    	
	    public List<History> historyList()throws Exception;


	
	
}//.
