package com.studycafe.scafe.reservation.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.studycafe.scafe.reservation.domain.RoomReservation;
import com.studycafe.scafe.reservation.service.RoomReservationService;

import net.sf.json.JSONObject;





@Controller
public class RoomReservationController {

	@Autowired
	RoomReservationService roomReservationService;
	
	@GetMapping("/reservationMain")
	public String reservation() {
		return "reservationMain";
	}
	
	@GetMapping("/reservationDetailA")
	public String getReservationDetailA(Model model) throws Exception {
		List<RoomReservation> list = roomReservationService.getReservationDetail(999);
		model.addAttribute("list", list);
		return "reservationDetailA";
	}
	
	@GetMapping("/reservationDetailB")
	public String getReservationDetailB(Model model) throws Exception {
		List<RoomReservation> list = roomReservationService.getReservationDetail(999);
		model.addAttribute("list", list);
		return "reservationDetailB";
	}
	
	@GetMapping("/reservationDetailC")
	public String getReservationDetailC(Model model) throws Exception {
		List<RoomReservation> list = roomReservationService.getReservationDetail(999);
		model.addAttribute("list", list);
		return "reservationDetailC";
	}
	
	@GetMapping("/reservationDetailD")
	public String getReservationDetailD(Model model) throws Exception {
		List<RoomReservation> list = roomReservationService.getReservationDetail(999);
		model.addAttribute("list", list);
		return "reservationDetailD";
	}
	
	@PostMapping("/reservationSuccess")
	public String reservationSuccess(RoomReservation roomReservation) throws Exception {
		int cnt = roomReservationService.insertRoomReservation(roomReservation);
		System.out.println("cnt="+cnt);
		return "reservationSuccess";
	}
	
	@GetMapping("/reservationConfirm")
	public String getReservationConfirm(Model model) throws Exception {
		
		 List<RoomReservation> list 
		 = roomReservationService.getReservationDetail(999); model.addAttribute("list",
		 list);

		return "reservationConfirm";
	}
	
	/*
	 * @RequestMapping(value="/timeCheck", method=RequestMethod.POST,
	 * produces="application/text;charset=utf8")
	 * 
	 * @ResponseBody public String keywordSearch(@RequestParam("rs_date") String
	 * rs_date) throws Exception {
	 * 
	 * if(rs_date==null) return null;
	 * 
	 * //리턴 List<RoomReservation> : 
	 * 책이름 목록 RoomReservation roomReservation =
	 * roomReservationService.timeCheckA(rs_date);
	 * 
	 * //JSONObject객체생성 
	 * JSONObject jsonObject = new JSONObject();
	 * jsonObject.put("list",roomReservation); 
	 * System.out.println(roomReservation);
	 * 
	 * 
	 * //JSONObject객체를 문자열로 변환 String jsonInfo = jsonObject.toString();
	 * 
	 * return jsonInfo; //클라이언트에게 응답 }
	 */
	
   @RequestMapping(value="/timeCheckA",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckA(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
    //리턴      List<RoomReservation> : 책이름 목록
   List<RoomReservation> roomReservation = roomReservationService.timeCheckA(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckB",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckB(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
    //리턴      List<RoomReservation> : 책이름 목록
   List<RoomReservation> roomReservation = roomReservationService.timeCheckB(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckC",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckC(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
    //리턴      List<RoomReservation> : 책이름 목록
   List<RoomReservation> roomReservation = roomReservationService.timeCheckC(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
   @RequestMapping(value="/timeCheckD",
   method=RequestMethod.POST,
   produces="application/text;charset=utf8")
   @ResponseBody
   public String timeCheckD(@RequestParam("rs_date") String rs_date) throws Exception {

   if(rs_date==null)
       return null;
    
    //리턴      List<RoomReservation> : 책이름 목록
   List<RoomReservation> roomReservation = roomReservationService.timeCheckD(rs_date);
    
   JSONObject jsonObject = new JSONObject();
   jsonObject.put("time", roomReservation);
   String jsonInfo = jsonObject.toString();
    
    return jsonInfo; //클라이언트에게 응답
	 }
   
	
	@GetMapping("/slider")
	public String slider() {
		
		return "/reservation/slider";
	}
	
	
}
