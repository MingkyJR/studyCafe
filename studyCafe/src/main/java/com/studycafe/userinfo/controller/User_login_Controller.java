package com.studycafe.userinfo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.studycafe.userinfo.domain.User_info;
import com.studycafe.userinfo.service.User_login_Service;
import com.studycafe.userinfo.service.User_login_ServiceImpl;

	
//로그인관련 controller
	@Controller //현재 클래스를 스프링에서 관리하는 컨트롤러 bean생성
	@RequestMapping("/user/*") //모든 맵핑은 /user를 상속
	public class User_login_Controller {
	
		private static final Logger logger = LoggerFactory.getLogger(User_login_Controller.class);
		
		@Inject
		User_login_ServiceImpl user_login_Service;
	
		//01 로그인화면
		@RequestMapping("login.do")
		public String login() {
			return "user/login"; //view/user/login.jsp 
			//경로 : src->main->webapp->web-inf->views->user
			
		}
		
		//02 로그인처리
		@RequestMapping("loginCheck.do")
		public ModelAndView loginCheck(@ModelAttribute User_info user_login, HttpSession session) {
			boolean result = User_login_Service.loginCheck(user_login, session);
			ModelAndView mav = new ModelAndView(); //mav는 ModelAndView의 약어
			//로그인성공
			if(result == true) { 
				mav.setViewName("home");
				mav.addObject("msg", "succes");
			}
			//로그인실패
			else {
				//login.jsp로 이동
				mav.setViewName("user/login");
				mav.addObject("msg","failuer");
			}
			return mav; 
		}
		
		// 로그아웃처리
		
		
		
		
}//class의 끝
