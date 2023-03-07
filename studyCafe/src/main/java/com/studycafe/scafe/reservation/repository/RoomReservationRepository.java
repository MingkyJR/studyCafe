package com.studycafe.scafe.reservation.repository;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.studycafe.scafe.reservation.domain.RoomReservation;

public interface RoomReservationRepository {

	//예약하기
	public int insertRoomReservation(RoomReservation roomReservation) throws DataAccessException;
	
	//전체 예약조회
	public List<RoomReservation> getAllReservationDetail() throws DataAccessException;
	
	//특정 예약조회
	public List<RoomReservation> getReservationDetail(int user_number) throws DataAccessException;
	
	//날짜별 예약가능 조회
	public RoomReservation timeCheckA(String rs_date) throws DataAccessException;
	
	
	
}
