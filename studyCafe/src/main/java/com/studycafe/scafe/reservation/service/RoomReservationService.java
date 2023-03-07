package com.studycafe.scafe.reservation.service;

import java.util.Date;
import java.util.List;


import com.studycafe.scafe.reservation.domain.RoomReservation;

public interface RoomReservationService {

	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws Exception;
	
	//전체 예약 조회
	public List<RoomReservation> getAllReservationDetail() throws Exception;
	
	//특정 예약 조회
	public List<RoomReservation> getReservationDetail(int user_number) throws Exception;
	
	//날짜별 예약가능 조회
	public RoomReservation timeCheckA(String rs_date) throws Exception;
	
}
